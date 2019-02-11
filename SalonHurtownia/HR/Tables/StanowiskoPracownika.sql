CREATE TABLE [HR].[StanowiskoPracownika] (
    [Pracownik_Id] INT           NOT NULL,
    [Stanowisko]   NVARCHAR (50) NOT NULL,
    [OkresOd]      DATE          NOT NULL,
    [OkresDo]      DATE          NULL,
    CONSTRAINT [PK_StanowiskoPracownika] PRIMARY KEY CLUSTERED ([Pracownik_Id] ASC, [Stanowisko] ASC),
    CHECK ([OkresDo]>[OkresOd]),
    CONSTRAINT [FK_StanowiskoPracownika_Pracownik] FOREIGN KEY ([Pracownik_Id]) REFERENCES [dbo].[DimPracownik] ([Pracownik_Id])
);

