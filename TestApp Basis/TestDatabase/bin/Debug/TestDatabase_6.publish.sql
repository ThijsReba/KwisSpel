﻿/*
Deployment script for QuizDatabase

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "QuizDatabase"
:setvar DefaultFilePrefix "QuizDatabase"
:setvar DefaultDataPath "C:\Users\nico\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB"
:setvar DefaultLogPath "C:\Users\nico\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creating [dbo].[Answer]...';


GO
CREATE TABLE [dbo].[Answer] (
    [AnswerId]    INT           IDENTITY (1, 1) NOT NULL,
    [Description] NVARCHAR (50) NOT NULL,
    [QuestionId]  INT           NOT NULL,
    [IsCorrect]   BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([AnswerId] ASC)
);


GO
PRINT N'Creating [dbo].[Category]...';


GO
CREATE TABLE [dbo].[Category] (
    [CategoryName] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([CategoryName] ASC)
);


GO
PRINT N'Creating [dbo].[Question]...';


GO
CREATE TABLE [dbo].[Question] (
    [QuestionId]   INT           IDENTITY (1, 1) NOT NULL,
    [Description]  NVARCHAR (50) NOT NULL,
    [CategoryName] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([QuestionId] ASC)
);


GO
PRINT N'Creating [dbo].[Quiz]...';


GO
CREATE TABLE [dbo].[Quiz] (
    [QuizId]      INT           IDENTITY (1, 1) NOT NULL,
    [Description] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([QuizId] ASC)
);


GO
PRINT N'Creating [dbo].[Quiz_Question]...';


GO
CREATE TABLE [dbo].[Quiz_Question] (
    [QuizId]     INT NOT NULL,
    [QuestionId] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([QuizId] ASC, [QuestionId] ASC)
);


GO
PRINT N'Creating unnamed constraint on [dbo].[Answer]...';


GO
ALTER TABLE [dbo].[Answer]
    ADD DEFAULT ((0)) FOR [IsCorrect];


GO
PRINT N'Creating [dbo].[FK_QUESTION]...';


GO
ALTER TABLE [dbo].[Answer] WITH NOCHECK
    ADD CONSTRAINT [FK_QUESTION] FOREIGN KEY ([QuestionId]) REFERENCES [dbo].[Question] ([QuestionId]);


GO
PRINT N'Creating [dbo].[fk_category]...';


GO
ALTER TABLE [dbo].[Question] WITH NOCHECK
    ADD CONSTRAINT [fk_category] FOREIGN KEY ([CategoryName]) REFERENCES [dbo].[Category] ([CategoryName]);


GO
PRINT N'Creating [dbo].[FK_Question_Quiz]...';


GO
ALTER TABLE [dbo].[Quiz_Question] WITH NOCHECK
    ADD CONSTRAINT [FK_Question_Quiz] FOREIGN KEY ([QuizId]) REFERENCES [dbo].[Quiz] ([QuizId]);


GO
PRINT N'Creating [dbo].[FK_Quiz_Question]...';


GO
ALTER TABLE [dbo].[Quiz_Question] WITH NOCHECK
    ADD CONSTRAINT [FK_Quiz_Question] FOREIGN KEY ([QuestionId]) REFERENCES [dbo].[Question] ([QuestionId]);


GO
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

INSERT INTO Qui ( VALUES ("De grote rekenquiz!");
INSERT INTO Quiz (Description) VALUES ("Wat weet jij van computers?");

INSERT INTO Category (CategoryName) VALUES ("Computer");
INSERT INTO Category (CategoryName) VALUES ("Rekenen");
INSERT INTO Category (CategoryName) VALUES ("Algemeen");

INSERT INTO Question (Description, CategoryName) VALUES ("Wat is 1+1?", "Rekenen");
INSERT INTO Question (Description, CategoryName) VALUES ("Wat is 2+2?", "Rekenen");
INSERT INTO Question (Description, CategoryName) VALUES ("Waar houd jij van?", "Algemeen");
INSERT INTO Question (Description, CategoryName) VALUES ("Welke programmeertaal is cewl?", "Computer");


INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (1,"Weet ik niet", 0);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (1,"Geen idee", 0);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (1,"Twee", 1);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (1,"Drie", 0);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (2,"Leuk", 0);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (2,"Vier", 1);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (2,"Feest",1);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (3,"Een goede vraag",1);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (3,"Tegenovergestelde van haat",1);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (3,"Jawel", 0);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (4,"Java", 0);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (4,"C#", 1);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (4,"Javascript", 0);
INSERT INTO Answer (QuestionId, Description, IsCorrect) VALUES (4,"Python", 0);

INSERT INTO Quiz_Question(QuizId,QuestionId) VALUES (1,1);
INSERT INTO Quiz_Question(QuizId,QuestionId) VALUES (1,2);
INSERT INTO Quiz_Question(QuizId,QuestionId) VALUES (1,3);
INSERT INTO Quiz_Question(QuizId,QuestionId) VALUES (1,4);
INSERT INTO Quiz_Question(QuizId,QuestionId) VALUES (2,5);
INSERT INTO Quiz_Question(QuizId,QuestionId) VALUES (2,1);


GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Answer] WITH CHECK CHECK CONSTRAINT [FK_QUESTION];

ALTER TABLE [dbo].[Question] WITH CHECK CHECK CONSTRAINT [fk_category];

ALTER TABLE [dbo].[Quiz_Question] WITH CHECK CHECK CONSTRAINT [FK_Question_Quiz];

ALTER TABLE [dbo].[Quiz_Question] WITH CHECK CHECK CONSTRAINT [FK_Quiz_Question];


GO
PRINT N'Update complete.';


GO
