CREATE TABLE [Serwis].[DimHistoriaZamowien] (
    [HistoriaZamowien_Id]    INT            IDENTITY (1, 1) NOT NULL,
    [Zamowienie_Id]          INT            NOT NULL,
    [Pracownik_Id]           INT            NOT NULL,
    [Status]                 NVARCHAR (20)  NOT NULL,
    [HistoriaZamowieniaData] DATETIME       DEFAULT (getdate()) NOT NULL,
    [HistoriaZamowienOpis]   NVARCHAR (250) NULL,
    [ZamowienieCena]         MONEY          NOT NULL,
    [UslugaNazwa]            NVARCHAR (70)  NOT NULL,
    CONSTRAINT [PK_HistoriaZamowien] PRIMARY KEY CLUSTERED ([HistoriaZamowien_Id] ASC),
    CONSTRAINT [FK_HistoriaZamowien_Pracownik] FOREIGN KEY ([Pracownik_Id]) REFERENCES [dbo].[DimPracownik] ([Pracownik_Id]),
    CONSTRAINT [FK_HistoriaZamowien_Zamowienie] FOREIGN KEY ([Zamowienie_Id]) REFERENCES [dbo].[Zamowienie] ([Zamowienie_Id])
);

