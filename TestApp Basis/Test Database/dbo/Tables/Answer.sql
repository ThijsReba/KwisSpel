CREATE TABLE [dbo].[Answer] (
    [AnswerId]    INT           IDENTITY (1, 1) NOT NULL,
    [Description] NVARCHAR (50) NOT NULL,
    [QuestionId]  INT           NOT NULL,
    [IsCorrect]   BIT           DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([AnswerId] ASC),
    CONSTRAINT [FK_QUESTION] FOREIGN KEY ([QuestionId]) REFERENCES [dbo].[Question] ([QuestionId])
);

