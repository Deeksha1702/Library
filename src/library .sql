
CREATE DATABASE Library;
USE Library;

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
    pages INT,
    edition VARCHAR(50),  
    category INT,  
    FOREIGN KEY (author) REFERENCES author(id),  
    FOREIGN KEY (publisher) REFERENCES publisher(id),  
    FOREIGN KEY (category) REFERENCES category(id)  
);

SELECT * FROM book;


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
    returndate DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (memberid) REFERENCES member(id),
    FOREIGN KEY (bookid) REFERENCES book(id)
);

SELECT * FROM ibook;


CREATE TABLE returnbook (
    id INT PRIMARY KEY AUTO_INCREMENT,
    mid INT NOT NULL,  
    mname VARCHAR(255) NOT NULL, 
    bname VARCHAR(255) NOT NULL,  
    returndate VARCHAR(255) NOT NULL,  
    elp INT DEFAULT 0,  
    fine INT DEFAULT 0 
    
);

SELECT * FROM returnbook;


select b.id,b.bname,c.catname,a.name,p.name,b.contents,b.pages,b.edition from book b JOIN category c on b.category =c.id  JOIN author a on b.author = a.id JOIN publisher p on b.publisher = p.id;
select ib.id,m.name,b.bname,ib.issuedate,ib.returndate from ibook ib JOIN member m ON ib.memberid = m.id JOIN book b ON ib.bookid =b.id;
select m.name,b.bname, ib.returndate,DATEDIFF(now(),ib.returndate) as elap from ibook ib JOIN member m ON ib.memberid = m.id JOIN book b ON ib.bookid=b.id ;





