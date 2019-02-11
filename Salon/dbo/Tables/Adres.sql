CREATE TABLE [dbo].[Adres] (
    [AdresId]      INT            IDENTITY (1, 1) NOT NULL,
    [Ulica]        NVARCHAR (50)  NOT NULL,
    [Budynek]      NVARCHAR (5)   NOT NULL,
    [NrMieszkania] TINYINT        NULL,
    [Miasto]       NVARCHAR (100) NOT NULL,
    [Kraj]         NVARCHAR (50)  NOT NULL,
    [KodPocztowy]  NVARCHAR (6)   NULL,
    CONSTRAINT [PK_Adres] PRIMARY KEY CLUSTERED ([AdresId] ASC)
);

