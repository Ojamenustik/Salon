CREATE VIEW [rapOp].[v_ModeleBrakZamowien] AS
	SELECT m.*
	FROM [dbo].[Model] AS m WITH (NOLOCK)
	LEFT JOIN [dbo].[Zamowienie] AS z ON z.ModelId = m.ModelId
	WHERE z.ZamowienieId IS NULL;