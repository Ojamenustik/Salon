CREATE TABLE [Serwis].[HistoriaZamowienia] (
    [HistoriaZamowieniaId]   INT            IDENTITY (1, 1) NOT NULL,
    [ZamowienieId]           INT            NOT NULL,
    [PracownikId]            INT            NOT NULL,
    [Status]                 NVARCHAR (20)  NOT NULL,
    [HistoriaZamowieniaData] DATETIME       DEFAULT (getdate()) NOT NULL,
    [HistoriaZamowieniaOpis] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_HistoriaZamowienia] PRIMARY KEY CLUSTERED ([HistoriaZamowieniaId] ASC),
    CONSTRAINT [FK_HistoriaZamowienia_Pracownik] FOREIGN KEY ([PracownikId]) REFERENCES [dbo].[Pracownik] ([PracownikId]),
    CONSTRAINT [FK_HistoriaZamowienia_Status] FOREIGN KEY ([Status]) REFERENCES [Serwis].[Status] ([Status]),
    CONSTRAINT [FK_HistoriaZamowienia_Zamowienie] FOREIGN KEY ([ZamowienieId]) REFERENCES [Serwis].[Zamowienie] ([ZamowienieId])
);

