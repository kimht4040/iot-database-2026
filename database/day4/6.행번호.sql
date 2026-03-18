set @seq := 0;
select (@seq:=@seq+1) "순번",
       custid,
       name,
       phone
from Customer
where @seq < 3
order by custid desc;



