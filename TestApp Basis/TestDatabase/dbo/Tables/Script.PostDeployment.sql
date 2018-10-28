/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

INSERT INTO Quiz (Description) VALUES ('De grote rekenquiz!');
INSERT INTO Quiz (Description) VALUES ('Wat weet jij van computers?');

INSERT INTO Category (CategoryName) VALUES ('Computer');
INSERT INTO Category (CategoryName) VALUES ('Rekenen');
INSERT INTO Category (CategoryName) VALUES ('Algemeen');

INSERT INTO Question (Description, CategoryName) VALUES ('Wat is 1+1?', 'Rekenen');
INSERT INTO Question (Description, CategoryName) VALUES ('Wat is 2+2?', 'Rekenen');
INSERT INTO Question (Description, CategoryName) VALUES ('Waar houd jij van?', 'Algemeen');
INSERT INTO Question (Description, CategoryName) VALUES ('Welke programmeertaal is cewl?', 'Computer');


INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (1,'Weet ik niet', 0);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (1,'Geen idee', 0);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (1,'Twee', 1);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (1,'Drie', 0);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (2,'Leuk', 0);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (2,'Vier', 1);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (2,'Feest',1);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (3,'Een goede vraag',1);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (3,'Tegenovergestelde van haat',1);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (3,'Jawel', 0);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (4,'Java', 0);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (4,'C#', 1);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (4,'Javascript', 0);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (4,'Python', 0);

INSERT INTO Quiz_Question(QuizId,QuestionId) VALUES (1,1);
INSERT INTO Quiz_Question(QuizId,QuestionId) VALUES (1,2);
INSERT INTO Quiz_Question(QuizId,QuestionId) VALUES (1,3);
INSERT INTO Quiz_Question(QuizId,QuestionId) VALUES (1,4);
INSERT INTO Quiz_Question(QuizId,QuestionId) VALUES (2,5);
INSERT INTO Quiz_Question(QuizId,QuestionId) VALUES (2,1);


