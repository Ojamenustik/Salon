CREATE view rapOp.v_najczesciejNaprawianeAuta AS
--pokazuje top 3 najczęściej naprawianych modeli aut
select TOP(3) Mycount, m.Nazwa 
from (select COUNT(ModelId) as Mycount
		from Zamowienie AS z with (NoLock)) AS tab  
JOIN Model m ON m.ModelId=(select ModelId
		from Zamowienie with (NoLock))
order by Mycount desc