CREATE TABLE [dbo].[Adres] (
    [AdresId]      INT            IDENTITY (1, 1) NOT NULL,
    [Ulica]        NVARCHAR (50)  NOT NULL,
    [Budynek]      NVARCHAR (5)   NOT NULL,
    [NrMieszkania] TINYINT        NULL,
    [Miasto]       NVARCHAR (100) NOT NULL,
    [Kraj]         NVARCHAR (50)  NOT NULL,
    [KodPocztowy]  NVARCHAR (6)   NULL
);

GO
CREATE TABLE [dbo].[Cennik] (
    [CenaId]       INT   IDENTITY (1, 1) NOT NULL,
    [ModelId]      INT   DEFAULT ((-1)) NOT NULL,
    [Cena]         MONEY NOT NULL,
    [ObowiazujeOd] DATE  NOT NULL,
    [ObowiazujeDo] DATE  NULL
);

GO
CREATE TABLE [dbo].[Klient] (
    [KlientId]           INT           IDENTITY (1, 1) NOT NULL,
    [Imie]               NVARCHAR (50) NOT NULL,
    [Nazwisko]           NVARCHAR (50) NOT NULL,
    [Mail]               NVARCHAR (40) NULL,
    [Telefon]            CHAR (9)      NOT NULL,
    [NrDowoduOsobistego] CHAR (9)      NULL,
    [NIP]                CHAR (10)     NULL,
    [Adres]              INT           NULL
);

GO
CREATE TABLE [dbo].[Marka] (
    [MarkaId]  CHAR (4)       NOT NULL,
    [KodMarki] NVARCHAR (20)  NOT NULL,
    [Nazwa]    NVARCHAR (100) NULL,
    [Kraj]     NVARCHAR (40)  NOT NULL
);

GO
CREATE TABLE [dbo].[Model] (
    [ModelId]     INT            IDENTITY (1, 1) NOT NULL,
    [Nazwa]       NVARCHAR (50)  NOT NULL,
    [Typ]         NVARCHAR (50)  NULL,
    [Paliwo]      NVARCHAR (50)  NULL,
    [Wyposazenie] NVARCHAR (MAX) NULL,
    [Kolor]       NVARCHAR (50)  NULL,
    [Dostepnosc]  BIT            NOT NULL,
    [Marka]       CHAR (4)       NOT NULL
);

GO
CREATE TABLE [dbo].[Pracownik] (
    [PracownikId]      INT           IDENTITY (1, 1) NOT NULL,
    [Imie]             NVARCHAR (20) NOT NULL,
    [Nazwisko]         NVARCHAR (40) NOT NULL,
    [Telefon]          CHAR (9)      NOT NULL,
    [PESEL]            CHAR (11)     NULL,
    [Adres]            INT           NULL,
    [Mail]             NVARCHAR (40) NULL,
    [DataZatrudnienia] DATE          NULL,
    CHECK ([DataZatrudnienia] <= getdate())
);

GO
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
    CHECK ([CenaZamowienia] > (0))
);

GO
CREATE TABLE [HR].[Stanowisko] (
    [ZajmowaneStanowisko] NVARCHAR (50) NOT NULL,
    UNIQUE NONCLUSTERED ([ZajmowaneStanowisko] ASC)
);

GO
CREATE TABLE [HR].[StanowiskoPracownika] (
    [PracownikId]         INT           NOT NULL,
    [ZajmowaneStanowisko] NVARCHAR (50) NOT NULL,
    [OkresOd]             DATE          NOT NULL,
    [OkresDo]             DATE          NULL,
    CHECK ([OkresDo] > [OkresOd])
);

GO
CREATE TABLE [HR].[Wynagrodzenie] (
    [WynagrodzenieId]    INT   IDENTITY (1, 1) NOT NULL,
    [PracownikId]        INT   NOT NULL,
    [KwotaWynagrodzenia] MONEY NOT NULL,
    [WynagrodzenieOd]    DATE  NOT NULL,
    [WynagrodzenieaDo]   DATE  NULL
);

GO
CREATE TABLE [HR].[Wyplata] (
    [WyplataId]    INT          IDENTITY (1, 1) NOT NULL,
    [PracownikId]  INT          NOT NULL,
    [KwotaWyplaty] SMALLMONEY   NOT NULL,
    [TypWyplaty]   NVARCHAR (6) NOT NULL,
    [WyplataOkres] DATE         NOT NULL,
    CHECK ([TypWyplaty] = 'Pensja'
           OR [TypWyplaty] = 'Premia')
);

GO
CREATE TABLE [HR].[Zespol] (
    [Zespol] NVARCHAR (50) NOT NULL,
    UNIQUE NONCLUSTERED ([Zespol] ASC)
);

GO
CREATE TABLE [HR].[ZespolPracownika] (
    [PracownikId] INT           NOT NULL,
    [Zespol]      NVARCHAR (50) NOT NULL
);

GO
CREATE TABLE [Serwis].[HistoriaZamowienia] (
    [HistoriaZamowieniaId]   INT            IDENTITY (1, 1) NOT NULL,
    [ZamowienieId]           INT            NOT NULL,
    [PracownikId]            INT            NOT NULL,
    [Status]                 NVARCHAR (20)  NOT NULL,
    [HistoriaZamowieniaData] DATETIME       DEFAULT (getdate()) NOT NULL,
    [HistoriaZamowieniaOpis] NVARCHAR (MAX) NULL
);

GO
CREATE TABLE [Serwis].[Status] (
    [Status] NVARCHAR (20) NOT NULL
);

GO
CREATE TABLE [Serwis].[Usluga] (
    [UslugaId]    INT           IDENTITY (1, 1) NOT NULL,
    [UslugaNazwa] NVARCHAR (70) NOT NULL
);

GO
CREATE TABLE [Serwis].[Zamowienie] (
    [ZamowienieId]   INT   IDENTITY (1, 1) NOT NULL,
    [ModelId]        INT   NOT NULL,
    [UslugaId]       INT   NOT NULL,
    [ZamowienieCena] MONEY NOT NULL
);

GO
CREATE VIEW [rapOp].[v_iloscKazdejUslugi]
AS
SELECT   u.UslugaNazwa,
         COUNT(z.ZamowienieId) AS iloscWykonanejUslugi
FROM     Serwis.Usluga AS u WITH (READUNCOMMITTED)
         INNER JOIN
         Serwis.Zamowienie AS z
         ON u.UslugaId = z.UslugaId
GROUP BY UslugaNazwa;

GO
CREATE VIEW [rapOp].[v_ModeleBrakZamowien]
AS
SELECT m.*
FROM   [dbo].[Model] AS m WITH (NOLOCK)
       LEFT OUTER JOIN
       [dbo].[Zamowienie] AS z
       ON z.ModelId = m.ModelId
WHERE  z.ZamowienieId IS NULL;

GO
CREATE VIEW [rapOp].[v_najczesciejNaprawianeAuta]
AS
SELECT   TOP (3) Mycount,
                 m.Nazwa
FROM     (SELECT COUNT(ModelId) AS Mycount
          FROM   Zamowienie AS z WITH (NOLOCK)) AS tab
         INNER JOIN
         Model AS m
         ON m.ModelId = (SELECT ModelId
                         FROM   Zamowienie WITH (NOLOCK))
ORDER BY Mycount DESC;

GO
CREATE VIEW [rapOp].[v_najwyzszaPremia]
AS
SELECT   zp.Zespol,
         p.PracownikId,
         p.Nazwisko,
         MAX(w.KwotaWyplaty) AS NajPremia
FROM     HR.ZespolPracownika AS zp WITH (READUNCOMMITTED)
         INNER JOIN
         HR.[Wyplata] AS w
         ON zp.PracownikId = w.PracownikId
         INNER JOIN
         Pracownik AS p
         ON p.PracownikId = zp.PracownikId
WHERE    TypWyplaty = 'premia'
GROUP BY zp.Zespol, zp.Zespol, p.PracownikId, p.Nazwisko;

GO
CREATE VIEW [rapOp].[v_pracownicyStatusyZakonczon]
AS
SELECT   TOP (3) PracownikId,
                 Mycount
FROM     (SELECT   PracownikId,
                   count([Status]) AS Mycount
          FROM     Serwis.HistoriaZamowienia WITH (READUNCOMMITTED)
          WHERE    [status] = 'zakonczono'
          GROUP BY PracownikId) AS tab
ORDER BY Mycount DESC;

GO
CREATE VIEW [rapOp].[v_SumaZamowienZespolu]
AS
SELECT   year(hz.HistoriaZamowieniaData) AS ROK,
         zp.Zespol,
         SUM(z.ZamowienieCena) AS SumaZrealizowanychZamowien
FROM     Serwis.HistoriaZamowienia AS hz WITH (READUNCOMMITTED)
         INNER JOIN
         HR.ZespolPracownika AS zp
         ON zp.PracownikId = hz.PracownikId
         INNER JOIN
         Serwis.Zamowienie AS z
         ON hz.ZamowienieId = z.ZamowienieId
WHERE    hz.[status] = 'Zakonczono'
GROUP BY year(hz.HistoriaZamowieniaData), zp.Zespol;

GO
CREATE VIEW [rapOp].[v_wynagrodzenieZespolu]
AS
SELECT   zp.Zespol,
         SUM(w.KwotaWynagrodzenia) AS WynagrodzenieZespolu
FROM     HR.ZespolPracownika AS zp WITH (READUNCOMMITTED)
         INNER JOIN
         HR.Wynagrodzenie AS w
         ON zp.PracownikId = w.PracownikId
GROUP BY zp.Zespol;

GO
CREATE VIEW [rapOp].[v_ZamowieniaDlaMarki]
AS
SELECT   ma.Nazwa,
         COUNT(z.ZamowienieId) AS Zamowienia,
         SUM(z.CenaZamowienia) AS Suma
FROM     [dbo].[Marka] AS ma WITH (NOLOCK)
         LEFT OUTER JOIN
         [dbo].[Model] AS mo
         ON mo.Marka = ma.MarkaId
         LEFT OUTER JOIN
         [dbo].[Zamowienie] AS z
         ON z.ModelId = mo.ModelId
GROUP BY ma.Nazwa;

GO
CREATE VIEW [rapOp].[v_ZamowieniaPracownikow]
AS
SELECT   pr.Imie,
         pr.Nazwisko,
         COUNT(z.ZamowienieId) AS Zamowienia,
         SUM(z.CenaZamowienia) AS Suma
FROM     [dbo].[Pracownik] AS pr WITH (NOLOCK)
         LEFT OUTER JOIN
         [dbo].[Zamowienie] AS z
         ON z.PracownikId = pr.PracownikId
GROUP BY pr.PracownikId, pr.Imie, pr.Nazwisko;

GO
CREATE VIEW [rapOp].[v_ZamowieniaZRabatem]
AS
SELECT z.*,
       ((c.Cena - z.CenaZamowienia) / c.Cena) AS Rabat
FROM   [dbo].[Zamowienie] AS z WITH (NOLOCK)
       INNER JOIN
       [dbo].[Cennik] AS c
       ON z.ModelId = c.ModelId
WHERE  z.DataZamowienia > c.ObowiazujeOd
       AND z.DataZamowienia < c.ObowiazujeDo;

GO
ALTER TABLE [dbo].[Cennik]
    ADD CONSTRAINT [FK_Cennik_Model] FOREIGN KEY ([ModelId]) REFERENCES [dbo].[Model] ([ModelId]) ON DELETE SET DEFAULT ON UPDATE CASCADE;

GO
ALTER TABLE [dbo].[Klient]
    ADD CONSTRAINT [FK_Klient_Adres] FOREIGN KEY ([Adres]) REFERENCES [dbo].[Adres] ([AdresId]);

GO
ALTER TABLE [dbo].[Model]
    ADD CONSTRAINT [FK_Model_Marka] FOREIGN KEY ([Marka]) REFERENCES [dbo].[Marka] ([MarkaId]);

GO
ALTER TABLE [dbo].[Pracownik]
    ADD CONSTRAINT [FK_Pracownik_Adres] FOREIGN KEY ([Adres]) REFERENCES [dbo].[Adres] ([AdresId]);

GO
ALTER TABLE [dbo].[Zamowienie]
    ADD CONSTRAINT [FK_Zamowienie_Klient] FOREIGN KEY ([KlientId]) REFERENCES [dbo].[Klient] ([KlientId]) ON DELETE SET DEFAULT;

GO
ALTER TABLE [dbo].[Zamowienie]
    ADD CONSTRAINT [FK_Zamowienie_Model] FOREIGN KEY ([ModelId]) REFERENCES [dbo].[Model] ([ModelId]) ON DELETE SET DEFAULT;

GO
ALTER TABLE [dbo].[Zamowienie]
    ADD CONSTRAINT [FK_Zamowienie_Pracownik] FOREIGN KEY ([PracownikId]) REFERENCES [dbo].[Pracownik] ([PracownikId]) ON DELETE SET DEFAULT;

GO
ALTER TABLE [HR].[StanowiskoPracownika]
    ADD CONSTRAINT [FK_StanowiskoPracownika_Pracownik] FOREIGN KEY ([PracownikId]) REFERENCES [dbo].[Pracownik] ([PracownikId]);

GO
ALTER TABLE [HR].[StanowiskoPracownika]
    ADD CONSTRAINT [FK_StanowiskoPracownika_Stanowisko] FOREIGN KEY ([ZajmowaneStanowisko]) REFERENCES [HR].[Stanowisko] ([ZajmowaneStanowisko]);

GO
ALTER TABLE [HR].[Wynagrodzenie]
    ADD CONSTRAINT [FK_Wynagrodzenie_Pracownik] FOREIGN KEY ([PracownikId]) REFERENCES [dbo].[Pracownik] ([PracownikId]);

GO
ALTER TABLE [HR].[Wyplata]
    ADD CONSTRAINT [FK_Wyplata_Pracownik] FOREIGN KEY ([PracownikId]) REFERENCES [dbo].[Pracownik] ([PracownikId]);

GO
ALTER TABLE [HR].[ZespolPracownika]
    ADD CONSTRAINT [FK_ZespolPracownik_Pracownik] FOREIGN KEY ([PracownikId]) REFERENCES [dbo].[Pracownik] ([PracownikId]);

GO
ALTER TABLE [HR].[ZespolPracownika]
    ADD CONSTRAINT [FK_ZespolPracownik_Zespol] FOREIGN KEY ([Zespol]) REFERENCES [HR].[Zespol] ([Zespol]);

GO
ALTER TABLE [Serwis].[HistoriaZamowienia]
    ADD CONSTRAINT [FK_HistoriaZamowienia_Pracownik] FOREIGN KEY ([PracownikId]) REFERENCES [dbo].[Pracownik] ([PracownikId]);

GO
ALTER TABLE [Serwis].[HistoriaZamowienia]
    ADD CONSTRAINT [FK_HistoriaZamowienia_Status] FOREIGN KEY ([Status]) REFERENCES [Serwis].[Status] ([Status]);

GO
ALTER TABLE [Serwis].[HistoriaZamowienia]
    ADD CONSTRAINT [FK_HistoriaZamowienia_Zamowienie] FOREIGN KEY ([ZamowienieId]) REFERENCES [Serwis].[Zamowienie] ([ZamowienieId]);

GO
ALTER TABLE [Serwis].[Zamowienie]
    ADD CONSTRAINT [FK_UslugaZamowienie_Model] FOREIGN KEY ([ModelId]) REFERENCES [dbo].[Model] ([ModelId]);

GO
ALTER TABLE [Serwis].[Zamowienie]
    ADD CONSTRAINT [FK_UslugaZamowienie_Usluga] FOREIGN KEY ([UslugaId]) REFERENCES [Serwis].[Usluga] ([UslugaId]);

GO
ALTER TABLE [dbo].[Adres]
    ADD CONSTRAINT [PK_Adres] PRIMARY KEY CLUSTERED ([AdresId] ASC);

GO
ALTER TABLE [dbo].[Cennik]
    ADD CONSTRAINT [PK_Cennik] PRIMARY KEY CLUSTERED ([CenaId] ASC);

GO
ALTER TABLE [dbo].[Klient]
    ADD CONSTRAINT [PK_Klient] PRIMARY KEY CLUSTERED ([KlientId] ASC);

GO
ALTER TABLE [dbo].[Marka]
    ADD CONSTRAINT [PK_Marka] PRIMARY KEY CLUSTERED ([MarkaId] ASC);

GO
ALTER TABLE [dbo].[Model]
    ADD CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED ([ModelId] ASC);

GO
ALTER TABLE [dbo].[Pracownik]
    ADD CONSTRAINT [PK_Pracownik] PRIMARY KEY CLUSTERED ([PracownikId] ASC);

GO
ALTER TABLE [dbo].[Zamowienie]
    ADD CONSTRAINT [PK_Zamowienie] PRIMARY KEY CLUSTERED ([ZamowienieId] ASC);

GO
ALTER TABLE [HR].[Stanowisko]
    ADD CONSTRAINT [PK_Stanowisko] PRIMARY KEY CLUSTERED ([ZajmowaneStanowisko] ASC);

GO
ALTER TABLE [HR].[StanowiskoPracownika]
    ADD CONSTRAINT [PK_StanowiskoPracownika] PRIMARY KEY CLUSTERED ([PracownikId] ASC, [ZajmowaneStanowisko] ASC);

GO
ALTER TABLE [HR].[Wynagrodzenie]
    ADD CONSTRAINT [PK_Wynagrodzenie] PRIMARY KEY CLUSTERED ([WynagrodzenieId] ASC);

GO
ALTER TABLE [HR].[Wyplata]
    ADD CONSTRAINT [PK_Wyplata] PRIMARY KEY CLUSTERED ([WyplataId] ASC);

GO
ALTER TABLE [HR].[Zespol]
    ADD CONSTRAINT [PK_Zespol] PRIMARY KEY CLUSTERED ([Zespol] ASC);

GO
ALTER TABLE [HR].[ZespolPracownika]
    ADD CONSTRAINT [PK_ZespolPracownik] PRIMARY KEY CLUSTERED ([PracownikId] ASC, [Zespol] ASC);

GO
ALTER TABLE [Serwis].[HistoriaZamowienia]
    ADD CONSTRAINT [PK_HistoriaZamowienia] PRIMARY KEY CLUSTERED ([HistoriaZamowieniaId] ASC);

GO
ALTER TABLE [Serwis].[Status]
    ADD CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED ([Status] ASC);

GO
ALTER TABLE [Serwis].[Usluga]
    ADD CONSTRAINT [PK_Usluga] PRIMARY KEY CLUSTERED ([UslugaId] ASC);

GO
ALTER TABLE [Serwis].[Zamowienie]
    ADD CONSTRAINT [PK_UslugaZamowienie] PRIMARY KEY CLUSTERED ([ZamowienieId] ASC);

GO
ALTER TABLE [dbo].[Marka]
    ADD CONSTRAINT [UQ_KodMarki] UNIQUE NONCLUSTERED ([KodMarki] ASC);

GO
ALTER TABLE [dbo].[Klient]
    ADD CONSTRAINT [UQ_NIP] UNIQUE NONCLUSTERED ([NIP] ASC);

GO
ALTER TABLE [dbo].[Klient]
    ADD CONSTRAINT [UQ_NrDowoduOsobistego] UNIQUE NONCLUSTERED ([NrDowoduOsobistego] ASC);

GO
ALTER TABLE [dbo].[Pracownik]
    ADD CONSTRAINT [UQ_Pracownik_PESEL] UNIQUE NONCLUSTERED ([PESEL] ASC);

GO
CREATE PROCEDURE [dbo].[CennikInsert]
AS
DECLARE @dateFrom AS DATE = '20190101';
DECLARE @dateTo AS DATE = DATEADD(DAY, 30, @dateFrom);
WHILE @dateFrom < GETDATE()
    BEGIN
        INSERT INTO [dbo].[Cennik] (ModelId, Cena, ObowiazujeOd, ObowiazujeDo)
        SELECT m.ModelId,
               ABS(FLOOR(RAND() * (500))) * 10,
               @dateFrom,
               @dateTo
        FROM   [dbo].[Model] AS m;
        SET @dateFrom = @dateTo;
        SET @dateTo = DATEADD(DAY, 30, @dateFrom);
    END

GO
CREATE PROCEDURE [dbo].[SerwisHistoriaZamowieniaInsert]
AS
DECLARE @data AS DATE = '20190101';
WHILE @data < GETDATE()
    WHILE (SELECT COUNT(*)
           FROM   Serwis.HistoriaZamowienia) < (SELECT COUNT(*)
                                                FROM   Serwis.Zamowienie)
        BEGIN
            DECLARE @ZamowienieId AS INT = (SELECT   TOP 1 ZamowienieId
                                            FROM     [dbo].[Zamowienie]
                                            ORDER BY NEWID());
            DECLARE @PracownikId AS INT = (SELECT   TOP 1 PracownikId
                                           FROM     [dbo].Pracownik
                                           ORDER BY NEWID());
            DECLARE @Status AS NVARCHAR (20);
            DECLARE @amount AS INT = 200;
            IF (@amount % 2 = 1)
                SET @Status = 'W trakcie';
            ELSE
                SET @Status = 'Zakonczono';
            INSERT  INTO Serwis.HistoriaZamowienia (ZamowienieId, PracownikId, [Status], HistoriaZamowieniaData)
            VALUES                                (@ZamowienieId, @PracownikId, @Status, @data);
            SET @data = DATEADD(DAY, 1, @data);
            SET @amount = 200 - FLOOR(RAND(CAST (NEWID() AS VARBINARY)) * (200 - 1) + 1);
        END

GO
CREATE PROCEDURE [dbo].[SerwisZamowienie]
AS
BEGIN
    DECLARE @ModelID AS INT = (SELECT   TOP 1 ModelId
                               FROM     [dbo].[Zamowienie]
                               ORDER BY NEWID());
    DECLARE @UslugaID AS INT = (SELECT   TOP 1 UslugaId
                                FROM     Serwis.Usluga
                                ORDER BY NEWID());
    INSERT  INTO Serwis.Zamowienie ([ModelId], [UslugaId], [ZamowienieCena])
    VALUES                        (@ModelId, @UslugaID, ABS(FLOOR(RAND() * (20))) * 100);
END

GO
CREATE PROCEDURE [dbo].[SerwisZamowienieInsert]
AS
WHILE (SELECT COUNT(*)
       FROM   Serwis.Zamowienie) < 50
    BEGIN
        DECLARE @ModelID AS INT = (SELECT   TOP 1 ModelId
                                   FROM     [dbo].[Zamowienie]
                                   ORDER BY NEWID());
        DECLARE @UslugaID AS INT = (SELECT   TOP 1 UslugaId
                                    FROM     Serwis.Usluga
                                    ORDER BY NEWID());
        INSERT  INTO Serwis.Zamowienie ([ModelId], [UslugaId], [ZamowienieCena])
        VALUES                        (@ModelId, @UslugaID, FLOOR(RAND(CAST (NEWID() AS VARBINARY)) * (1800 - 100) + 100));
    END

GO
CREATE PROCEDURE [dbo].[ZamowienieInsert]
AS
DECLARE @data AS DATE = '20190101';
WHILE @data < GETDATE()
    BEGIN
        DECLARE @ModelId AS INT = (SELECT   TOP 1 ModelId
                                   FROM     [dbo].[Model]
                                   ORDER BY NEWID());
        DECLARE @PracownikId AS INT = (SELECT   TOP 1 PracownikId
                                       FROM     [HR].[StanowiskoPracownika] AS sp
                                       WHERE    sp.ZajmowaneStanowisko = 'Konsultant'
                                       ORDER BY NEWID());
        DECLARE @KlientId AS INT = (SELECT   TOP 1 KlientId
                                    FROM     [dbo].[Klient]
                                    ORDER BY NEWID());
        INSERT INTO [dbo].[Zamowienie] (ModelId, PracownikId, KlientId, CenaZamowienia, DataZamowienia, DataOdbioru, Zrealizowane, Oplacone)
        SELECT c.ModelId,
               @PracownikId,
               @KlientId,
               c.Cena,
               @data,
               @data,
               1,
               1
        FROM   Cennik AS c
        WHERE  c.ModelId = @ModelId
               AND c.ObowiazujeOd <= @data
               AND c.ObowiazujeDo > @data;
        SET @data = DATEADD(DAY, 1, @data);
    END

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
