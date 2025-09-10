FROM dart:3.8.0-sdk

WORKDIR /app

COPY pubspec.yaml pubspec.lock ./
RUN dart pub get

COPY . .

EXPOSE 8080

CMD ["sh", "-c", "dart run seed/seed.dart && dart run bin/server.dart"]
