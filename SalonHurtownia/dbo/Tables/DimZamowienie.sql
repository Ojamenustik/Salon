CREATE TABLE [dbo].[DimZamowienie] (
    [Zamowienie_Id]     INT            IDENTITY (1, 1) NOT NULL,
    [Pracownik_Id]      INT            DEFAULT ((-1)) NOT NULL,
    [Klient_Id]         INT            DEFAULT ((-1)) NOT NULL,
    [CenaZamowienia]    MONEY          NOT NULL,
    [DataZamowienia]    DATETIME       NOT NULL,
    [DataOdbioru]       DATETIME       NULL,
    [Zrealizowane]      BIT            DEFAULT ((0)) NOT NULL,
    [Oplacone]          BIT            DEFAULT ((0)) NOT NULL,
    [KodMarki]          NVARCHAR (20)  NOT NULL,
    [NazwaMarki]        NVARCHAR (100) NULL,
    [KrajMarki]         NVARCHAR (40)  NOT NULL,
    [NazwaModelu]       NVARCHAR (50)  NOT NULL,
    [TypModelu]         NVARCHAR (50)  NULL,
    [PaliwoModelu]      NVARCHAR (50)  NULL,
    [WyposazenieModelu] NVARCHAR (100) NULL,
    [KolorModelu]       NVARCHAR (50)  NULL,
    [DostepnoscModelu]  BIT            NOT NULL,
    [CenaProduktu]      MONEY          NOT NULL,
    [ObowiazujeOd]      DATE           NOT NULL,
    [ObowiazujeDo]      DATE           NULL,
    CHECK ([CenaZamowienia]>(0)),
    CONSTRAINT [FK_Zamowienie_Klient] FOREIGN KEY ([Klient_Id]) REFERENCES [dbo].[DimKlient] ([Klient_Id]) ON DELETE SET DEFAULT,
    CONSTRAINT [FK_Zamowienie_Pracownik] FOREIGN KEY ([Pracownik_Id]) REFERENCES [dbo].[DimPracownik] ([Pracownik_Id]) ON DELETE SET DEFAULT
);


GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI]
    ON [dbo].[DimZamowienie];

