CREATE TABLE [dbo].[Quiz_Question] (
    [QuizId]     INT NOT NULL,
    [QuestionId] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([QuizId] ASC, [QuestionId] ASC),
    CONSTRAINT [FK_Question_Quiz] FOREIGN KEY ([QuizId]) REFERENCES [dbo].[Quiz] ([QuizId]),
    CONSTRAINT [FK_Quiz_Question] FOREIGN KEY ([QuestionId]) REFERENCES [dbo].[Question] ([QuestionId])
);

