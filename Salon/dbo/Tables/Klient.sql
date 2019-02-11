CREATE TABLE [dbo].[Klient] (
    [KlientId]           INT           IDENTITY (1, 1) NOT NULL,
    [Imie]               NVARCHAR (50) NOT NULL,
    [Nazwisko]           NVARCHAR (50) NOT NULL,
    [Mail]               NVARCHAR (40) NULL,
    [Telefon]            CHAR (9)      NOT NULL,
    [NrDowoduOsobistego] CHAR (9)      NULL,
    [NIP]                CHAR (10)     NULL,
    [Adres]              INT           NULL,
    CONSTRAINT [PK_Klient] PRIMARY KEY CLUSTERED ([KlientId] ASC),
    CONSTRAINT [FK_Klient_Adres] FOREIGN KEY ([Adres]) REFERENCES [dbo].[Adres] ([AdresId]),
    CONSTRAINT [UQ_NIP] UNIQUE NONCLUSTERED ([NIP] ASC),
    CONSTRAINT [UQ_NrDowoduOsobistego] UNIQUE NONCLUSTERED ([NrDowoduOsobistego] ASC)
);

