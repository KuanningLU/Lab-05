-- 會員表
CREATE TABLE Member (
  MemberID VARCHAR(20) PRIMARY KEY,
  Name VARCHAR(100),
  Address VARCHAR(200),
  Phone VARCHAR(20),
  Email VARCHAR(100)
);

-- 出版社表
CREATE TABLE Publisher (
  PublisherName VARCHAR(100) PRIMARY KEY,
  PublisherAddress VARCHAR(200)
);

-- 書籍表
CREATE TABLE Book (
  ISBN VARCHAR(20) PRIMARY KEY,
  Title VARCHAR(200),
  PublisherName VARCHAR(100),
  PublishYear INT,
  Category VARCHAR(100),
  FOREIGN KEY (PublisherName) REFERENCES Publisher(PublisherName)
);

-- 作者表
CREATE TABLE Author (
  AuthorID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(100)
);

-- 書籍作者關聯表
CREATE TABLE Book_Author (
  ISBN VARCHAR(20),
  AuthorID INT,
  PRIMARY KEY (ISBN, AuthorID),
  FOREIGN KEY (ISBN) REFERENCES Book(ISBN),
  FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);

-- 借閱紀錄表
CREATE TABLE Borrow (
  MemberID VARCHAR(20),
  ISBN VARCHAR(20),
  BorrowDate DATE,
  DueDate DATE,
  ReturnDate DATE,
  PRIMARY KEY (MemberID, ISBN, BorrowDate),
  FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
  FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);
