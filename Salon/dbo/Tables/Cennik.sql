CREATE TABLE [dbo].[Cennik] (
    [CenaId]       INT   IDENTITY (1, 1) NOT NULL,
    [ModelId]      INT   DEFAULT ((-1)) NOT NULL,
    [Cena]         MONEY NOT NULL,
    [ObowiazujeOd] DATE  NOT NULL,
    [ObowiazujeDo] DATE  NULL,
    CONSTRAINT [PK_Cennik] PRIMARY KEY CLUSTERED ([CenaId] ASC),
    CONSTRAINT [FK_Cennik_Model] FOREIGN KEY ([ModelId]) REFERENCES [dbo].[Model] ([ModelId]) ON DELETE SET DEFAULT ON UPDATE CASCADE
);

