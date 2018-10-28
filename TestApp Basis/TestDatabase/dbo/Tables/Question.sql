CREATE TABLE [dbo].[Question] (
    [QuestionId]  INT           IDENTITY (1, 1) NOT NULL,
    [Description] NVARCHAR (50) NOT NULL,
    [CategoryName]  NVARCHAR (50)           NOT NULL,
    PRIMARY KEY CLUSTERED ([QuestionId] ASC),
    CONSTRAINT [fk_category] FOREIGN KEY ([CategoryName]) REFERENCES [dbo].[Category] ([CategoryName])
);

