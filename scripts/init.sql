-- Crear base de datos si no existe
DO
$$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_database
        WHERE datname = 'sana_app_db'
    ) THEN
        CREATE DATABASE sana_app_db;
    END IF;
END
$$;

-- Usar la base de datos
\c sana_app_db;

-- Crear tabla roles
CREATE TABLE IF NOT EXISTS roles (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT
);

-- Crear tabla schedules
CREATE TABLE IF NOT EXISTS schedules (
    id SERIAL PRIMARY KEY,
    day VARCHAR(20) NOT NULL,
    start_time VARCHAR(10) NOT NULL,
    end_time VARCHAR(10) NOT NULL,
    consultation_type VARCHAR(50) NOT NULL
);

-- Crear tabla integrations
CREATE TABLE IF NOT EXISTS integrations (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    api_key VARCHAR(255) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE
);

-- Crear tabla message_templates
CREATE TABLE IF NOT EXISTS message_templates (
    id SERIAL PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    content TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    hashed_password VARCHAR(255) NOT NULL,
    role_id INT REFERENCES roles(id),
    created_at TIMESTAMP DEFAULT NOW()
);
