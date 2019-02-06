CREATE TABLE [dbo].[Pracownik] (
    [PracownikId]      INT           IDENTITY (1, 1) NOT NULL,
    [Imie]             NVARCHAR (20) NOT NULL,
    [Nazwisko]         NVARCHAR (40) NOT NULL,
    [Telefon]          CHAR (9)      NOT NULL,
    [PESEL]            CHAR (11)     NULL,
    [Adres]            INT           NULL,
    [Mail]             NVARCHAR (40) NULL,
    [DataZatrudnienia] DATE          NULL,
    CONSTRAINT [PK_Pracownik] PRIMARY KEY CLUSTERED ([PracownikId] ASC),
    CHECK ([DataZatrudnienia]<=getdate()),
    CONSTRAINT [FK_Pracownik_Adres] FOREIGN KEY ([Adres]) REFERENCES [dbo].[Adres] ([AdresId]),
    CONSTRAINT [UQ_PracownikPESEL] UNIQUE NONCLUSTERED ([PESEL] ASC)
);

