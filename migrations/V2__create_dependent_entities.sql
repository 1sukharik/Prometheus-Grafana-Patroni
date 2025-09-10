CREATE TABLE IF NOT EXISTS address (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    country VARCHAR(255) NOT NULL,
    region VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    street VARCHAR(255) NOT NULL,
    postal_code VARCHAR(255) NOT NULL
    );

CREATE TABLE IF NOT EXISTS product (
    id SERIAL PRIMARY KEY,
    platform_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    available BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (platform_id) REFERENCES platform(id) ON DELETE RESTRICT,
    FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE RESTRICT
    );

CREATE TABLE IF NOT EXISTS shipment_method (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    carrier_id INTEGER NOT NULL,
    estimated_days INTEGER NOT NULL,
    FOREIGN KEY (carrier_id) REFERENCES logistic_company(id) ON DELETE RESTRICT
    );

CREATE TABLE IF NOT EXISTS notification_subscription (
    customer_id INTEGER NOT NULL,
    type_id INTEGER NOT NULL,
    enabled BOOLEAN NOT NULL DEFAULT TRUE,
    PRIMARY KEY (customer_id, type_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id) ON DELETE CASCADE,
    FOREIGN KEY (type_id) REFERENCES notification_type(id) ON DELETE CASCADE
);
