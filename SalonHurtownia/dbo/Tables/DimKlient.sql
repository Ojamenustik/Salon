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

