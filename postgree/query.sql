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

SELECT
    *
FROM
    USERS;

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