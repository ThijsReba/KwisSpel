CREATE TABLE [dbo].[Category] (
    [CategoryId]   INT           IDENTITY (1, 1) NOT NULL,
    [CategoryName] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([CategoryId] ASC)
);

