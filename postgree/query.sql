DROP TABLE IF EXISTS roles CASCADE;

CREATE TABLE roles(
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    image VARCHAR(255) NULL,
    route VARCHAR(255) NULL,
    created_at TIMESTAMP(0) NOT NULL,
    updated_at TIMESTAMP(0) NOT NULL
);

INSERT INTO
    roles(name, route, created_at, updated_at)
VALUES
    (
        'CLIENT',
        'client/products/list',
        '2022-4-25',
        '2022-4-25'
    );

INSERT INTO
    roles(name, route, created_at, updated_at)
VALUES
    (
        'RESTAURANT',
        'restaurant/orders/list',
        '2022-4-25',
        '2022-4-25'
    );

INSERT INTO
    roles(name, route, created_at, updated_at)
VALUES
    (
        'DRIVER',
        'delivery/orders/list',
        '2022-04-25',
        '2022-04-25'
    );

DROP TABLE IF EXISTS user_has_roles CASCADE;

CREATE TABLE user_has_roles(
    id_user BIGSERIAL NOT NULL,
    id_role BIGSERIAL NOT NULL,
    created_at TIMESTAMP(0) NOT NULL,
    updated_at TIMESTAMP(0) NOT NULL,
    FOREIGN KEY(id_user) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(id_role) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY(id_user, id_role)
);

DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users(
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(75) NOT NULL,
    name VARCHAR(30) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    image VARCHAR(255) NULL,
    password VARCHAR(255) NOT NULL,
    is_availabale BOOLEAN NULL,
    session_token VARCHAR(255) NULL,
    created_at TIMESTAMP(0) NOT NULL,
    updated_at TIMESTAMP(0) NOT NULL
);

## INSERT INTO TABLE
INSERT INTO
    users(
        email,
        name,
        lastname,
        phone,
        password,
        created_at,
        updated_at
    )
VALUES
    (
        'areris981@gmail.com',
        'teguh',
        'muhammad harits',
        '083135351881',
        '123456',
        '2022-4-25',
        '2022-4-25'
    );

## SELECT USING INNTER JOIN
SELECT
    U.id,
    U.email,
    U.name,
    U.lastname,
    U.image,
    U.phone,
    U.password,
    U.session_token,
    json_agg(
        json_build_object(
            'id',
            R.id,
            'name',
            R.name,
            'image',
            R.image,
            'route',
            R.route
        )
    )
FROM
    users AS U
    INNER JOIN user_has_roles AS UHR ON UHR.id_user = U.id
    INNER JOIN roles AS R ON R.id = UHR.id_role
WHERE
    U.email = 'teguh@gmail.com'
GROUP BY
    U.id;

##END OF SELECT GROUP BY
DELETE FROM
    USERS
WHERE
    ID = 1;

UPDATE
    USERS
SET
    lastname = 'muhammad harits'
WHERE
    id = 3;