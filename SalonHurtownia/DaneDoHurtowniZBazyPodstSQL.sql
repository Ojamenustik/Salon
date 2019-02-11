SET IDENTITY_INSERT [Salon_hurtownia].[dbo].[DimPracownik] ON;
INSERT INTO [Salon_hurtownia].[dbo].[DimPracownik]
		
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
FROM	  	[Salon_1].[dbo].[Pracownik]
INNER JOIN	[Salon_1].[dbo].[Adres]		ON [Salon_1].[dbo].[Adres].[AdresId] = [Salon_1].[dbo].[Pracownik].[Adres]
SET IDENTITY_INSERT [Salon_hurtownia].[dbo].[DimPracownik] OFF;
GO
--------ok

SET IDENTITY_INSERT [Salon_hurtownia].[dbo].[DimKlient] ON;
INSERT INTO [Salon_hurtownia].[dbo].[DimKlient]
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
FROM		[Salon_1].[dbo].[Klient]	
INNER JOIN	Salon_1.[dbo].[Adres] ON [Salon_1].[dbo].[Adres].[AdresId] = [Salon_1].[dbo].[Klient].[Adres]
SET IDENTITY_INSERT [Salon_hurtownia].[dbo].[DimKlient] OFF;
GO

------------------------ok

SET IDENTITY_INSERT [Salon_hurtownia].[HR].[DimWyplata] ON;
INSERT INTO [Salon_hurtownia].[HR].[DimWyplata]
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
  FROM [Salon_1].[HR].[Wyplata]
SET IDENTITY_INSERT [Salon_hurtownia].[HR].[DimWyplata] OFF;
GO

-------------ok

SET IDENTITY_INSERT [Salon_hurtownia].[HR].[DimWynagrodzenie] ON;
INSERT INTO [Salon_hurtownia].[HR].[DimWynagrodzenie]
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
FROM [Salon_1].[HR].[Wynagrodzenie]
SET IDENTITY_INSERT [Salon_hurtownia].[HR].[DimWynagrodzenie] OFF;
GO

----------------------------ok

INSERT INTO [Salon_hurtownia].[HR].[DimZespolPracownika]
           ([Pracownik_Id],
		   	[Zespol]      
		   )
SELECT [PracownikId],
		   	[Zespol]
FROM [Salon_1].[HR].[ZespolPracownika]
GO

----------------ok

INSERT INTO [Salon_hurtownia].[HR].[DimStanowiskoPracownika]
           ([Pracownik_Id],
		   	[Stanowisko],  
		   	[OkresOd],     
		   	[OkresDo]
		   )
SELECT [PracownikId],
		   	[ZajmowaneStanowisko],  
		   	[OkresOd],     
		   	[OkresDo]
FROM [Salon_1].[HR].[StanowiskoPracownika]
GO

----------------------ok

SET IDENTITY_INSERT [Salon_hurtownia].[dbo].[Zamowienie] ON;
INSERT INTO [Salon_hurtownia].[dbo].[Zamowienie]
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

FROM		[Salon_1].[dbo].[Zamowienie]
INNER JOIN	[Model]	AS m	ON m.[ModelId]		= [Zamowienie].[ModelId]
INNER JOIN  [Marka]	AS ma	ON ma.[MarkaId]		= m.[ModelId]
INNER JOIN  [Cennik] AS c	ON c.[ModelId]	= m.[ModelId]
WHERE [ObowiazujeDo]   > [Zamowienie].[DataOdbioru]
  AND [ObowiazujeOd] <= [Zamowienie].[DataOdbioru]
SET IDENTITY_INSERT [Salon_hurtownia].[dbo].[Zamowienie] OFF;
GO

----------------------------ok

SET IDENTITY_INSERT [Salon_hurtownia].[Serwis].[DimHistoriaZamowien] ON;
INSERT INTO [Salon_hurtownia].[Service].[DimHistoriaZamowien]
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
FROM [Salon_1].[Serwis].[HistoriaZamowienia]
INNER JOIN [Salon_1].[Serwis].[Zamowienie]	ON [Salon_1].[Serwis].[Zamowienie].[ZamowienieId]   = [Salon_1].[Serwis].[HistoriaZamowienia].[ZamowienieId]
INNER JOIN [Salon_1].[Serwis].[Usluga]	ON [Salon_1].[Serwis].[Usluga].[UslugaId] = [Salon_1].[Serwis].[Zamowienie].[UslugaId]
SET IDENTITY_INSERT [Salon_hurtownia].[Serwis].[DimHistoriaZamowien] OFF;
GO

-------------------------------------ok