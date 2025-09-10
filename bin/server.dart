import 'dart:io' show ContentType, HttpClient, HttpRequest, HttpServer, HttpStatus, InternetAddress, Platform;
import 'dart:convert';
import 'dart:async';

import 'package:prometheus_client/format.dart' as format;
import 'package:prometheus_client/prometheus_client.dart';
import 'package:prometheus_client/runtime_metrics.dart' as runtime_metrics;
import 'package:postgres/postgres.dart';

Future<void> main() async {

  runtime_metrics.register();

  final durationHistogram = Histogram(
    name: 'http_request_duration_seconds',
    help: 'Длительность HTTP-запросов в секундах.',
  )..register();

  final requestsCounter = Counter(
    name: 'metric_requests_total',
    help: 'Общее число запросов к метрикам.',
    labelNames: ['path'],
  )..register();

  final host = Platform.environment['POSTGRES_HOST'] ?? 'haproxy';
  final port = int.parse(Platform.environment['POSTGRES_PORT'] ?? '5432');
  final dbName = Platform.environment['POSTGRES_DB'] ?? 'postgresdb';
  final user = Platform.environment['POSTGRES_USER'] ?? 'postgres';
  final pass = Platform.environment['POSTGRES_PASSWORD'] ?? 'postgres';

  final connection = PostgreSQLConnection(
    host,
    port,
    dbName,
    username: user,
    password: pass,
  );

  try {
    await connection.open();
  } catch (e) {
    return;
  }

  final server = await HttpServer.bind(
    InternetAddress.anyIPv4,
    8080,
  );

  Timer.periodic(Duration(seconds: 1), (_) async {
    final client = HttpClient();
    try {
      final request = await client.getUrl(
        Uri.parse('http://localhost:8080/customer/120/orders'),
      );
      final request1 = await client.getUrl(
        Uri.parse('http://localhost:8080/customer/621/orders'),
      );
      final request2 = await client.getUrl(
        Uri.parse('http://localhost:8080/customer/807/orders'),
      );
      final response = await request.close();
      await response.drain();

      final response1 = await request1.close();
      await response1.drain();

      final response2 = await request2.close();
      await response2.drain();
    } catch (e) {
      print('Ошибка при фоновом опросе: $e');
    } finally {
      client.close();
    }
  });

  await for (HttpRequest request in server) {
    await durationHistogram.observeDuration(Future(() async {
      requestsCounter.labels([request.uri.path]).inc();

      if (request.uri.path == '/metrics') {
        try {
          request.response.headers.set('content-type', format.contentType);
          final metrics = await CollectorRegistry.defaultRegistry.collectMetricFamilySamples();
          format.write004(request.response, metrics);
          await request.response.close();
          return;
        } catch (e) {
          if (!request.response.headers.toString().contains('text/plain')) {
            request.response.statusCode = HttpStatus.internalServerError;
            request.response.headers.contentType = ContentType.text;
            request.response.write('Ошибка генерации Prometheus метрик: $e');
          }
          try {
            await request.response.close();
          } catch (closeError) {
            print('/metrics ошибка при закрытии ответа в блоке catch: $closeError');
          }
          return;
        }
      }

      final regExp = RegExp(r'^/customer/(\d+)/orders$');
      final match = regExp.firstMatch(request.uri.path);
      if (match != null) {
        final customerId = int.parse(match.group(1)!);
        try {

          final rows = await connection.mappedResultsQuery('''
    SELECT u.id         AS customer_id,
           u.first_name, u.last_name, u.email,
           addr.city, addr.region,
           o.id         AS order_id, o.status, o.total_amount, o.currency,
           oi.product_id, oi.quantity, oi.unit_price,
           p.name       AS product_name,
           c.name       AS category_name,
           sm.name      AS shipment_method,
           lc.name      AS carrier
    FROM customer u
      JOIN address addr         ON addr.customer_id      = u.id
      JOIN orders o             ON o.customer_id         = u.id
      JOIN order_item oi        ON oi.order_id           = o.id
      JOIN product p            ON p.id                  = oi.product_id
      JOIN category c           ON c.id                  = p.category_id
      JOIN shipment_method sm   ON sm.id                 = o.shipment_method_id
      JOIN logistic_company lc  ON lc.id                 = sm.carrier_id
    WHERE u.id = @userId
  ''', substitutionValues: {'userId': customerId});

          request.response.headers.contentType = ContentType.json;
          request.response.write(jsonEncode(rows));
        } catch (e) {
          request.response.statusCode = HttpStatus.internalServerError;
          request.response.headers.contentType = ContentType.json;
          request.response.write(
              jsonEncode({'error': 'Ошибка при запросе к базе данных', 'details': e.toString()})
          );
        }
        await request.response.close();
      } else {

        request.response.statusCode = HttpStatus.notFound;
        request.response.headers.contentType = ContentType.text;
        request.response.write('Not Found');
        await request.response.close();
      }
    }));
  }
}
