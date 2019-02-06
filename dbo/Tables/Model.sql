CREATE TABLE [dbo].[Model] (
    [ModelId]     INT            IDENTITY (1, 1) NOT NULL,
    [Nazwa]       NVARCHAR (50)  NOT NULL,
    [Typ]         NVARCHAR (50)  NULL,
    [Paliwo]      NVARCHAR (50)  NULL,
    [Wyposazenie] NVARCHAR (MAX) NULL,
    [Kolor]       NVARCHAR (50)  NULL,
    [Dostepnosc]  BIT            NOT NULL,
    [Marka]       CHAR (4)       NOT NULL,
    CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED ([ModelId] ASC),
    CONSTRAINT [FK_Model_Marka] FOREIGN KEY ([Marka]) REFERENCES [dbo].[Marka] ([MarkaId])
);

