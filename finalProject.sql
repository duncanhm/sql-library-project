CREATE DATABASE dbLibrary;

USE dbLibrary

CREATE SCHEMA [Library] AUTHORIZATION [dbo]

GO

CREATE PROC dbo.uspPopulate_db_library
AS
BEGIN

	/**********************
	 BEGIN creating tables
	 *********************/

	CREATE TABLE PUBLISHER (
		pubName VARCHAR(150) PRIMARY KEY NOT NULL,
		pubAddress VARCHAR(500) NOT NULL,
		pubPhone VARCHAR(15) NOT NULL
	);

	CREATE TABLE LIBRARY_BRANCH (
		branchId INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		branchName VARCHAR(100) NOT NULL,
		branchAddress VARCHAR(500) NOT NULL
	);

	CREATE TABLE BORROWER (
		cardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		borrowName VARCHAR(150) NOT NULL,
		borrowAddress VARCHAR(500) NOT NULL,
		borrowPhone VARCHAR(15) NOT NULL
	);

	CREATE TABLE BOOK (
		bookId INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		bookTitle VARCHAR(200) NOT NULL,
		bookAuthor VARCHAR(100) NOT NULL,
		book_pubName VARCHAR(150) NOT NULL CONSTRAINT fk_pubName_book FOREIGN KEY REFERENCES PUBLISHER(pubName) ON UPDATE CASCADE ON DELETE CASCADE
	);

	CREATE TABLE BOOK_LOANS (
		loanId INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		dateOut DATE NOT NULL,
		dueDate DATE NOT NULL,
		loans_bookId INT NOT NULL CONSTRAINT fk_bookId_loans FOREIGN KEY REFERENCES BOOK(bookId) ON UPDATE CASCADE ON DELETE CASCADE,
		loans_branchId INT NOT NULL CONSTRAINT fk_branchId_loans FOREIGN KEY REFERENCES LIBRARY_BRANCH(branchId) ON UPDATE CASCADE ON DELETE CASCADE,
		loans_cardNo INT NOT NULL CONSTRAINT fk_cardNo_loans FOREIGN KEY REFERENCES BORROWER(cardNo) ON UPDATE CASCADE ON DELETE CASCADE
	);

	CREATE TABLE BOOK_COPIES (
		copiesId INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		No_Of_Copies INT NOT NULL,
		copies_bookId INT NOT NULL CONSTRAINT fk_bookId_copies FOREIGN KEY REFERENCES BOOK(bookId) ON UPDATE CASCADE ON DELETE CASCADE,
		copies_branchId INT NOT NULL CONSTRAINT fk_branchId_copies FOREIGN KEY REFERENCES LIBRARY_BRANCH(branchId) ON UPDATE CASCADE ON DELETE CASCADE
	);

	/********************
	 END creating tables 
	 *******************/

	/************************
	 BEGIN populating tables 
	 ***********************/

	INSERT INTO PUBLISHER
		(pubName, pubAddress, pubPhone)
		VALUES
		('West 26th Street Press', '42 West 26th Street, New York City, NY', '153-524-4587'),
		('Viking Press', '78 1st Ave, New York City, NY', '746-587-6894'),
		('Dell Publishing', '313 N 6th St, Chicago, IL', '485-687-9521'),
		('George Allen & Unwin', '485 East St, London, UK', '856-985-9987'),
		('Kodansha International', '78 Kodansha Ln, Tokyo, JP', '444-555-9874'),
		('DAW Books', '786 7th Ave, New York City, NY', '488-969-6665'),
		('Simon & Schuster', '557 Broadway, New York City, NY', '158-953-4458'),
		('Scholastic', '742 Broadway, New York City, NY', '339-896-9214'),
		('HarperCollins', '195 Broadway, New York City, NY', '448-985-4367'),
		('Doubleday', '96 1st Ave, New York City, NY', '874-852-5584')
	;


	INSERT INTO BOOK
		(bookTitle, bookAuthor, book_pubName)
		VALUES
		('The Lost Tribe', 'Mark Lee', 'West 26th Street Press'),
		('Cujo', 'Stephen King', 'Viking Press'),
		('It', 'Stephen King', 'Viking Press'),
		('Slaughterhouse-Five', 'Kurt Vonnegut', 'Dell Publishing'),
		('Breakfast of Champions', 'Kurt Vonnegut', 'Dell Publishing'),
		('Slapstick', 'Kurt Vonnegut', 'Dell Publishing'),
		('The Hobbit', 'J. R. R. Tolkien', 'George Allen & Unwin'),
		('The Fellowship of the Ring', 'J. R. R. Tolkien', 'George Allen & Unwin'),
		('The Two Towers', 'J. R. R. Tolkien', 'George Allen & Unwin'),
		('The Return of the King', 'J. R. R. Tolkien', 'George Allen & Unwin'),
		('A Wild Sheep Chase', 'Haruki Murakami', 'Kodansha International'),
		('The Name of the Wind', 'Patrick Rothfuss', 'DAW Books'),
		('The Wise Mans Fear', 'Patrick Rothfuss', 'DAW Books'),
		('Undaunted Courage', 'Stephen E. Ambrose', 'Simon & Schuster'),
		('The Grapes of Wrath', 'John Steinbeck', 'Viking Press'),
		('Stalingrad', 'Antony Beevor', 'Viking Press'),
		('Fantastic Beasts and Where to Find Them', 'J. K. Rowling', 'Scholastic'),
		('The Golden Fool', 'Robin Hobb', 'HarperCollins'),
		('The Pelican Brief', 'John Grisham', 'Doubleday'),
		('The Da Vinci Code', 'Dan Brown', 'Doubleday')
	;


	INSERT INTO LIBRARY_BRANCH
		(branchName, branchAddress)
		VALUES
		('Sharpstown', '200 Tuna St, Ely, GA'),
		('Central', '515 Artichoke Way, Ely, GA'),
		('Northwest', '62 NW 48th Ave, Ely, GA'),
		('Kennedy', '121 1st Ave, Ely, GA')
	;


	INSERT INTO BOOK_COPIES
		(copies_bookId, copies_branchId, No_Of_Copies)
		VALUES
		(1, 1, 2),
		(1, 2, 5),
		(1, 3, 3),
		(1, 4, 2),
		(2, 1, 2),
		(2, 2, 5),
		(2, 3, 3),
		(2, 4, 2),
		(3, 1, 3),
		(3, 2, 5),
		(3, 3, 4),
		(3, 4, 3),
		(4, 1, 2),
		(4, 2, 2),
		(4, 3, 2),
		(4, 4, 2),
		(5, 1, 3),
		(5, 2, 2),
		(5, 3, 3),
		(5, 4, 2),
		(6, 1, 4),
		(6, 2, 2),
		(6, 3, 2),
		(6, 4, 4),
		(7, 1, 2),
		(7, 2, 2),
		(7, 3, 4),
		(7, 4, 2),
		(8, 1, 2),
		(8, 2, 4),
		(8, 3, 4),
		(8, 4, 2),
		(9, 1, 4),
		(9, 2, 2),
		(9, 3, 2),
		(9, 4, 4),
		(10, 1, 3),
		(10, 2, 2),
		(10, 3, 4),
		(10, 4, 3),
		(11, 1, 2),
		(11, 2, 2),
		(12, 2, 2),
		(12, 3, 4),
		(12, 4, 6),
		(13, 2, 2),
		(13, 4, 4),
		(14, 2, 2),
		(15, 2, 4),
		(16, 2, 2),
		(16, 3, 2),
		(17, 2, 4),
		(18, 2, 3),
		(19, 1, 3),
		(20, 3, 4)
	;


	INSERT INTO BORROWER
		(borrowName, borrowAddress, borrowPhone)
		VALUES
		('Freddie Jones', '54 South St, Ely, GA', '789-465-5847'),
		('Janie Jones', '785 Artichoke Way, Ely, GA', '649-543-7425'),
		('Jim James', '201 Tuna St, Ely, GA', '483-821-9657'),
		('Richard Howard', '89 Holgate Ave, Ely, GA', '329-652-5589'),
		('Kate Miller', '54 Artichoke Way, Ely, GA', '111-457-4685'),
		('Marina Smith', '864 Katz Way, Ely, GA', '335-985-9854'),
		('Sara Elfman', '995 Artichoke Way, Ely, GA', '215-658-7584'),
		('Jose Coates', '301 Tuna St, Ely, GA', '201-480-6005'),
		('Jake Martinez', '487 Dogfish St, Ely, GA', '101-910-0036')
	;


	INSERT INTO BOOK_LOANS
		(dateOut, dueDate, loans_cardNo, loans_bookId, loans_branchId)
		VALUES
		('2018-03-14', '2018-04-14', 1, 1, 1),
		('2018-03-14', '2018-04-14', 1, 4, 1),
		('2018-03-14', '2018-04-14', 1, 5, 1),
		('2018-03-14', '2018-04-14', 1, 6, 1),
		('2018-03-14', '2018-04-14', 1, 8, 1),
		('2018-03-14', '2018-04-14', 1, 9, 1),
		('2018-03-14', '2018-04-14', 1, 11, 1),
		('2018-03-14', '2018-04-14', 1, 19, 1),
		('2018-02-19', '2018-03-19', 2, 1, 2),
		('2018-02-19', '2018-03-19', 2, 2, 2),
		('2018-02-19', '2018-03-19', 2, 3, 2),
		('2018-02-19', '2018-03-19', 2, 6, 2),
		('2018-02-19', '2018-03-19', 2, 10, 2),
		('2018-02-19', '2018-03-19', 2, 13, 2),
		('2018-02-19', '2018-03-19', 2, 17, 2),
		('2018-02-19', '2018-03-19', 2, 18, 2),
		('2018-02-20', '2018-03-20', 3, 3, 1),
		('2018-02-20', '2018-03-20', 3, 7, 1),
		('2018-02-20', '2018-03-20', 3, 11, 1),
		('2018-02-20', '2018-03-20', 3, 19, 1),
		('2018-03-10', '2018-04-10', 4, 1, 3),
		('2018-03-10', '2018-04-10', 4, 2, 3),
		('2018-03-10', '2018-04-10', 4, 16, 3),
		('2018-03-10', '2018-04-10', 4, 20, 3),
		('2018-02-28', '2018-03-28', 5, 1, 4),
		('2018-02-28', '2018-03-28', 5, 2, 4),
		('2018-02-28', '2018-03-28', 5, 7, 4),
		('2018-02-28', '2018-03-28', 5, 8, 4),
		('2018-02-28', '2018-03-28', 5, 9, 4),
		('2018-02-28', '2018-03-28', 5, 12, 4),
		('2018-03-11', '2018-04-11', 6, 3, 4),
		('2018-03-11', '2018-04-11', 6, 10, 4),
		('2018-03-11', '2018-04-11', 6, 13, 4),
		('2018-03-08', '2018-04-08', 7, 4, 4),
		('2018-03-08', '2018-04-08', 7, 5, 4),
		('2018-03-08', '2018-04-08', 7, 6, 4),
		('2018-03-08', '2018-04-08', 7, 7, 4),
		('2018-03-08', '2018-04-08', 7, 8, 4),
		('2018-03-08', '2018-04-08', 7, 12, 4),
		('2018-03-08', '2018-04-08', 7, 10, 4),
		('2018-03-08', '2018-04-08', 7, 13, 4),
		('2018-02-20', '2018-03-20', 8, 8, 3),
		('2018-02-20', '2018-03-20', 8, 4, 3),
		('2018-02-20', '2018-03-20', 8, 5, 3),
		('2018-02-20', '2018-03-20', 8, 6, 3),
		('2018-02-20', '2018-03-20', 8, 7, 3),
		('2018-02-20', '2018-03-20', 8, 12, 3),
		('2018-02-25', '2018-03-25', 6, 7, 2),
		('2018-02-25', '2018-03-25', 6, 8, 2),
		('2018-02-25', '2018-03-25', 6, 17, 2)
	;

	/************************
	 END populating tables 
	 ***********************/

	/************************
	 Begin queries section
	 ***********************/

	--> 1. How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?

	SELECT
		a1.bookTitle AS 'Book Title:', a3.branchName AS 'Branch:', a2.No_Of_Copies AS 'Number of Copies:'
		FROM BOOK a1
		INNER JOIN BOOK_COPIES a2 ON a2.copies_bookId = a1.bookId
		INNER JOIN LIBRARY_BRANCH a3 ON a3.branchId = a2.copies_branchId
		WHERE a1.bookTitle = 'The Lost Tribe' AND a3.branchName = 'Sharpstown'
	;

	--> 2. How many copies of the book titled "The Lost Tribe" are owned by each library branch?

	SELECT
		a3.branchName AS 'Branch:', a1.bookTitle AS 'Book Title:', a2.No_Of_Copies AS 'Number of Copies:'
		FROM BOOK a1
		INNER JOIN BOOK_COPIES a2 ON a2.copies_bookId = a1.bookId
		INNER JOIN LIBRARY_BRANCH a3 ON a3.branchId = a2.copies_branchId
		WHERE a1.bookTitle = 'The Lost Tribe'
	;

	--> 3. Retrieve the names of all borrowers who do not have any books checked out.

	SELECT
		borrowName AS 'Borrower Name'
		FROM BORROWER
		WHERE NOT EXISTS (SELECT * FROM BOOK_LOANS WHERE cardNo = loans_cardNo)
	;

	/* 4. For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, 
		  retrieve the book title, the borrower's name, and the borrower's address.*/

	SELECT
		a1.bookTitle AS 'Book Title:', a4.borrowName AS 'Borrowers Name:', a4.borrowAddress AS 'Borrowers Address:'
		FROM BOOK a1
		INNER JOIN BOOK_COPIES a2 ON a2.copies_bookId = a1.bookId
		INNER JOIN BOOK_LOANS a3 ON a3.loans_bookId = a1.bookId
		INNER JOIN BORROWER a4 ON a4.cardNo = a3.loans_cardNo
		WHERE a2.copies_branchId = 1 AND a3.dueDate = '2018-03-19'
	;

	--> 5. For each library branch, retrieve the branch name and the total number of books loaned out from that branch.

	SELECT
		a1.branchName AS 'Branch Name:', COUNT(*) AS 'Total # of Loans:'
		FROM LIBRARY_BRANCH a1
		INNER JOIN BOOK_LOANS a2 ON a2.loans_branchId = a1.branchId
		WHERE a2.loans_branchId = a1.branchId
		GROUP BY a1.branchName
	;

	--> 6. Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.

	SELECT
		a1.borrowName AS 'Borrower Name:', a1.borrowAddress AS 'Borrower Address', COUNT(*) AS '# of Books Checked Out'
		FROM BORROWER a1
		INNER JOIN BOOK_LOANS a2 ON a2.loans_cardNo = a1.cardNo
		WHERE a2.loans_cardNo = a1.cardNo
		GROUP BY a1.borrowName, a1.borrowAddress
		HAVING COUNT(*) > 5
	;

	/* 7. For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies
		  owned by the library branch whose name is "Central".*/

	SELECT
		a1.bookTitle AS 'Book Title:', a3.branchName AS 'Branch Name:', a2.No_Of_Copies AS '# of copies owned:'
		FROM BOOK a1
		INNER JOIN BOOK_COPIES a2 ON a2.copies_bookId = a1.bookId
		INNER JOIN LIBRARY_BRANCH a3 ON a3.branchId = a2.copies_branchId
		WHERE a1.bookAuthor = 'Stephen King' AND a3.branchName = 'Central'
	;

END

GO