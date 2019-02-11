CREATE TABLE [dbo].[Marka] (
    [MarkaId]  CHAR (4)       NOT NULL,
    [KodMarki] NVARCHAR (20)  NOT NULL,
    [Nazwa]    NVARCHAR (100) NULL,
    [Kraj]     NVARCHAR (40)  NOT NULL,
    CONSTRAINT [PK_Marka] PRIMARY KEY CLUSTERED ([MarkaId] ASC),
    CONSTRAINT [UQ_KodMarki] UNIQUE NONCLUSTERED ([KodMarki] ASC)
);

