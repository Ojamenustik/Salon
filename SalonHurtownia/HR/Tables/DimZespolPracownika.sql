CREATE TABLE [HR].[DimZespolPracownika] (
    [Pracownik_Id] INT           NOT NULL,
    [Zespol]       NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_ZespolPracownika] PRIMARY KEY CLUSTERED ([Pracownik_Id] ASC, [Zespol] ASC),
    CONSTRAINT [FK_ZespolPracownika_Pracownik] FOREIGN KEY ([Pracownik_Id]) REFERENCES [dbo].[DimPracownik] ([Pracownik_Id])
);

