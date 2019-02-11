CREATE TABLE [Serwis].[Zamowienie] (
    [ZamowienieId]   INT   IDENTITY (1, 1) NOT NULL,
    [ModelId]        INT   NOT NULL,
    [UslugaId]       INT   NOT NULL,
    [ZamowienieCena] MONEY NOT NULL,
    CONSTRAINT [PK_UslugaZamowienie] PRIMARY KEY CLUSTERED ([ZamowienieId] ASC),
    CONSTRAINT [FK_UslugaZamowienie_Model] FOREIGN KEY ([ModelId]) REFERENCES [dbo].[Model] ([ModelId]),
    CONSTRAINT [FK_UslugaZamowienie_Usluga] FOREIGN KEY ([UslugaId]) REFERENCES [Serwis].[Usluga] ([UslugaId])
);

