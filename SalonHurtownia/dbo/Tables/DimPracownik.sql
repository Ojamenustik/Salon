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

