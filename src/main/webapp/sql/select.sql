select * from member;
select * from work;
select * from genrework;
select * from episode;
select * from board;
select * from comment;


SELECT EXISTS(SELECT * FROM episode WHERE name = "test") AS t;
SELECT * FROM work WHERE name = (SELECT name FROM episode);
INSERT INTO genrework(number, genre) VALUES(2,'일상');

*****주의*****
DROP TABLE genrework
DROP TABLE episode;
DROP TABLE work;
DROP TABLE board;
DROP TABLE comment;

delete from work;
delete from episode;
delete from genrework;
*****주의*****

SELECT * FROM work WHERE name IN (SELECT DISTINCT name FROM episode);
SELECT count(*) FROM board;

ALTER TABLE board RENAME COLUMN boardnumber TO boardNumber;

DELETE FROM board WHERE boardNumber=1

SELECT * FROM comment WHERE commentNumber = 1;
SELECT * FROM episode WHERE episodeNumber = 1;

ALTER TABLE work ADD CONSTRAINT number PRIMARY key (number, name);
ALTER TABLE work DROP CONSTRAINT number;

CREATE UNIQUE INDEX number ON work

SELECT auto_increment FROM schema_auto_increment_columns WHERE table_schema = 'jakdokba' AND table_name = 'work' AND column_name= 'number';
SELECT AUTO_INCREMENT FROM information_schema.tables WHERE table_schema = 'jakdokba' AND table_name = 'work';
SHOW TABLE STATUS WHERE name="work";
SELECT LAST_INSERT_ID();
SELECT MAX(number) FROM work;

SELECT * FROM work WHERE number = (SELECT DISTINCT number FROM episode WHERE episodeNumber = 11);