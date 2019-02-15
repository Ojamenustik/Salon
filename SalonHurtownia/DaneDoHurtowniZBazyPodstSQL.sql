SET IDENTITY_INSERT [SalonHurtownia].[dbo].[DimPracownik] ON;
INSERT INTO [SalonHurtownia].[dbo].[DimPracownik]
([Pracownik_Id],    
    [PESEL]        ,    
    [Imie]         ,    
    [Telefon]      ,    
    [Nazwisko]     ,    
    [DataZatrudnienia] ,
    [Mail]             ,
    [Ulica]            ,
    [Budynek]          ,
    [NrMieszkania]     ,
    [Miasto]           ,
    [Kraj]             ,
    [KodPocztowy] )    

SELECT	 [PracownikId],    
    [PESEL]        ,    
    [Imie]         ,    
    [Telefon]      ,    
    [Nazwisko]     ,    
    [DataZatrudnienia] ,
    [Mail]             ,
    [Ulica]            ,
    [Budynek]          ,
    [NrMieszkania]     ,
    [Miasto]           ,
    [Kraj]             ,
    [KodPocztowy]
FROM	  	[Salon].[dbo].[Pracownik]
INNER JOIN	[Salon].[dbo].[Adres]		ON [Salon].[dbo].[Adres].[AdresId] = [Salon].[dbo].[Pracownik].[Adres]
SET IDENTITY_INSERT [SalonHurtownia].[dbo].[DimPracownik] OFF;
GO

SET IDENTITY_INSERT [SalonHurtownia].[dbo].[DimKlient] ON;
INSERT INTO [SalonHurtownia].[dbo].[DimKlient]
		([Klient_Id]         ,
		 [NrDowoduOsobistego],
		 [Imie]              ,
		 [Nazwisko]          ,
		 [Mail]              ,
		 [Telefon]           ,
		 [NIP]               ,
		 [Ulica]             ,
		 [Budynek]           ,
		 [NrMieszkania]      ,
		 [Miasto]            ,
		 [Kraj]              ,
		 [KodPocztowy]   )    
 
SELECT   [KlientId]         ,
		 [NrDowoduOsobistego],
		 [Imie]              ,
		 [Nazwisko]          ,
		 [Mail]              ,
		 [Telefon]           ,
		 [NIP]               ,
		 [Ulica]             ,
		 [Budynek]           ,
		 [NrMieszkania]      ,
		 [Miasto]            ,
		 [Kraj]              ,
		 [KodPocztowy]   
FROM		[Salon].[dbo].[Klient]	
INNER JOIN	Salon.[dbo].[Adres] ON [Salon].[dbo].[Adres].[AdresId] = [Salon].[dbo].[Klient].[Adres]
SET IDENTITY_INSERT [SalonHurtownia].[dbo].[DimKlient] OFF;
GO

SET IDENTITY_INSERT [SalonHurtownia].[HR].[DimWyplata] ON;
INSERT INTO [SalonHurtownia].[HR].[DimWyplata]
           ([Wyplata_Id]  ,
		   	[Pracownik_Id],
		   	[KwotaWyplaty],
		   	[TypWyplaty]  ,
		   	[OkresWyplaty]
		   		   )
SELECT [WyplataId]  ,
		   	[PracownikId],
		   	[KwotaWyplaty],
		   	[TypWyplaty]  ,
		   	[WyplataOkres]
  FROM [Salon].[HR].[Wyplata]
SET IDENTITY_INSERT [SalonHurtownia].[HR].[DimWyplata] OFF;
GO

SET IDENTITY_INSERT [SalonHurtownia].[HR].[DimWynagrodzenie] ON;
INSERT INTO [SalonHurtownia].[HR].[DimWynagrodzenie]
           ([Wynagrodzenie_Id]   ,
		   	[Pracownik_Id]       ,
		   	[KwotaWynagrodzenia] ,
		   	[WynagrodzenieOd]    ,
		   	[WynagrodzenieDo]    
		    )
SELECT [WynagrodzenieId]   ,
		   	[PracownikId]       ,
		   	[KwotaWynagrodzenia] ,
		   	[WynagrodzenieOd]    ,
		   	[WynagrodzenieaDo]
FROM [Salon].[HR].[Wynagrodzenie]
SET IDENTITY_INSERT [SalonHurtownia].[HR].[DimWynagrodzenie] OFF;
GO

INSERT INTO [SalonHurtownia].[HR].[DimZespolPracownika]
           ([Pracownik_Id],
		   	[Zespol]      
		   )
SELECT [PracownikId],
		   	[Zespol]
FROM [Salon].[HR].[ZespolPracownika]
GO

INSERT INTO [SalonHurtownia].[HR].[DimStanowiskoPracownika]
           ([Pracownik_Id],
		   	[Stanowisko],  
		   	[OkresOd],     
		   	[OkresDo]
		   )
SELECT [PracownikId],
		   	[ZajmowaneStanowisko],  
		   	[OkresOd],     
		   	[OkresDo]
FROM [Salon].[HR].[StanowiskoPracownika]
GO

SET IDENTITY_INSERT [SalonHurtownia].[dbo].[Zamowienie] ON;
INSERT INTO [SalonHurtownia].[dbo].[Zamowienie]
           ([Zamowienie_Id]   ,  
		   	[Pracownik_Id]    ,  
		   	[Klient_Id]       ,  
		   	[CenaZamowienia]  ,  
		   	[DataZamowienia]  ,  
		   	[DataOdbioru]     ,  
		   	[Zrealizowane]    ,  
		   	[Oplacone]        ,  
		   	[KodMarki]        ,  
		   	[NazwaMarki]      ,  
		   	[KrajMarki]       ,  
		   	[NazwaModelu]     ,  
		   	[TypModelu]       ,  
		   	[PaliwoModelu]    ,  
		   	[WyposazenieModelu], 
		   	[KolorModelu]     ,  
		   	[DostepnoscModelu],  
		   	[CenaProduktu]    ,  
		   	[ObowiazujeOd]    ,  
		   	[ObowiazujeDo]      
		   )
SELECT [ZamowienieId]   ,  
		   	[PracownikId]    ,  
		   	[KlientId]       ,  
		   	[CenaZamowienia]  ,  
		   	[DataZamowienia]  ,  
		   	[DataOdbioru]     ,  
		   	[Zrealizowane]    ,  
		   	[Oplacone]        ,  
		   	[KodMarki]        ,  
		   	ma.[Nazwa]      ,  
		   	[Kraj]       ,  
		   	m.[Nazwa]     ,  
		   	m.[Typ]       ,  
		   	m.[Paliwo]    ,  
		   	m.[Wyposazenie], 
		   	m.[Kolor]     ,  
		   	m.[Dostepnosc],  
		   	c.[Cena]    ,  
		   	[ObowiazujeOd]    ,  
		   	[ObowiazujeDo]

FROM		[Salon].[dbo].[Zamowienie]
INNER JOIN	[Model]	AS m	ON m.[ModelId]		= [Zamowienie].[ModelId]
INNER JOIN  [Marka]	AS ma	ON ma.[MarkaId]		= m.[ModelId]
INNER JOIN  [Cennik] AS c	ON c.[ModelId]	= m.[ModelId]
WHERE [ObowiazujeDo]   > [Zamowienie].[DataOdbioru]
  AND [ObowiazujeOd] <= [Zamowienie].[DataOdbioru]
SET IDENTITY_INSERT [SalonHurtownia].[dbo].[Zamowienie] OFF;
GO

SET IDENTITY_INSERT [SalonHurtownia].[Serwis].[DimHistoriaZamowien] ON;
INSERT INTO [SalonHurtownia].[Service].[DimHistoriaZamowien]
([HistoriaZamowien_Id]  ,
 [Zamowienie_Id]        ,
 [Pracownik_Id]         ,
 [Status]               ,          
[HistoriaZamowieniaData],		   
[HistoriaZamowienOpis]  ,		   
[ZamowienieCena]        ,		   
[UslugaNazwa]           		   
 )
SELECT [HistoriaZamowien_Id]  ,
 [Zamowienie_Id]        ,
 [Pracownik_Id]         ,
 [Status]               ,          
[HistoriaZamowieniaData],		   
[HistoriaZamowienOpis]  ,		   
[ZamowienieCena]        ,		   
[UslugaNazwa]       
FROM [Salon].[Serwis].[HistoriaZamowienia]
INNER JOIN [Salon].[Serwis].[Zamowienie]	ON [Salon].[Serwis].[Zamowienie].[ZamowienieId]   = [Salon].[Serwis].[HistoriaZamowienia].[ZamowienieId]
INNER JOIN [Salon].[Serwis].[Usluga]	ON [Salon].[Serwis].[Usluga].[UslugaId] = [Salon].[Serwis].[Zamowienie].[UslugaId]
SET IDENTITY_INSERT [SalonHurtownia].[Serwis].[DimHistoriaZamowien] OFF;
GO
