CREATE TABLE IF NOT EXISTS customer (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(10)
    );

CREATE TABLE IF NOT EXISTS platform (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    api_base_url VARCHAR(255) NOT NULL
    );

CREATE TABLE IF NOT EXISTS category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
    );

CREATE TABLE IF NOT EXISTS payment_method (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL
    );

CREATE TABLE IF NOT EXISTS logistic_company (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    api_base_url VARCHAR(255) NOT NULL
    );

CREATE TABLE IF NOT EXISTS notification_type (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    channel VARCHAR(255) NOT NULL
    );

CREATE TABLE IF NOT EXISTS admin_user (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    role VARCHAR(255) NOT NULL
    );
