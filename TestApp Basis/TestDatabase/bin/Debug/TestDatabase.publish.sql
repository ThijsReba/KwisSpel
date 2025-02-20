﻿/*
Deployment script for dev

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "dev"
:setvar DefaultFilePrefix "dev"
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
