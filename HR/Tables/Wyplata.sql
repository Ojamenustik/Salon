CREATE TABLE [HR].[Wyplata] (
    [WyplataId]    INT          IDENTITY (1, 1) NOT NULL,
    [PracownikId]  INT          NOT NULL,
    [KwotaWyplaty] SMALLMONEY   NOT NULL,
    [TypWyplaty]   NVARCHAR (6) NOT NULL,
    [WyplataOkres] DATE         NOT NULL,
    CONSTRAINT [PK_Wyplata] PRIMARY KEY CLUSTERED ([WyplataId] ASC),
    CHECK ([TypWyplaty]='Pensja' OR [TypWyplaty]='Premia'),
    CONSTRAINT [FK_Wyplata_Pracownik] FOREIGN KEY ([PracownikId]) REFERENCES [dbo].[Pracownik] ([PracownikId])
);

