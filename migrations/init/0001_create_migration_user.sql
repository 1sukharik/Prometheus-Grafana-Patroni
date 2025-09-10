CREATE USER migration_user WITH PASSWORD 'postgres' CREATEDB CREATEROLE;

GRANT ALL PRIVILEGES ON DATABASE "postgres" TO migration_user;

ALTER ROLE migration_user IN DATABASE "postgres" SET search_path TO public;

GRANT USAGE, CREATE ON SCHEMA public TO migration_user;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO migration_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO migration_user;
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO migration_user;
