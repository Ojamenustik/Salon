CREATE TABLE [Serwis].[Usluga] (
    [UslugaId]    INT           IDENTITY (1, 1) NOT NULL,
    [UslugaNazwa] NVARCHAR (70) NOT NULL,
    CONSTRAINT [PK_Usluga] PRIMARY KEY CLUSTERED ([UslugaId] ASC)
);

