CREATE TABLE [dbo].[DimKlient] (
    [Klient_Id]          INT            IDENTITY (1, 1) NOT NULL,
    [NrDowoduOsobistego] NCHAR (9)      NOT NULL,
    [Imie]               NVARCHAR (50)  NOT NULL,
    [Nazwisko]           NVARCHAR (50)  NOT NULL,
    [Mail]               NVARCHAR (40)  NULL,
    [Telefon]            CHAR (9)       NOT NULL,
    [NIP]                CHAR (10)      NULL,
    [Ulica]              NVARCHAR (50)  NOT NULL,
    [Budynek]            NVARCHAR (5)   NOT NULL,
    [NrMieszkania]       TINYINT        NULL,
    [Miasto]             NVARCHAR (100) NOT NULL,
    [Kraj]               NVARCHAR (50)  NOT NULL,
    [KodPocztowy]        NVARCHAR (6)   NULL,
    CONSTRAINT [PK_Klient] PRIMARY KEY CLUSTERED ([Klient_Id] ASC),
    CONSTRAINT [UQ_NrDowoduOsobistego] UNIQUE NONCLUSTERED ([NrDowoduOsobistego] ASC)
);

GO
CREATE TABLE [dbo].[DimPracownik] (
    [Pracownik_Id]     INT            IDENTITY (1, 1) NOT NULL,
    [PESEL]            CHAR (11)      NOT NULL,
    [Imie]             NVARCHAR (20)  NOT NULL,
    [Telefon]          CHAR (9)       NOT NULL,
    [Nazwisko]         NVARCHAR (40)  NOT NULL,
    [DataZatrudnienia] DATE           NULL,
    [Mail]             NVARCHAR (40)  NULL,
    [Ulica]            NVARCHAR (50)  NOT NULL,
    [Budynek]          NVARCHAR (5)   NOT NULL,
    [NrMieszkania]     TINYINT        NULL,
    [Miasto]           NVARCHAR (100) NOT NULL,
    [Kraj]             NVARCHAR (50)  NOT NULL,
    [KodPocztowy]      NVARCHAR (6)   NULL,
    CONSTRAINT [PK_Pracownik] PRIMARY KEY CLUSTERED ([Pracownik_Id] ASC),
    CONSTRAINT [UQ_Pracownik_PESEL] UNIQUE NONCLUSTERED ([PESEL] ASC)
);

GO
CREATE TABLE [dbo].[Zamowienie] (
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
    [WyposazenieModelu] NVARCHAR (250) NULL,
    [KolorModelu]       NVARCHAR (50)  NULL,
    [DostepnoscModelu]  BIT            NOT NULL,
    [CenaProduktu]      MONEY          NOT NULL,
    [ObowiazujeOd]      DATE           NOT NULL,
    [ObowiazujeDo]      DATE           NULL,
    CHECK ([CenaZamowienia] > (0)),
    CONSTRAINT [FK_Zamowienie_Klient] FOREIGN KEY ([Klient_Id]) REFERENCES [dbo].[DimKlient] ([Klient_Id]) ON DELETE SET DEFAULT,
    CONSTRAINT [FK_Zamowienie_Pracownik] FOREIGN KEY ([Pracownik_Id]) REFERENCES [dbo].[DimPracownik] ([Pracownik_Id]) ON DELETE SET DEFAULT,
    CONSTRAINT [UQ_Zamowienie] UNIQUE NONCLUSTERED ([Zamowienie_Id] ASC)
);

GO
CREATE TABLE [HR].[DimStanowiskoPracownika] (
    [Pracownik_Id] INT           NOT NULL,
    [Stanowisko]   NVARCHAR (50) NOT NULL,
    [OkresOd]      DATE          NOT NULL,
    [OkresDo]      DATE          NULL,
    CONSTRAINT [PK_StanowiskoPracownika] PRIMARY KEY CLUSTERED ([Pracownik_Id] ASC, [Stanowisko] ASC),
    CHECK ([OkresDo] > [OkresOd]),
    CONSTRAINT [FK_StanowiskoPracownika_Pracownik] FOREIGN KEY ([Pracownik_Id]) REFERENCES [dbo].[DimPracownik] ([Pracownik_Id])
);

GO
CREATE TABLE [HR].[DimWynagrodzenie] (
    [Wynagrodzenie_Id]   INT   IDENTITY (1, 1) NOT NULL,
    [Pracownik_Id]       INT   NOT NULL,
    [KwotaWynagrodzenia] MONEY NOT NULL,
    [WynagrodzenieOd]    DATE  NOT NULL,
    [WynagrodzenieDo]    DATE  NULL,
    CONSTRAINT [PK_Wynagrodzenie] PRIMARY KEY CLUSTERED ([Wynagrodzenie_Id] ASC),
    CONSTRAINT [FK_Wynagrodzenie_Employee] FOREIGN KEY ([Pracownik_Id]) REFERENCES [dbo].[DimPracownik] ([Pracownik_Id])
);

GO
CREATE TABLE [HR].[DimWyplata] (
    [Wyplata_Id]   INT          IDENTITY (1, 1) NOT NULL,
    [Pracownik_Id] INT          NOT NULL,
    [KwotaWyplaty] SMALLMONEY   NOT NULL,
    [TypWyplaty]   NVARCHAR (6) NOT NULL,
    [OkresWyplaty] DATE         NOT NULL,
    CONSTRAINT [PK_Wyplata] PRIMARY KEY CLUSTERED ([Wyplata_Id] ASC),
    CHECK ([TypWyplaty] = 'Pensja'
           OR [TypWyplaty] = 'Premia'),
    CONSTRAINT [FK_Wyplata_Pracownik] FOREIGN KEY ([Pracownik_Id]) REFERENCES [dbo].[DimPracownik] ([Pracownik_Id])
);

GO
CREATE TABLE [HR].[DimZespolPracownika] (
    [Pracownik_Id] INT           NOT NULL,
    [Zespol]       NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_ZespolPracownika] PRIMARY KEY CLUSTERED ([Pracownik_Id] ASC, [Zespol] ASC),
    CONSTRAINT [FK_ZespolPracownika_Pracownik] FOREIGN KEY ([Pracownik_Id]) REFERENCES [dbo].[DimPracownik] ([Pracownik_Id])
);

GO
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

GO
CREATE VIEW [rapOp].[v_GroupingSetPracData]
AS
SELECT   Pracownik_Id,
         COUNT(z.Zamowienie_Id) AS OrderNum,
         YEAR(DataZamowienia) AS ROK
FROM     Zamowienie AS z WITH (NOLOCK)
GROUP BY GROUPING SETS((Pracownik_Id, YEAR(DataZamowienia)), (Pracownik_Id), (YEAR(DataZamowienia)), ());

GO
CREATE VIEW [rapOp].[v_GrupPoCenieDenseRank]
AS
SELECT NazwaMarki,
       CenaProduktu,
       TypModelu,
       DENSE_RANK() OVER (ORDER BY CenaProduktu DESC) AS PriceRank
FROM   Zamowienie WITH (NOLOCK)
WHERE  TypModelu = 'Compact';

GO
CREATE VIEW [rapOp].[v_GrupPoCenieRank]
AS
SELECT NazwaMarki,
       CenaProduktu,
       TypModelu,
       RANK() OVER (ORDER BY CenaProduktu DESC) AS PriceRank
FROM   Zamowienie WITH (NOLOCK)
WHERE  TypModelu = 'Compact';

GO
CREATE VIEW [rapOp].[v_NastepneSumaZamowien2Lat]
AS
SELECT   Zamowienie_Id,
         YEAR(DataZamowienia) AS ROK,
         SUM(CenaZamowienia) AS SUMA,
         LEAD(SUM(CenaZamowienia), 2, 0) OVER (ORDER BY Zamowienie_Id, YEAR(DataZamowienia)) AS SumaPoprz2Lat
FROM     Zamowienie
GROUP BY Zamowienie_Id, YEAR(DataZamowienia)
ORDER BY Zamowienie_Id, YEAR(DataZamowienia)
OFFSET 1 ROWS FETCH NEXT 5 ROWS ONLY;

GO
CREATE VIEW [rapOp].[v_PoprzedniaSumaZamowien]
AS
SELECT   Zamowienie_Id,
         YEAR(DataZamowienia) AS ROK,
         SUM(CenaZamowienia) AS SUMA,
         LAG(SUM(CenaZamowienia)) OVER (ORDER BY Zamowienie_Id, YEAR(DataZamowienia)) AS PoprzedniaSuma
FROM     Zamowienie
GROUP BY Zamowienie_Id, YEAR(DataZamowienia)
ORDER BY Zamowienie_Id, YEAR(DataZamowienia)
OFFSET 1 ROWS FETCH NEXT 5 ROWS ONLY;

GO
CREATE VIEW [rapOp].[v_RollupZamPracKliID]
AS
SELECT   Zamowienie_Id,
         Pracownik_Id,
         Klient_Id,
         COUNT(z.Zamowienie_Id) AS OrderNum
FROM     Zamowienie AS z WITH (NOLOCK)
GROUP BY ROLLUP(Zamowienie_Id, Pracownik_Id, Klient_Id);

GO
CREATE VIEW [rapOp].[v_ZamowienieData]
AS
SELECT Zamowienie_Id,
       DataZamowienia
FROM   (SELECT ROW_NUMBER() OVER (PARTITION BY Zamowienie_Id ORDER BY CenaZamowienia) AS rownum,
               Zamowienie_Id,
               DataZamowienia
        FROM   Zamowienie WITH (NOLOCK)) AS D
WHERE  rownum > 2;

GO
CREATE VIEW [rapOp].[v_ZamowieniePoCenie]
AS
SELECT   Zamowienie_Id,
         SUM(CenaZamowienia) AS SUMA
FROM     (SELECT ROW_NUMBER() OVER (PARTITION BY Zamowienie_Id ORDER BY CenaZamowienia) AS rownum,
                 Zamowienie_Id,
                 CenaZamowienia
          FROM   Zamowienie WITH (NOLOCK)) AS D
GROUP BY Zamowienie_Id;

GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI]
    ON [dbo].[Zamowienie];

GO
CREATE SCHEMA [HR]
    AUTHORIZATION [dbo];

GO
CREATE SCHEMA [rapOp]
    AUTHORIZATION [dbo];

GO
CREATE SCHEMA [Serwis]
    AUTHORIZATION [dbo];

GO
