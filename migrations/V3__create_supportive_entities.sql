CREATE TABLE IF NOT EXISTS cart (
     id SERIAL PRIMARY KEY,
     customer_id INTEGER NOT NULL,
     FOREIGN KEY (customer_id) REFERENCES customer(id) ON DELETE CASCADE
    );

CREATE TABLE IF NOT EXISTS cart_item (
    cart_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (cart_id, product_id),
    FOREIGN KEY (cart_id) REFERENCES cart(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
    );

CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    address_id INTEGER NOT NULL,
    shipment_method_id INTEGER NOT NULL,
    payment_id INTEGER,
    status VARCHAR(255) NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(id) ON DELETE RESTRICT,
    FOREIGN KEY (address_id) REFERENCES address(id) ON DELETE RESTRICT,
    FOREIGN KEY (shipment_method_id) REFERENCES shipment_method(id) ON DELETE RESTRICT
    );

CREATE TABLE IF NOT EXISTS order_item (
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE RESTRICT
    );

CREATE TABLE IF NOT EXISTS payment (
    id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    method_id INTEGER NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (method_id) REFERENCES payment_method(id) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS shipment (
    id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    shipment_method_id INTEGER NOT NULL,
    shipped_at TIMESTAMP,
    estimated_delivery DATE,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (shipment_method_id) REFERENCES shipment_method(id) ON DELETE RESTRICT
    );

CREATE TABLE IF NOT EXISTS tracking_info (
    id SERIAL PRIMARY KEY,
    shipment_id INTEGER NOT NULL,
    tracking_number VARCHAR(255) NOT NULL,
    FOREIGN KEY (shipment_id) REFERENCES shipment(id) ON DELETE CASCADE
    );

CREATE TABLE IF NOT EXISTS refund (
    id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    reason TEXT NOT NULL,
    status VARCHAR(255) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
    );

CREATE TABLE IF NOT EXISTS return_item (
    return_id INTEGER NOT NULL,
    order_item_order_id INTEGER NOT NULL,
    order_item_product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (return_id, order_item_order_id, order_item_product_id),
    FOREIGN KEY (return_id) REFERENCES refund(id) ON DELETE CASCADE,
    FOREIGN KEY (order_item_order_id, order_item_product_id) REFERENCES order_item(order_id, product_id) ON DELETE CASCADE
    );

CREATE TABLE IF NOT EXISTS support_ticket (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_id INTEGER,
    subject VARCHAR(255) NOT NULL,
    status VARCHAR(255) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(id) ON DELETE CASCADE,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE SET NULL
    );

CREATE TABLE IF NOT EXISTS ticket_message (
    id SERIAL PRIMARY KEY,
    ticket_id INTEGER NOT NULL,
    author_type VARCHAR(255) NOT NULL,
    author_id INTEGER NOT NULL,
    message VARCHAR(255) NOT NULL,
    FOREIGN KEY (ticket_id) REFERENCES support_ticket(id) ON DELETE CASCADE
    );

CREATE TABLE IF NOT EXISTS review (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    order_id INTEGER NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES customer(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
    );

CREATE TABLE IF NOT EXISTS notification (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    type_id INTEGER NOT NULL,
    content TEXT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(id) ON DELETE CASCADE,
    FOREIGN KEY (type_id) REFERENCES notification_type(id) ON DELETE CASCADE
    );
