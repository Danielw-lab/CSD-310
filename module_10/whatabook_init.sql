-- drop test user if exists 
DROP USER IF EXISTS 'whatabook_user'@'localhost';

-- create whatabook_user and grant them all privileges to the whatabook database 
CREATE USER 'whatabook_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';

-- grant all privileges to the whatabook database to user whatabook_user on localhost 
GRANT ALL PRIVILEGES ON whatabook.* TO'whatabook_user'@'localhost';

-- drop contstraints if they exist
ALTER TABLE wishlist DROP FOREIGN KEY fk_book;
ALTER TABLE wishlist DROP FOREIGN KEY fk_user;

-- drop tables if they exist
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS user;

CREATE TABLE store (
    store_id    INT             NOT NULL    AUTO_INCREMENT,
    locale      VARCHAR(500)    NOT NULL,
    PRIMARY KEY(store_id)
);

CREATE TABLE book (
    book_id     INT             NOT NULL    AUTO_INCREMENT,
    book_name   VARCHAR(200)    NOT NULL,
    author      VARCHAR(200)    NOT NULL,
    details     VARCHAR(500),
    PRIMARY KEY(book_id)
);

CREATE TABLE user (
    user_id         INT         NOT NULL    AUTO_INCREMENT,
    first_name      VARCHAR(75) NOT NULL,
    last_name       VARCHAR(75) NOT NULL,
    PRIMARY KEY(user_id) 
);

CREATE TABLE wishlist (
    wishlist_id     INT         NOT NULL    AUTO_INCREMENT,
    user_id         INT         NOT NULL,
    book_id         INT         NOT NULL,
    PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    FOREIGN KEY (book_id)
        REFERENCES book(book_id),
    CONSTRAINT fk_user
    FOREIGN KEY (user_id)
        REFERENCES user(user_Id)
);

/*
    insert store record 
*/
INSERT INTO store(locale)
    VALUES('123 Street , Omaha, NE 68116');

/*
    insert book records 
*/
INSERT INTO book(book_name, author, details)
    VALUES('The Return of the King', 'J.R.Tolkien', 'The third part of The Lord of the Rings');

INSERT INTO book(book_name, author, details)
    VALUES('Everything I Never Told You', 'CELESTE NG');

INSERT INTO book(book_name, author, details)
    VALUES('Is Everyone Hanging Out Without Me?', 'MINDY KALING');

INSERT INTO book(book_name, author)
    VALUES('Are You There, Vodka', 'CHELSEA HANDLER');

INSERT INTO book(book_name, author)
    VALUES('THE CURIOUS INCIDENT OF THE DOG IN THE NIGHT-TIME', 'MARK HADDON');

INSERT INTO book(book_name, author)
    VALUES('HOW TO WIN FRIENDS AND INFLUENCE PEOPLE', 'DALE CARNEGIE');

INSERT INTO book(book_name, author)
    VALUES('CLOUDY WITH A CHANCE OF MEATBALLS', 'JUDI BARRETT');

INSERT INTO book(book_name, author)
    VALUES('LOVE IN THE TIME OF CHOLERA', 'GABRIEL GARCÍA MÁRQUEZ');

INSERT INTO book(book_name, author)
    VALUES('THE DEVIL WEARS PRADA', 'JLAUREN WEISBERGER');

/*
    insert user
*/ 
INSERT INTO user(first_name, last_name) 
    VALUES('Jone', 'Scott');

INSERT INTO user(first_name, last_name)
    VALUES('Brian', 'Labkin');

INSERT INTO user(first_name, last_name)
    VALUES('Rawol', 'Gomzalez');

/*
    insert wishlist records 
*/
INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Jone'), 
        (SELECT book_id FROM book WHERE book_name = 'Are You There, Vodka')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Brian'),
        (SELECT book_id FROM book WHERE book_name = 'Everything I Never Told You')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Rawol'),
        (SELECT book_id FROM book WHERE book_name = 'Do Androids Dream of Electric Sheep')
    );
