CREATE TABLE [HR].[ZespolPracownika] (
    [PracownikId] INT           NOT NULL,
    [Zespol]      NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_ZespolPracownik] PRIMARY KEY CLUSTERED ([PracownikId] ASC, [Zespol] ASC),
    CONSTRAINT [FK_ZespolPracownik_Pracownik] FOREIGN KEY ([PracownikId]) REFERENCES [dbo].[Pracownik] ([PracownikId]),
    CONSTRAINT [FK_ZespolPracownik_Zespol] FOREIGN KEY ([Zespol]) REFERENCES [HR].[Zespol] ([Zespol])
);

