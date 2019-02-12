CREATE view rapOp.v_SumaZamowienZespolu AS
--pokazuje sumy wszytskich zamówień dla zespołów na każdy rok
select year(hz.HistoriaZamowieniaData) as ROK, zp.Zespol, SUM(z.ZamowienieCena) As SumaZrealizowanychZamowien 
from Serwis.HistoriaZamowienia AS hz with (READUNCOMMITTED)
INNER JOIN HR.ZespolPracownika zp ON zp.PracownikId=hz.PracownikId
INNER JOIN Serwis.Zamowienie z ON hz.ZamowienieId=z.ZamowienieId
where hz.[status] = 'Zakonczono'
group by year(hz.HistoriaZamowieniaData), zp.Zespol