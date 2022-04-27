CREATE TABLE users(
	id BIGSERIAL PRIMARY KEY,
	email VARCHAR(255) NOT NULL UNIQUE,
	name VARCHAR(255) NOT NULL,
	lastname VARCHAR(255) NOT NULL,
	phone VARCHAR(80) NOT NULL UNIQUE,
	image VARCHAR(255) NULL,
	password VARCHAR(255) NOT NULL,
	is_available BOOLEAN NULL,
	session_token VARCHAR(255) NULL,
	created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL
);

DROP TABLE IF EXISTS categories CASCADE;

CREATE TABLE categories(
	id BIGSERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL UNIQUE,
	description VARCHAR(255) NOT NULL,
	created_at TIMESTAMP(0) NOT NULL,
	updated_at TIMESTAMP(0) NOT NULL,
);