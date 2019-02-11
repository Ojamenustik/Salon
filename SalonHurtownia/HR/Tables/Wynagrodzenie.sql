CREATE TABLE [HR].[Wynagrodzenie] (
    [Wynagrodzenie_Id]   INT   IDENTITY (1, 1) NOT NULL,
    [Pracownik_Id]       INT   NOT NULL,
    [KwotaWynagrodzenia] MONEY NOT NULL,
    [WynagrodzenieOd]    DATE  NOT NULL,
    [WynagrodzenieDo]    DATE  NULL,
    CONSTRAINT [PK_Wynagrodzenie] PRIMARY KEY CLUSTERED ([Wynagrodzenie_Id] ASC),
    CONSTRAINT [FK_Wynagrodzenie_Employee] FOREIGN KEY ([Pracownik_Id]) REFERENCES [dbo].[DimPracownik] ([Pracownik_Id])
);

