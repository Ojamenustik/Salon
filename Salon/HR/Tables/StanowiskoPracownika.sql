CREATE TABLE [HR].[StanowiskoPracownika] (
    [PracownikId]         INT           NOT NULL,
    [ZajmowaneStanowisko] NVARCHAR (50) NOT NULL,
    [OkresOd]             DATE          NOT NULL,
    [OkresDo]             DATE          NULL,
    CONSTRAINT [PK_StanowiskoPracownika] PRIMARY KEY CLUSTERED ([PracownikId] ASC, [ZajmowaneStanowisko] ASC),
    CHECK ([OkresDo]>[OkresOd]),
    CONSTRAINT [FK_StanowiskoPracownika_Pracownik] FOREIGN KEY ([PracownikId]) REFERENCES [dbo].[Pracownik] ([PracownikId]),
    CONSTRAINT [FK_StanowiskoPracownika_Stanowisko] FOREIGN KEY ([ZajmowaneStanowisko]) REFERENCES [HR].[Stanowisko] ([ZajmowaneStanowisko])
);

