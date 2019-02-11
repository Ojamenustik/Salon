CREATE VIEW [rapOp].[v_ZamowieniaDlaMarki] AS 
	SELECT ma.Nazwa, COUNT(z.ZamowienieId) AS Zamowienia, SUM(z.CenaZamowienia) AS Suma
	FROM [dbo].[Marka] AS ma WITH (NOLOCK)
	LEFT JOIN [dbo].[Model] AS mo ON mo.Marka = ma.MarkaId
	LEFT JOIN [dbo].[Zamowienie] AS z ON z.ModelId = mo.ModelId
	GROUP BY ma.Nazwa;