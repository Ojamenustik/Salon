CREATE view rapOp.v_pracownicyStatusyZakonczon AS
--pokazuje top 3 id pracowników, którzy mają najwięcej zakończonych zamówień
select TOP(3) PracownikId, Mycount 
from(select PracownikId, count([Status]) as Mycount
from Serwis.HistoriaZamowienia with (READUNCOMMITTED)
WHERE [status] = 'zakonczono'
group by PracownikId) as tab
ORDER BY Mycount desc