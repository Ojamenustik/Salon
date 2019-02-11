CREATE TABLE [HR].[Wynagrodzenie] (
    [WynagrodzenieId]    INT   IDENTITY (1, 1) NOT NULL,
    [PracownikId]        INT   NOT NULL,
    [KwotaWynagrodzenia] MONEY NOT NULL,
    [WynagrodzenieOd]    DATE  NOT NULL,
    [WynagrodzenieaDo]   DATE  NULL,
    CONSTRAINT [PK_Wynagrodzenie] PRIMARY KEY CLUSTERED ([WynagrodzenieId] ASC),
    CONSTRAINT [FK_Wynagrodzenie_Pracownik] FOREIGN KEY ([PracownikId]) REFERENCES [dbo].[Pracownik] ([PracownikId])
);

