CREATE TABLE [HR].[Stanowisko] (
    [ZajmowaneStanowisko] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Stanowisko] PRIMARY KEY CLUSTERED ([ZajmowaneStanowisko] ASC),
    UNIQUE NONCLUSTERED ([ZajmowaneStanowisko] ASC)
);

