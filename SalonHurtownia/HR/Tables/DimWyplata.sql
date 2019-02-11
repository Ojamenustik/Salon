CREATE TABLE [HR].[DimWyplata] (
    [Wyplata_Id]   INT          IDENTITY (1, 1) NOT NULL,
    [Pracownik_Id] INT          NOT NULL,
    [KwotaWyplaty] SMALLMONEY   NOT NULL,
    [TypWyplaty]   NVARCHAR (6) NOT NULL,
    [OkresWyplaty] DATE         NOT NULL,
    CONSTRAINT [PK_Wyplata] PRIMARY KEY CLUSTERED ([Wyplata_Id] ASC),
    CHECK ([TypWyplaty]='Pensja' OR [TypWyplaty]='Premia'),
    CONSTRAINT [FK_Wyplata_Pracownik] FOREIGN KEY ([Pracownik_Id]) REFERENCES [dbo].[DimPracownik] ([Pracownik_Id])
);

