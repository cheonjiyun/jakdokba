create table member(
	id varchar(16) not null,
	password varchar(16) not null,
	email varchar(30) not null,
	name varchar(40) not null,
	primary key(id)
)default charset=utf8;

CREATE TABLE IF NOT EXISTS work(
	number INT auto_increment NOT NULL,
	name VARCHAR(50) NOT NULL,
	author VARCHAR(20) NOT NULL,
	introduce VARCHAR(200) NOT NULL,
	thumbnail VARCHAR(50) NOT NULL,
	price INT NOT NULL,
	PRIMARY KEY(number)
)default CHARSET=utf8;

CREATE TABLE IF NOT EXISTS genrework(
	number INT NOT NULL,
	genre VARCHAR(50) NOT NULL,
	FOREIGN KEY(number) REFERENCES work(number),
	FOREIGN KEY(genre) REFERENCES genre(genre),
	PRIMARY KEY(number, genre)
)default CHARSET=utf8;

CREATE TABLE IF NOT EXISTS genre(
	genre VARCHAR(50) NOT NULL,
	PRIMARY KEY(genre)
)default CHARSET=utf8;

INSERT INTO genre VALUES('로맨스');
INSERT INTO genre VALUES('액션');
INSERT INTO genre VALUES('일상');
INSERT INTO genre VALUES('스릴러');
INSERT INTO genre VALUES('판타지');
INSERT INTO genre VALUES('스포츠');
INSERT INTO genre VALUES('무협');
INSERT INTO genre VALUES('사극');
INSERT INTO genre VALUES('코믹');
INSERT INTO genre VALUES('감성');
INSERT INTO genre VALUES('추리');
INSERT INTO genre VALUES('드라마');

CREATE TABLE IF NOT EXISTS episode(
	episodeNumber INT auto_increment NOT NULL,
	number INT NOT NULL,
	episodeTitle VARCHAR(50) NOT NULL,
	episodeThumbnail VARCHAR(50) NOT NULL,
	episodeImage VARCHAR(50) NOT NULL,
	episodeComment VARCHAR(50) NOT NULL,
	episodeDate DATETIME,
	FOREIGN KEY(number) REFERENCES work(number),
	PRIMARY KEY(episodeNumber)
)default character set utf8 collate utf8_general_ci;

CREATE TABLE IF NOT EXISTS board(
	boardNumber INT auto_increment NOT NULL,
	boardThumbnail VARCHAR(50),
	boardTitle VARCHAR(50) NOT NULL,
	boardContent VARCHAR(2048) NOT NULL,
	author VARCHAR(20) NOT NULL,
	boardDate DATETIME NOT NULL,
	boardViews INT NOT NULL,
	PRIMARY KEY(boardNumber)
)default CHARSET=utf8;

CREATE TABLE IF NOT EXISTS comment(
	commentNumber INT auto_increment NOT NULL,
	episodeNumber INT NOT NULL,
	comment VARCHAR(50) NOT NULL,
	author VARCHAR(20) NOT NULL,
	commentDate DATETIME NOT NULL,
	commentGood INT NOT NULL,
	commentBad INT NOT NULL,
	FOREIGN KEY(episodeNumber) REFERENCES episode(episodeNumber),
	PRIMARY KEY(commentNumber)
)default CHARSET=utf8;