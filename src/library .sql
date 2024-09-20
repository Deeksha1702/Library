-- Create the database
CREATE DATABASE Library;

-- Switch to the new database
USE Library;

-- Create the Category table
CREATE TABLE Category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    catname VARCHAR(255),
    status VARCHAR(255)
);
SELECT * FROM Category;
CREATE TABLE author (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email TEXT,
    phone INT,
    PRIMARY KEY (id)
);
ALTER TABLE author MODIFY phone BIGINT;
SELECT * FROM Author;

CREATE TABLE publisher (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    address TEXT,
    phone BIGINT,
    PRIMARY KEY (id)
);
SELECT * FROM publisher;
CREATE TABLE book (
    id INT PRIMARY KEY AUTO_INCREMENT,
    bname VARCHAR(255) NOT NULL,
    author INT,
    publisher INT,
    contents VARCHAR(255),
    pages INT,
    edition INT,
    category VARCHAR(50)
);
SELECT * FROM book;
select b.id,b.bname,c.catname,a.name,p.name,b.contents,b.pages,b.edition from book b JOIN category c on b.category =c.id  JOIN author a on b.author = a.id JOIN publisher p on b.publisher = p.id;

CREATE TABLE member (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(20)
);
SELECT * FROM member;
CREATE TABLE ibook (
    id INT NOT NULL AUTO_INCREMENT,
    memberid INT NOT NULL,
    bookid INT NOT NULL,
    issuedate DATE NOT NULL,
    returnid INT NOT NULL,
    returndate DATE,
    PRIMARY KEY (id)
);
SELECT * FROM ibook;
select ib.id,m.name,b.bname,ib.issuedate,ib.returndate from ibook ib JOIN member m ON ib.memberid = m.id JOIN book b ON ib.bookid =b.id;
CREATE TABLE returnbook (
    id INT PRIMARY KEY AUTO_INCREMENT,
    mid INT,
    mname VARCHAR(255),
    bname VARCHAR(255),
    returndate VARCHAR(255),
    elp INT
);
SELECT * FROM returnbook;
select m.name,b.bname, ib.returndate,DATEDIFF(now(),ib.returndate) as elap from ibook ib JOIN member m ON ib.memberid = m.id JOIN book b ON ib.bookid=b.id ;



