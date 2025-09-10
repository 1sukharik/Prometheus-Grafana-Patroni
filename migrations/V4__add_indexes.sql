-- V4__add_indexes.sql
-- Добавляем индексы для ускорения JOIN и фильтрации по внешним ключам

-- 1. Адреса → customer_id
CREATE INDEX IF NOT EXISTS idx_address_customer_id
    ON address(customer_id);

-- 2. Товары → platform_id и category_id
CREATE INDEX IF NOT EXISTS idx_product_platform_id
    ON product(platform_id);
CREATE INDEX IF NOT EXISTS idx_product_category_id
    ON product(category_id);

-- 3. Способы доставки → carrier_id
CREATE INDEX IF NOT EXISTS idx_shipment_method_carrier_id
    ON shipment_method(carrier_id);

-- 4. Подписки на уведомления → customer_id и type_id (хотя первичный ключ по двум полям уже есть)
CREATE INDEX IF NOT EXISTS idx_notification_subscription_customer_id
    ON notification_subscription(customer_id);
CREATE INDEX IF NOT EXISTS idx_notification_subscription_type_id
    ON notification_subscription(type_id);

-- 5. Корзина → customer_id
CREATE INDEX IF NOT EXISTS idx_cart_customer_id
    ON cart(customer_id);

-- 6. Элементы корзины → cart_id и product_id
CREATE INDEX IF NOT EXISTS idx_cart_item_cart_id
    ON cart_item(cart_id);
CREATE INDEX IF NOT EXISTS idx_cart_item_product_id
    ON cart_item(product_id);

-- 7. Заказы → customer_id, address_id, shipment_method_id
CREATE INDEX IF NOT EXISTS idx_orders_customer_id
    ON orders(customer_id);
CREATE INDEX IF NOT EXISTS idx_orders_address_id
    ON orders(address_id);
CREATE INDEX IF NOT EXISTS idx_orders_shipment_method_id
    ON orders(shipment_method_id);

-- 8. Позиции заказа → order_id и product_id
CREATE INDEX IF NOT EXISTS idx_order_item_order_id
    ON order_item(order_id);
CREATE INDEX IF NOT EXISTS idx_order_item_product_id
    ON order_item(product_id);

-- 9. Платежи → order_id и method_id
CREATE INDEX IF NOT EXISTS idx_payment_order_id
    ON payment(order_id);
CREATE INDEX IF NOT EXISTS idx_payment_method_id
    ON payment(method_id);

-- 10. Отгрузки → order_id и shipment_method_id
CREATE INDEX IF NOT EXISTS idx_shipment_order_id
    ON shipment(order_id);
CREATE INDEX IF NOT EXISTS idx_shipment_shipment_method_id
    ON shipment(shipment_method_id);

-- 11. Информация трекинга → shipment_id
CREATE INDEX IF NOT EXISTS idx_tracking_info_shipment_id
    ON tracking_info(shipment_id);

-- 12. Возвраты → order_id
CREATE INDEX IF NOT EXISTS idx_refund_order_id
    ON refund(order_id);

-- 13. Позиции возврата → return_id (композитный PK уже есть для (return_id, order_item_order_id, order_item_product_id))
CREATE INDEX IF NOT EXISTS idx_return_item_return_id
    ON return_item(return_id);

-- 14. Обращения в службу поддержки → customer_id и order_id
CREATE INDEX IF NOT EXISTS idx_support_ticket_customer_id
    ON support_ticket(customer_id);
CREATE INDEX IF NOT EXISTS idx_support_ticket_order_id
    ON support_ticket(order_id);

-- 15. Сообщения в тикете → ticket_id
CREATE INDEX IF NOT EXISTS idx_ticket_message_ticket_id
    ON ticket_message(ticket_id);

-- 16. Отзывы → customer_id, product_id, order_id
CREATE INDEX IF NOT EXISTS idx_review_customer_id
    ON review(customer_id);
CREATE INDEX IF NOT EXISTS idx_review_product_id
    ON review(product_id);
CREATE INDEX IF NOT EXISTS idx_review_order_id
    ON review(order_id);

-- 17. Уведомления → customer_id и type_id
CREATE INDEX IF NOT EXISTS idx_notification_customer_id
    ON notification(customer_id);
CREATE INDEX IF NOT EXISTS idx_notification_type_id
    ON notification(type_id);
