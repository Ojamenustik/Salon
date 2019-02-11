CREATE TABLE [dbo].[Zamowienie] (
    [ZamowienieId]   INT      IDENTITY (1, 1) NOT NULL,
    [KlientId]       INT      DEFAULT ((0)) NOT NULL,
    [PracownikId]    INT      DEFAULT ((0)) NOT NULL,
    [ModelId]        INT      DEFAULT ((0)) NOT NULL,
    [CenaZamowienia] MONEY    NOT NULL,
    [DataZamowienia] DATETIME NOT NULL,
    [DataOdbioru]    DATETIME NULL,
    [Zrealizowane]   BIT      DEFAULT ((0)) NOT NULL,
    [Oplacone]       BIT      DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Zamowienie] PRIMARY KEY CLUSTERED ([ZamowienieId] ASC),
    CHECK ([CenaZamowienia]>(0)),
    CONSTRAINT [FK_Zamowienie_Klient] FOREIGN KEY ([KlientId]) REFERENCES [dbo].[Klient] ([KlientId]) ON DELETE SET DEFAULT,
    CONSTRAINT [FK_Zamowienie_Model] FOREIGN KEY ([ModelId]) REFERENCES [dbo].[Model] ([ModelId]) ON DELETE SET DEFAULT,
    CONSTRAINT [FK_Zamowienie_Pracownik] FOREIGN KEY ([PracownikId]) REFERENCES [dbo].[Pracownik] ([PracownikId]) ON DELETE SET DEFAULT
);

