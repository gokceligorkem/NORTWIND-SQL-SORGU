--use NORTHWND
--select*from Shippers
--select CompanyName from Shippers
--select *from Emplloyees

--select FirstName+''+LastName as [Ad Soyad], datediff(year,BirthDate,getdate()) as Ya� from Employees 

--�r�n tablosundaki �r�nleri isimleri,fiyatlar� ve kdv dahil fiyatlar� �eklinde listeleyiniz.
--select productName as '�r�n Ad�', UnitPrice as 'Fiyat',(UnitPrice*1.8) as 'KDV F�YAT' from Products

--�ALI�AN TABLOSUNDAK� LONDRADA YA�ANLARI GET�RME
--select *from Employees where City='London'
--select *from Employees where City like 'L%'--%L% --%L

--Mart ay�nda al�nm�� olan sipari�lerin ORDERID,ORDerDATE kolonlar� olacak �ekilde listeleyiniz.
--select *from Orders where Month(OrderDate)=3 --Mart ay�ndaki sipari�leri getirdik.
--select OrderID,OrderDate from Orders where DATENAME (month,OrderDate)='March'

--Kategori�D si  5 olmayan �r�nlerin adlar�n� ve CategoryIDlerini listeleyen sorgu yaz�n�z. 

--select CategoryID,ProductName from Products where CategoryID !=5 -- <> �eklindede e�it olmad���n� ifade edebiliriz

--1993 tarihinden sonra i�e girmi� personelin ad�n� ve soyad�n� yaz�n�z ve i�e giri� tarihini listeleyiniz

--select LastName,FirstName,HireDate from Employees where HireDate>='1993' 

--Mant�ksal operat�rler AND VE OR

--�r�n stok miktar� 20-50 aras�ndaki �r�nleri listeleyim
--select ProductName, UnitsInStock from Products where UnitsInStock>=20 and UnitsInStock<=50
--Ya�� 50den b�y�k �ngilterede oturmayan �al��anlar�n  adlar�n� ve ya�lar�n� listeleyiniz.
--�simler �u formatta olmal�d�r A.Fuller
--select LEFT(FirstName,1)+'.' as FirstName ,LastName,Country, datediff(year,BirthDate,getdate()) as BirthDate from Employees   where Country<>'UK' and datediff(year,BirthDate,getdate())>50  
--1997 dahil y�l�ndan sonra al�nm�� kargo �creti(Freight) 20 den b�y�k ve Fransaya g�nderilmemi� (ShipCountry) 
--sipari�lerin OrderID,sipari� tarihleri ve teslimtarihleri(shippedDate) ve kargo �cretlerini listeleyiniz.
--select*from  Orders
--select OrderID,OrderDate,ShippedDate,Freight,ShipCountry from Orders where OrderDate>='1997' and Freight>'20' and ShipCountry!='France' 

--null ifadeleri
--M��teriye hen�z ula�mam�� sipari�leri listeyelim.

--select OrderID,OrderDate,ShippedDate from Orders where ShippedDate is null
--M��teriye hen�z ula�m�� sipari�leri listeyelim.
--select OrderID,OrderDate,ShippedDate from Orders where ShippedDate is not null

--Kimseye Rapor vermeyen personelin Ad� Soyad� ve �nvan� sutunlar�n� getirerek listeleyelim.
--select LastName,FirstName,TitleOfCourtesy from Employees where ReportsTo is null

--Kategori Id si =5 olan �r�n bedeli 20< b�y�k  100> den k���k olan ve stok null olmayan �r�nleri listeleyiniz
--SELECT CategoryID,UnitPrice,UnitsInStock from Products where CategoryID=5 and UnitPrice>20 and UnitPrice<100  and UnitsInStock is  not null


--DUMON YADA ALFKI OLAN CUSTOMER �DLER�NE SAH�P m��teriler taraf�ndan 1 nolu personelin onaylad��� 3 nolu kargo firmas� taraf�ndan ta��nm�� Shipregion � null olan 
--sipari�leri listeleyiniz.
--select *from Orders where (CustomerID='DUMON' or CustomerID='ALFKI') and EmployeeID=1 and ShipVia='3' and ShipRegion is null


--Sipari� tablosunda 3,5,7,12 product idlerini i�ermeyen kay�tlar� listeleyiniz.
--select* from [Order Details] where ProductID not in (3,5,7,12)
--���nc� karakteri a,b,c den bir tanesi olan �r�nleri listeleyiniz
--select*from Products where ProductName   like  '__[abc]%'
--select*from Products where ProductName not  like  '__[abc]%'
--S�ralama komutu Order by desc (b�y�kten k����e ) asc(k���kten b�y��e) 

--Personellerimizi A-Z ye s�ralayal�m
--select EmployeeID,FirstName+'' +LastName as'adsoyad' from Employees order by AdSoyad asc
--select EmployeeID,FirstName+'' +LastName as'adsoyad' from Employees order by AdSoyad desc

--�lkesi fransa olan m��terileri �irker adlar�na g�re s�ral� bir �ekilde listeleyiniz.
--select*from Customers where Country='France' order by CompanyName  asc

--Stok miktar� 50den b�y�k olan fiyatlar�na g�re �r�nleri listeleyin
--select *from Products where UnitsInStock>'50'order by UnitPrice asc

--�r�nler tablosunda t�m �r�nler fiyat�na g�re a dan z ye s�ral� �r�n fiyat� ayn� olanlar stok miktar�na g�re z den a
--s�ral� �ekilde listeleyiniz.

--select *from Products  order by UnitPrice asc ,UnitsInStock desc

--select distinct Country from Employees
--Birden fazla ayn� isimli kay�tlar� tek bir kay�t olarak g�stermek i�in distinct komutu kullan�r�z.
--Sipari� detayda sat�lan �r�nleri idlerine g�re listeleyiniz.

--select distinct ProductID,UnitPrice from [Order Details] order by ProductID 

--select top(10)*from Products
--fiyat� 50 den b�y�k olan �r�nlerden sat�� adedi en fazla 10 �r�n� listeleyiniz.
--select top(10)*from [Order Details] where UnitPrice>'50'order by Quantity desc
--select top(10) with ties *from [Order Details] where UnitPrice>'50'order by Quantity desc

--between-and kal�b� 
--stok miktar� 20den b�y�k 49dan k���k �r�nleri listeliyiniz.
--select *from products Products where UnitsInStock between 20 and 40 order by UnitsInStock

--ba� harfi c olan stoklarda mevcut 10 ile 250  dolar aras� �creti olan �r�nleri fiyatlar�na g�re listeleyiniz.

--select *from Products  where ProductName like 'C%' and UnitPrice between '10' and '250' and
--UnitsInStock>0 order by UnitPrice 

--�ar�amba g�n� al�nan kargo �creti 20-75 aras�nda olan teslim tarihi olmayan sipari�lerin bilgilerini raporlay�n�z.
--OrderID sine g�re b�y�kten k����e do�ru s�ralay�n�z.
--use NORTHWND
--select*from Orders  where Freight between '20' and '75' and ShippedDate is null and  dateName (weekday, OrderDate)='Wednesday' order by OrderID desc

--Arama ��lemleri (LIKE)
--select CompanyName from Customers where CompanyName like 'A%'
--select CompanyName from Customers where CompanyName like '%A'
--select CompanyName from Customers where CompanyName like '%ltd%'
--select CompanyName from Customers where CompanyName like '__mon%'
--select CompanyName from Customers where CompanyName like '[AS]%' 
--select CompanyName from Customers where CompanyName like '[A-D]%' �LK HARF� A OLUP D HARF� ARASINDA OLANLAR
--select CompanyName from Customers where CompanyName like 'A[^N]%' �LK HARF� A OLUP N OLMAYANLAR

--�lkesi ingiltere olmayan adi a ile ba�lay�p soyad� r ile biten do�um tarihi 1985 ten �nce olan  �al��anlar�n listeleyiniz.
--select FirstName,LastName,BirthDate,Country from Employees where LastName like '%r' and FirstName like 'A%' and Country!='UK' and DATENAME(year,BirthDate)<'1985'  

--Japoncaya ak�c� konu�an personel kimdir? japanese
--select  * from Employees where Notes like '%japanese%'

--Aggreate Fonksiyonlar

--Sql tan�mlanm�� hesaplama fonksiyonlar� (count,max,min,sum,avg)
--Stokta bulunan ka� tane �r�n�m�z vard�r?
--select count(ProductID) from Products where UnitsInStock>0


--1996 y�l�ndan sonra al�nm�� ka� adet sipari� vard�r?
--select count(OrderID) from Orders where datename(year,OrderDate)>'1996'


--Ka� �lkeden m��terimiz bulunmaktad�r.
--select count(DISTINCT Country) as �lkeSay�s� from Customers


--Stoktaki bulunan t�m �r�nlerin toplam fiyat� nekadard�r.
--select Sum(UnitPrice) from Products where UnitsInStock>0



--1997 y�l�nda al�nm�� sipari�ler i�in toplam ne kadarl�k Kargo �demesi yap�lm��t�r
--select  sum(Freight) from Orders where datename(year,OrderDate)='1997'

--T�m y�llardaki al�nm�� olan sipari�leri i�in ortalama nekadarl�k kargo �demesi yap�lm��t�r.
--select sum(Freight)/count(OrderID) from Orders 

--�uana kadar toplam Ciromuz ne kadard�r? indirim hesaba kat�lacak
--select sum(UnitPrice*Quantity*(1-Discount)) from [Order Details]

--Bu zamana dek �denmi� ortalama kargo �creti nedir?(avg)
--select avg(Freight) from Orders

--�lke ba��na ortalama ne kadar kargo �creti �denmi�tir?
--select   sum(Freight)/ count (distinct ShipCountry) from Orders  

--select max(UnitPrice) from Products
--select min(UnitPrice) from Products

--M��teri Idleri ilk harfi A-K aras�nda olanlar�n vermi� olduklar�  sipari� tarihi 01.01.1997 ile 06.06.1997 aras�nda olan sipari�lere en az ne kadar 
--kargo �creti �denmi�tir.
--select  min(Freight) from Orders WHERE CustomerID like '[A-K]%' and OrderDate between '01.01.1997' and '06.06.1997' 

--Maksimum sat�� tutar�m�z ne kadard�r?
--select  max(UnitPrice*Quantity) from [Order Details] 

--En d���k sat�� tutar�m�z ne kadard�r?
--select  min(UnitPrice*Quantity) from [Order Details] 

--2,4,5,7 nolu �al��anlar�n alm�� olduklar� sipari�leri listeleyiniz
--select *from Employees WHERE EmployeeID in (2,4,5,7)

--1 yada 2 nolu kargo firmas� ile ta��m�� 1996 y�l�nda per�embe g�n� al�nm�� sipari�ler i�in �denen en y�ksek kargo bedeli
--select  max(Freight) as [1 ya da 2 nolu Kargo Firma]from Orders where
--ShipVia in (1,2) and datename(weekday,OrderDate)='Wednesday' and year(OrderDate)

--'CACTU','DUMON' YADA 'PERIC' idli m��teriler taraf�ndan istenmi� ,2 nolu kargo firmas�yla ta��nmam��
--kargo �creti 20-200 dolar aras� olan sipari�lere toplan ne kadarl�k kargo �creti yap�lm��t�r?

--select sum(Freight)from Orders where CustomerID in ('CACTU','DUMON','PERIC') and ShipVia!='2' and 
--Freight between 20 and 200

-------------------------------Switch Case = when - -case -----------------------------------------------------
--select FirstName+' '+LastName as 'AdSoyad',TitleOfCourtesy,Unvani=case TitleOfCourtesy
--when 'Mr.' then 'Bay'
--when 'Ms.' then 'Bayan'
--when 'Mrs.' then 'Bayan'
--when 'Dr.' then 'Doktor'
--else 'On Bilgi yok'
--end
--from Employees

--�r�n tablosunda stok miktar� 50den k���kler ekran kritik sok 
--stok miktar� 50 ve 75 olanlar ekranda normal stok
--sok miktar� 75den b�y�k olanlar ekranda stok fazlas� g�z�kecek �ekiilde stok durumu
--kolonu ekleyerek listelemenizi istiyoruz.
--select ProductName,UnitsInStock,[StokDurum]=case 

--when UnitsInStock<50 then 'Kritik Stok'
--when UnitsInStock between 50 and 75 then 'Normal Stok'
--when UnitsInStock>75 then 'Stok Fazlas�'

--end,UnitPrice,�r�nFiyat�=case
--when UnitPrice<50 then 'AzPahal�'
--when UnitPrice between 50 and 75 then 'Normal Fiyat'
--when UnitPrice>75 then 'Pahal�'
--end
--from Products order by UnitsInStock desc

-----------------Group By yap�s�-------------------------------------

--Normal gruplaman�n d���nda Aggreate fonksiyonlar�nda sutunlar�n�da sorguya dahil etmek i�in kullan�r�z.
--select Country,Count(Country) from Employees group by Country
--select CategoryID,COUNT(ProductID)  as [Kategoriye g�re Urun Say�s�] from Products group by CategoryID
--order by [Kategoriye g�re Urun Say�s�] desc

--Her bir kategoride �cret baz�nda toplam nekadarl�k �r�n�m var.

--select CategoryID,sum(UnitsInStock*UnitPrice)   from Products group by CategoryID

----hangi personel ka� sat�� yapm��t�r?
--select EmployeeID, count(*)as Yap�lansat�� from Orders group by EmployeeID


----hangi m��teri ka� kere al��veri� yapm��t�r?
--select CustomerID,COUNT(*)as [Ka� Kere Al��veri� yapm��] from Orders group by CustomerID

--Hangi tedarik�i hangi kategorideki �r�nden toplam tutar bulunmaktad�r.
--select SupplierID,CategoryID,sum(UnitPrice*UnitsInStock) from Products group by SupplierID,CategoryID order by SupplierID


------------------Alt Sorgular(SubQuery)--------
--��i�e sorgulard�r.Inner join yetersiz kald���nda  having i�lemi yetersiz kald���nda kullan�l�r.

--Ortalama �cretin �zerinde yer alan �r�nleri g�steriniz.
--select ProductName,UnitPrice,(select avg(UnitPrice) from Products ) as 'ORTALAMAF�YAT' from Products where UnitPrice> (select avg(UnitPrice) from Products ) 

--Nancy nin alm�� oldu�u sipari�lerin Idlerini listeleyiniz.

--select OrderID  from Orders  where     EmployeeID=(select EmployeeID from Employees where FirstName='Nancy') 

--Beverages kategorisine ait �r�nleri listeleyiniz.
--select ProductName,CategoryID from Products where CategoryID=(select CategoryID from Categories where CategoryName='Beverages')
--select ProductName,(select CategoryName from Categories where CategoryID=p.CategoryID) from Products p where p.CategoryID=(select CategoryID from Categories where CategoryName='Beverages')

--Nancy,Andrew yada Janet taraf�ndan al�nm�� ve speedy express ile ta��nm�� sipari�leri listeleyiniz.
--select OrderID,EmployeeID,ShipVia from orders Orders where
--EmployeeID in(select EmployeeID from Employees where FirstName in ('Nancy', 'Andrew', 'Janet'))
--and ShipVia in (select ShipperID from Shippers where CompanyName !='Speedy Express') 

--�r�nler tablosundaki �r�nleri �r�nleri getiren tedarik�ilerle beraber listeleyiniz.
--select ProductName,(select CompanyName from Suppliers s where  s.SupplierID= p.SupplierID)  from Products p 

--�r�nlerle birlikte �r�n�n sat�� adedini listeleyen sorguyu yaz�n�z
--select ProductName,(select sum(Quantity) from [Order Details] where ProductID=p.ProductID) from Products p

--hangi sat��ta ka� adet �r�n sat�lm��t�r.
--select  OrderID, (select sum(Quantity) from [Order Details] od where od.OrderID=o.OrderID) from Orders o


--VINET �d li m��terinin sipari�lerin �r�nlerini detayl� listeleyiniz. 
--select * from Orders where CustomerID='VINET'
 --select*from [Order Details] where OrderID in (select OrderID from Orders where CustomerID='VINET')


--3 numaral� �r�n�n sat���n�n yap�ld��� m��teri ID lerini listeleyiniz.
--select CustomerID from orders where OrderID in (select OrderID from [Order Details] where ProductID=3 )
--select  (select CustomerID from Orders a where a.OrderID=o.OrderID) from [Order Details] o where ProductID=3

--2 numaral� nakliyecinin ta��d��� 4 numaral� persnelin sat�� yapt��� m��terilin bilgilerini listeleyiniz.
--select*from Customers where CustomerID in (select CustomerID from Orders where EmployeeID=4 and ShipVia=2)


--Kategori ID si 5 olan �r�nlerin  detayl� sat�� listesini listeliyiz
--select*from [Order Details] where ProductID in (select ProductID from Products where CategoryID=5)

--En fazla sat�� adedi olan �r�n�m�z hangisidir?
--select top(1) ProductID,MAX(Quantity)as Miktar from [Order Details] group by ProductID order by Miktar desc

----En az sat�� adedi olan �r�n�m�z hangisidir?
--select top(1) ProductID,min(Quantity)as Miktar from [Order Details] group by ProductID order by Miktar asc


----En fazla sat�� yapan personelimiz?
--select top(1) EmployeeID,COUNT(*) as Miktar  from  Orders  group by EmployeeID order by  Miktar desc



------------------------------------JON�LER--------------------------------------------
--Joinler her iki tabloyu birbirine ba�larlar
--3 �e�it join vard�r.
--1)�nner Join
--2)Outer join
--2-1)Left outer join
--2-2)Right outer join 
--2-3)Full outer join
--3)Cross Join
--select p.ProductName,p.UnitPrice,p.UnitsInStock  from Products p
--inner join Categories c  on p.CategoryID=c.Category

--�r�nleri  adlar�n� tedarik eden �irketlerin adlar�na g�re listeleyiniz
--select s.ProductName,s.SupplierID from Products s 
--inner join Suppliers p on p.SupplierID=s.SupplierID


--�r�nlerin sat�� raporunu �r�n ad�,sat�� fiyat�,adet ve indirim oranlar� listeleyiniz 
--select
--p.ProductName as [�r�n Ad�],
--s.UnitPrice as [Sat�� Fiyat�] , 
--p.UnitsInStock as [Adet],
--s.Discount as [�ndirim Oran�]
--from Products p
--inner join [Order Details] s on s.ProductID =p.ProductID

--Hangi sat��ta hangi �r�nler sat�lm��t�r.
--select o.ProductID,s.OrderID,s.ShippedDate,p.ProductName,o.Quantity,o.UnitPrice
--from Orders s inner join [Order Details] o on  s.OrderID=o.OrderID  
--inner join Products p on p.ProductID=o.ProductID


--Hangi personel hangi m��teriye hangi tarihte sat�� yapm��t�r.
--Kullan�c� firmas� - �al��an Ad�,Sipari� Tarihi 
--select e.FirstName +' '+LastName as �al��anID,o.OrderDate,o.CustomerID,C.CompanyName
--from Orders o inner join Customers s on s.CustomerID=o.CustomerID
--inner join Employees e on e.EmployeeID=o.EmployeeID
--inner join Customers c on c.CustomerID=S.CustomerID

----Hangi m��teri hangi �r�nde ka� dolarl�k sat�n alm��t�r(Fiyat)
----ContacName,fiyat,�r�n�smi

--select od.CompanyName,(os.UnitPrice*os.Quantity*(1-Discount) )as Fiyat,ProductName,os.Quantity from Customers  od
--inner join Orders o on o.CustomerID=od.CustomerID
--inner join [Order Details] os on os.OrderID=o.OrderID
--inner join Products p on p.ProductID=os.ProductID

--hangi personel hangi kategoriden hangi �r�nleri satm��t�r.

--select cp.CategoryName,od.Quantity,od.ProductID,e.EmployeeID,e.FirstName+' '+LastName as [ �al��an Ad� Soyad�],p.ProductName
--from Employees e
--inner join Orders o on o.EmployeeID=e.EmployeeID
--inner join [Order Details] od on od.OrderID=o.OrderID
--inner join Products p on p.ProductID=od.ProductID
--inner join Categories cp on cp.CategoryID=p.CategoryID

--Beverages kategorisine ait stoklarda bulunan �r�nleri listeliyiniz.
--select * from  Products p
--inner join Categories c  on c.CategoryID=p.CategoryID where CategoryName='Beverages' and p.UnitsInStock>0

--Federal Shipping ile ta��nm�� ve nancy nin alm�� oldu�u sipari�leri listeleyiniz.
--select * from Orders o
--inner join Shippers s on ShipperID=o.ShipVia  
--inner join Employees em on em.EmployeeID=o.EmployeeID
--where s.CompanyName='Federal Shipping' and em.FirstName='Nancy'

--M��teri Tablosunda CompanyName'leri aras�nda a harfi bulunan vermi� oldu�u  sipari�leri Nancy,Andrew,Janet taraf�ndan
--al�nm��,Speed Express ile ta��nmam��  sipari�lere toplam nekadarl�k kargo �creti �denmi�tir.

--select sum(o.Freight) from Orders o
--inner join Shippers s on ShipperID= o.ShipVia
--inner join Customers cs on cs.CustomerID=o.CustomerID
--inner join Employees em on em.EmployeeID=o.EmployeeID
--where cs.CompanyName like '%a%' and em.FirstName in ('Nancy','Andrew','Janet') and s.CompanyName<>'Speedy Express'

--En �ok �r�n ald���m�z 3 toptanc�y�  alm�� oldu�umuz �r�n miktar�na g�re raporlay�n�z.
--select top(3) s.CompanyName,count(*) as [al�nansipari�] from Products p
--inner join Suppliers s on s.SupplierID=p.SupplierID
-- group by s.CompanyName
-- order by al�nansipari� desc 

--HER B�R �R�NDEN TOPLAM NE KADAR SATI� YAPI�MI�TIR VE O �R�NLER HANG� KATEGOR�YE A�TT�R
--select CategoryName,ProductName,SUM(od.Quantity*od.UnitPrice) AS GEL�R from [Order Details] od
--inner join Products p on p.ProductID=od.ProductID
--inner join Categories c on c.CategoryID=p.CategoryID
--group by CategoryName,ProductName
--ORDER BY GEL�R DESC

--SOL TABLOYLA �LG�L� �RNEK

--select* from Products p
--right outer join Categories c on c.CategoryID=p.CategoryID
--left outerda solunda kalan tabloyu baz al�r ve  fromun adresindekilerin hepsini getirir.

--select* from Products p
--full outer join Categories c on c.CategoryID=p.CategoryID


--Hangi �r�n hangi nakliye firmas� ile ta��nm��t�r.

--select s.CompanyName,p.ProductName from Products p
-- inner join [Order Details] od on od.ProductID=p.ProductID
--inner join Orders o on o.OrderID=od.OrderID
--left outer join Shippers s on s.ShipperID=o.ShipVia
--GROUP by s.CompanyName,p.ProductName


--Hangi tedarik�iden toplam ka� tl �r�n sat�lm��t�r.

--select s.CompanyName,SUM(od.Quantity*od.UnitPrice*(1-od.Discount)) as TotalFiyat  from Suppliers s
--inner  join Products pp on pp.SupplierID=s.SupplierID
--inner join [Order Details] od on od.ProductID=pp.ProductID
--group by s.CompanyName
--order by TotalFiyat desc

--Kategorilerin toplam sat�� tutar� listeleyiniz 
--select c.CategoryName,SUM(od.Quantity*od.UnitPrice*(1-od.Discount)) as Sat��Tutar� from Categories c
--left  join Products p on p.CategoryID=c.CategoryID
--left outer join [Order Details] od on od.ProductID=p.ProductID
--group by CategoryName
--order by Sat��Tutar� desc

--Nakliyecilerin toplam ta��d�klar� �r�nlerin sat�� tutarlar�n� listeleyiniz.

--select s.CompanyName,sum(od.Quantity*od.UnitPrice*(1-od.Discount)) from  Shippers s
--right join Orders o on o.ShipVia=s.ShipperID
--inner join [Order Details] od on od.OrderID=o.OrderID
--inner join Products pp on pp.ProductID=od.ProductID
--group by s.CompanyName

--hangi Personel hangi �r�n� toplam ka� dolara satm��t�r.

--select e.FirstName+' '+LastName as Sat�c�AdSoyad,p.ProductName as �r�nAd�,
--SUM(od.Quantity*od.UnitPrice*(1-od.Discount))  as Tutar from Employees e
--inner join Orders s on s.EmployeeID=e.EmployeeID
--inner join [Order Details] od on od.OrderID=s.OrderID
--right join Products p on p.ProductID=od.ProductID
--group by ProductName,e.FirstName+' '+LastName

--select s.FirstName+' '+LastName as Sat�c�AdSoyad,p.ProductName as �r�nAd�,
--SUM(od.Quantity*od.UnitPrice*(1-od.Discount))as Tutar from Products p 
--left join [Order Details] od on od.ProductID=p.ProductID
--left join Orders o on o.OrderID=od.OrderID
--left join Employees s on s.EmployeeID=o.EmployeeID
--group by p.ProductName,s.FirstName+' '+LastName

--Having yap�s�----
----Aggregate fonksiyonlar arac�l��� ile al�nan sonu�ara where ko�ulu kullanamay�z
----where ko�ulu yerine having kelimesi ile ko�ul koyabiliriz.


--Toplam sat�� miktar� 1200 �zerinde olan �r�nleri listeleyiniz.
--select p.ProductName, SUM(od.Quantity) as 'Sipari� Miktar�' from [Order Details] od
--inner join Products p on p.ProductID=od.ProductID
-- group by p.ProductName 
--having SUM(od.Quantity)>1200
--order by [Sipari� Miktar�] desc


--Hangi personel hangi �r�n� toplam ka� dolara satm��t�r.
--sat�� tutar� 1000den b�y�k olanlar� listeleyiniz.

--select e.FirstName+' '+LastName as '�al��an �sim',p.ProductName,SUM(od.Quantity*od.UnitPrice*(1-od.Discount))
--as 'Sat��Tutar�' from [Order Details] od
-- inner join Products p on p.ProductID=od.ProductID
-- RIGHT join Orders o on o.OrderID=od.OrderID
-- inner join Employees e on e.EmployeeID=o.EmployeeID
-- group by e.FirstName+' '+LastName,p.ProductName
-- having SUM(od.Quantity*od.UnitPrice*(1-od.Discount))>1000
-- order by Sat��Tutar� desc 


--250den fazla sipari� ta��m�� olan kargo firmalar�n�n adlar�n� telefon numaralar�n� ve sipari� say�lar�n� listeleyiniz.
--select s.CompanyName,s.Phone,COUNT(o.ShipVia) as Sipari�EdilenMiktar from Orders o
--inner join Shippers s on s.ShipperID=o.ShipVia
--group by s.CompanyName,s.Phone
--having COUNT(o.ShipVia)>250
--order by Sipari�EdilenMiktar desc

--*********************************use AdventureWorks2019***************************************************************
--Sipari� tablosundaki m��teri ba��na toplam vade tutar� listeleyiniz.
--select CustomerID,sum(TotalDue) as 'M��teri Ba��na Toplam Vade' from Sales.SalesOrderHeader
--group by CustomerID
--having SUM(TotalDue)>3000 and count(*)=6
--count 6 ya e�it olan 6 kez sipar vermi� olan t�m m��teriler

------------------------------Tablolar� birle�tirme komutlar�----------------------------
--Kolonlar�n ortak olmas� gerekir.
--select CompanyName,Phone,'Tedarik�i',Fax from Suppliers
--union -- tablo birle�tirme
--select CompanyName,Phone,'M��TER�',City from Customers

--Kesi�im k�mesi al�n�r her iki tablodaki ortak de�erleri al�r�z.
--select UnitPrice,ProductID from [Order Details]
--intersect --kesi�im demek 
--select UnitPrice,ProductID from Products  order by UnitPrice 


--Fark K�mesi--�LK TABLODAK� FARK ALINIR EN �STE NE YAZILIYORSA 
--select UnitPrice,ProductID from [Order Details]
--except ----fark k�mesi
--select UnitPrice,ProductID from Products  order by UnitPrice 

--select UnitPrice,ProductID from  Products
--except --fark k�mesi
--select UnitPrice,ProductID from [Order Details]  order by UnitPrice 

--Cross Join her iki tabloyu kartezyen �arparak kay�tlar� listeler 
--�rnek 3 categorin var 5tane �r�n�n var 3*5=den sana 15tane �r�n getiricek 

--select ProductName,CategoryName from Products cross join Categories


---�nsert i�lemi ----
--insert into Shippers (CompanyName,Phone)
--values('deneme','212 555 66 77')
--go
--select * from Shippers

--E�er s�ras�n� bilirtak bu �ekildede eklenebilir
--insert into Shippers values ('deneme','212 555 66 77')


--Herkes kendini bir �al��an olarak  istedi�i kolonlar� kullanarak employee tablosuna eklesin

--insert into Employees values ('G�k�eli','G�rkem','Sales Representative','Dr.','2023-02-06 00:00:00.000','1997-12-06 00:00:00.000','Cumhuriyet no:66','�stanbul','','35333','TR','(212) 222 85 63','','','','2','')
--insert into Employees(FirstName,LastName,Title,TitleOfCourtesy,City,Country)
--values('Gogole','BABA','KRAL','TC','�stanbul','TR')

--update Employees set Title='M�d�r',TitleOfCourtesy='Md.'
--go
--select *from Employees where FirstName='G�rkem'


--�al��anlar tablosunda Nancy adli �al��an�n do�um tarihini 11.03.1980 ve �ehir bilgisini 
--�stanbul olarak de�i�tiriniz.

--update Employees set BirthDate='11.03.1980',City='�stanbul' where FirstName= 'Nancy'
--go 
--select *from Employees 

--B�R UPDATE YAPARKEN BA�INA BEG�N KOYMASSAN ROLLBACK TRAN YAPAMAZSIN 
--begin tran
--update Products set UnitPrice = 50
--select *from Products


--rollback tran

--DELETE YAPISI--
--BEG�N TRAN
--DELETE FROM Shippers where ShipperID>3
--go
--rollblack tran


----View Nesnesi-------------**-*-*-*-*-*-
--Bir sorgu i�erisinde birden fazla i�lem ger�ele�tiriyorsak ve �st�ne �stl�k bu sorguyu defalarca �al��t�rmam�z gerekiyorsa her defas�nda ayn� kodlar� yazmak yerine bu kodlar� tutan sanal tablolar olu�tururuz.

--�rnek Amerikjal� M��terilerden al�nm�� bir sipari�i listeleyen bir sorgu tasarlay�n�z.

--create view Amerikalilar
--as
--Select c.CustomerID,CompanyName,OrderID,OrderDate from Orders o inner join Customers c on c.CustomerID=o.CustomerID  where c.Country='USA'
--go 
--select * from Amerikalilar

--�r�n sat��lar� �r�n�d,�r�n ismi,�r�n price , �r�n stokmiktar� ve �r�n sat�� fiyat� olarak sat�lan �r�nleri listeleyen view olu�turup �al��t�ral�m
--use NORTHWND
--create view UrunSat�slar�
--as
--select p.ProductID,p.ProductName,(od.UnitPrice*(1-Discount)) as Sat��Fiyat� ,p.UnitsInStock as 'Stok Miktar�' from [Order Details] od 
--inner join Products p on p.ProductID=od.ProductID 
--go
--select pro from UrunSat�slar�
 
--Speedy Express ile ta��nm��, nancynin alm�� ald��� oldu�u Pazartesi  g�nleri DUMON ya da ALFKI 'li m��teriler taraf�ndan verilmi� olan sipari�leri  saklayan bir vir view olu�turunuz.

--alter view SpecialTablo
--as
--select s.CompanyName,e.FirstName,c.CustomerID,o.OrderDate ,DATENAME(WEEKDAY,o.OrderDate) as 'G�n'from Orders o
--i	nner join Customers c on c.CustomerID=o.CustomerID
--inner join Shippers s on s.ShipperID=o.ShipVia
--inner join Employees e on e.EmployeeID=o.EmployeeID
--where s.CompanyName='Speedy Express' and (C.CustomerID='DUMON' or C.CustomerID='ALFKI') AND DATENAME(WEEKDAY,o.OrderDate)='Monday' and e.FirstName='Nancy'
--go
--select* from SpecialTablo

--Hangi �r�n hangi m��teri hangi personelden ald���n� listelyen view yazal�m 
--view in ismi DetaliSatisraporu

--create view DetayliSatisRaporu
--as
--select e.FirstName+' '+e.LastName  as Pazarlayan,o.CustomerID,p.ProductName from Orders o
--inner join [Order Details] od on od.OrderID=o.OrderID
--inner join Products p on p.ProductID=od.ProductID
--inner join Employees e on e.EmployeeID=o.EmployeeID
--go
--select *from DetayliSatisRaporu

--View �zerinden insert i�lemi-------------------

--create view Kategorislemler
--as
--select * from Categories

--insert into Kategorislemler(CategoryName,[Description])
--values ('S�tl� Tatl�lar','S�t iyidir Ca+ dan dolay�  kemi�e iyi gelir')
--go
--select*from Kategorislemler

--Bu �rnekte ekleme yap�lam�yor  join oldu�u i�in
--create view KategoriUrunleri
--as
--select ProductName,CategoryName from Categories inner join Products on Products.CategoryID=Categories.CategoryID

--insert into KategoriUrunleri(ProductName,CategoryName)
--values('S�tl� Nuriye','S�tl� Tatl�lar')


--Viewda Order by kullan�m� 'top()'  kullanmak zorunday�z.
--create view FiyataGoreUrunler
--as 
--select top 77 ProductName,UnitPrice from Products order by UnitPrice desc 
--go 
--select * from FiyataGoreUrunler


--Witch check option 
--view �zerinde insert i�lemi ger�ekle�tirirken e�er view niz �zerinde bir where kriteri tan�ml�ysa
--insert edilirken g�nderilen de�erin  de bu kritere uygun olmas�n� sa�layabiliriz.

--create view  FilebaslayanKargolar
--as
--select * from Shippers where CompanyName like 'F%' with check option
--go
--select * from FilebaslayanKargolar

----Yukarda companynamede like F ile ko�ul atad���m�z i�in bir insert i�leminde companyname eklerken F ile ba�layan bir ba�l�k ekleyebilirim.
--insert into FilebaslayanKargolar(CompanyName)
--values ('Fly Kargo')
--go
--select * from FilebaslayanKargolar

--with schemabinding 
--view �n ba�l� oldu�u tablolardaki kolonlar� kitler ve o tablolar�n kolonlar�n�n silinmesine engel olur

--create view TumKargolar
--with schemabinding 
--as
--select CompanyName from dbo.Shippers


----De�i�tirmeye �al���yoruz �imdi
--alter table Shippers drop column Phone 
 -------------------------------------------Views 
 --create view KategoriyeGoreUrunler
 --with schemabinding,encryption
 --as
 --select CategoryName,ProductName,UnitsInStock,UnitPrice,(UnitPrice*1.18) as 'KDV L� F�YAT' from dbo.Categories
 --inner join dbo.Products on Products.CategoryID=Categories.CategoryID
 --inner join  dbo.Suppliers on Suppliers.SupplierID=Products.SupplierID
 --where CategoryName='Beverages' and Country='USA' and UnitsInStock > 0

 ---Storeced Procedure----
 --select,insert,update,delete gibi komutlar� �al��t�rabilen metotlard�r.
 --�ok h�zl� ve g�venlidirler.
 --h�zl� olmalar�n�n nedeni server taraf�ndan �al���r.
 --G�venli olmalar�n�n nedeni parametlerle d��ar�dan bilgi al�rlar.
 --Client ta �al��mad�klar�nda client pclerin donan�msal olarak bir anlam� kalmaz.

 --create proc KargoEkleyici
 --(
 --@ad nvarchar(20),
 --@tel nvarchar (20)
 --)
 --as insert into Shippers(CompanyName,Phone)
 --values (@ad,@tel)

 --KargoEkleyici 'abc kargo','212 344 45 67'
 --go
 --select * from Shippers

 --D��ar�dan de�er kadar �r�nlerin fiyatlar�na zam yapan prosed�r tasarlay�n�z.

--create proc ZamYap1
--(
--@ZamYap int
--)
--as
--update Products
--set UnitPrice+=@ZamYap


--ZamYap1 10
--select* from Products


--D��ar�dan girilen kategori ad�na g�re o kategoriye ait olan �r�nleri listeleyen bir prodesur.

--create Proc Getir
--(
--@aranacakkategori nvarchar(20)
--)
--as
--select p.ProductName,c.CategoryName from Products p inner join Categories c on c.CategoryID=p.CategoryID
--where CategoryName=@aranacakkategori

--exec Getir 'Meat/Poultry'

--D��ar�dan girilen kargo firmas� taraf�ndan ta��nm�� ve yine d��ar�ndan girilen kargo �demesi de�er aral���ndaki sipari�leri listelyen bir prosedur yaz�n�z

--alter Proc Kargo
--(
--@Deger1 float,
--@Deger2 float,
--@Kargo nvarchar (30)
--)
--as
--select s.CompanyName,o.CustomerID,o.EmployeeID,o.Freight from Orders o inner join Shippers s on s.ShipperID=o.ShipVia
--where s.CompanyName=@Kargo and o.Freight between @Deger1 and @Deger2 order by o.Freight desc

--exec Kargo '1','60','Speedy Express' 


--D��ar�dan girilen karakter dizisini i�erisinde bar�ndan 'm��teri ad�na' sahip m��terilerce verilmi� sipari�leri listeleyen
--prodused�r tasarlay�n�z (M�steriSipari�leri)

--alter Proc M�steriSipari�leri
--(
--@karakter char
--)
--as
--select o.OrderID,o.OrderDate,s.CustomerID,s.CompanyName from Orders o inner join Customers s on s.CustomerID=o.CustomerID
--where s.CustomerID like '%'+@karakter+'%' 

-- M�steriSipari�leri 'et'

--Stok miktar� min-max d��ar�dan girilen 2 de�er aras�nda olan �r�n �creti d��ardan girilen 2 de�er aras�nda olan  toptanc� firma ad� d��ar�dan girilen  ve belirli harfleri bar�nd�ran �r�nlerin adlar�n� fiyatlar�n� toptanc� �irket adlar�n� ve fiyatlar�n�n kdv eklenmi� hallerini g�steren bir procedur tasarlay�n�z.

--alter proc ProductsDetails
--(
--@Deger1 int,
--@Deger2 int,
--@Urun1 int,
--@Urun2 int,
--@Toptanc�Ad nvarchar(45)

--)
--as
--select s.SupplierID, p.UnitsInStock,s.CompanyName,p.ProductName,p.UnitPrice*1.8 as 'Kdv Eklenmi� Hali' from  Products p
--inner join Suppliers s on s.SupplierID=p.SupplierID
--where s.CompanyName like @Toptanc�Ad and
--p.UnitsInStock between  @Deger1 and @Deger2 and
--p.UnitPrice between @Urun1 and @Urun2

--ProductsDetails '10','50','20','100','%lt%'
--select*from Suppliers

--alter proc urundetaygetir
--(
--@stokmiktar1 int,
--@stokmiktar2 int,
--@ucret1 float,
--@ucret2 float,
--@firmaAdi nvarchar(30),
--@urunad nvarchar(5)
--)
--as

--select p.ProductName, s.CompanyName, p.UnitsInStock, p.UnitPrice*1.18 as 'KDV Eklenmi� Hali' from Products p inner join Suppliers s on s.SupplierID = p.SupplierID
--where p.UnitsInStock between @stokmiktar1 and @stokmiktar2
--and p.UnitPrice between @ucret1 and @ucret2
--and s.CompanyName = @firmaAdi
--and p.ProductName like '%'+@urunad+'%'

--exec urundetaygetir '10','50','1000','5000','Exotic Liquids','a'


--D��ar�dan girilen �al��anID'si taraf�ndan al�nm��  sipari�leri listeleyin.Ancak d��ar�dan ka� adet �al��an ID geldi�i bilinmememkted�r.

--alter proc EmployeeIDandOrders
--(
--   @EmployeeIDs nvarchar(max)
--)
--as
--declare @sorgu nvarchar (max)
--set @sorgu=('select OrderID,OrderDate,EmployeeID from Orders where EmployeeID in ('+ @EmployeeIDs+') order by EmployeeID')
--execute(@sorgu)

--EmployeeIDandOrders '1,5,7'
--EmployeeIDandOrders '1,5,7,8'
--EmployeeIDandOrders '1,3'



--Hangi Kargo firmas�n�n sipari�leri gelsin

--create proc ShipperOrder

--(
--@shippers nvarchar(max)
--)
--as
--declare @sorgu nvarchar(max)
--set @sorgu=('select * from Orders where ShipVia in ('+@shippers+')' )

--execute(@sorgu)

--ShipperOrder '1,2,3'

-------------------------------------------*TSQL �F KOMUTU*-------------------------------
--declare @sayi int 
--select @sayi=COUNT(*) from Products
--if @sayi > 150
--begin
--print 'Fazla �r�n var ' 
--end
--else
--begin
--print 'Az �r�n var'
--end
-------------------------------------------------------------------------------------------------------
--use NORTHWND
--GO
--select * from sys.tables -- nortwindteki tablolar sys i�erisinde tutulur g�rmek i�in <<<







--if exists (select * from sys.tables where Name='Customers')
--begin
--print 'M��teri tablosu bu veritaban�nda mevcut'
--end 
--else 
--begin 
--print 'M��teri tablosu bu veritaban�nda mevcut de�il'
--end


---------------------------------------------------------------------------------------------
--declare @sayac int=1;
--while @sayac<11
--begin 
--print @sayac
--set @sayac+=1
--end

---------------------------------------------------------------------
-- B�R �� YER�NE G�TT�N VE TABLOLARI B�LM�YORSAN TSQL KULLANARAK KONTROL EDEB�L�RS�N
--declare @sayi int
--declare @sayac int 
--declare @urunad nvarchar(max)
--set @urunad=''
--set @sayac=0
--select @sayi=COUNT(*)from Products
--while(@sayac<@sayi) 
--begin 
--	if(@sayac%2=0)
--	begin
--	select @urunad='�r�n Kodu: '+CAST(ProductID as nvarchar(max))+' �r�n Ad�: '+ProductName+'�r�n Miktar�: '+cast( UnitsInStock as nvarchar(max))  from Products 
--	where ProductID=@sayac
--	print @urunad
--	end
--set @sayac+=1
--end

--------------------------------------------------------------------
--Drop Table IF EXISTS ornektablo
--create table ornektablo(id int,ulkeadi nvarchar(20),durumu int)
--go 
--insert into ornektablo (id,ulkeadi,durumu)
--values (1,'Almanya',0),
--	   	  (2,'Fransa',0),
--			(3,'�talya',0),
--			  (4,'Hollanda',0),
--				(5,'Polonya',0)
--go
--select * from ornektablo


--declare @counter int,@maxid int ,@countryName nvarchar(100)
--select @counter=min(id),@maxid=max(id) from ornektablo

--while (@counter is not null and @counter<=@maxid)
--begin
-- select @countryName=ulkeadi from ornektablo where id=@counter
--print convert (varchar,@counter)+'. �lke si '+ @countryName
--set @counter+=1
--end
--------------------------------------------------------------------------
--KATEGOR� EKLEME 
--create proc KategoriEkleyici
--(
-- @ad nvarchar(20),
-- @sonID int output
-- --e�er procedure i�erisindeki bir de�eri d��ar�ya ��karmak isterseniz >>>output<<< anahtar kelimesini kullan�r�z.
-- )
-- as
-- insert into Categories (CategoryName) values (@ad)
--set @sonID = SCOPE_IDENTITY()
---- SCOPE_IDENTITY() METODU SON KAYDIN �D S�N� B�ZE GET�R�R 
--alter proc UrunEkleyici
--(
--@urunadi nvarchar(40),
--@katAdi nvarchar(25)
--)
--as
--declare @katID int 
--if not exists (Select CategoryName from Categories where CategoryName = @katAdi)
--begin
--exec KategoriEkleyici @katAdi,@katID output
--end
--else
--begin
--select @katID =CategoryID from Categories where  CategoryName=@katadi
--end
--insert into Products(ProductName,CategoryID) values (@urunadi,@katID)
--select*from Products

----olmayan kategori i�in test
--select  * from Categories

--exec UrunEkleyici 'F�r�nda S�tla�', 'S�tl� Tatl�lar'

--exec UrunEkleyici 'baklava','�erbetli tatl�lar'

--------------------------------------------------------------------------------------
-------------------***********************FONKS�YONLAR**********---------------------------------------
--create function toplamyap
--(
--@sayi_bir int,
--@sayi_iki int
--)
--returns int 
--as begin
--return @sayi_bir+@sayi_iki
--end

--select dbo.toplamyap(10,20) as 'Toplama'

--------------------------------------------------------------------------
-- Girilen 3 say�n�n ortalamas�n� geri d�nd�ren bir fonksiyon yaz�n�z.
--create function sayiort
--(
--@sayibir int,
--@sayiiki int,
--@sayi�� int
--)
--returns int 
--as 
--begin
--declare @ortalama int
--set @ortalama = (@sayibir+@sayiiki+@sayi��)/3
--return @ortalama
--end

--select dbo.sayiort(2,2,3) as ortalama

-------------------------------------------------------
--SQL DE TAM SAYI VER� T�PLER� 
--tinyint -1byte
--smallint - 2byte
--int - 4 byte
--bigint -8byte

--sqlde ondal�k say� veri tipleri
-- float , real 4byte
--money 8byte
--smallmoney 4byte

--sqlde booolean veri tipleri
--bit 1byte

-----------------------------------

--create function mailolusturucu
--(
--@ad nvarchar(50),
--@soyad nvarchar(50)
--)
--returns char(19)
--as
--begin
--declare @birle�tirici char(19)
--set @birle�tirici=LOWER(left(@ad,3)+'.'+RIGHT(@soyad,3))+'@hotmail.com'
--return @birle�tirici
--end

--select dbo.mailolusturucu('G�rkem','Beyazkaya')

--select FirstName,LastName,dbo.mailolusturucu(FirstName,LastName) from Employees

----Ya� Hesaplay�c� fonksiyonu yaz�n�z
--create function yashesaplay�c�
--(
--@dogumtarihi date
--)
--returns int
--as
--begin
--declare @yasgetirici int
--set @yasgetirici=DATEDIFF(year,@dogumtarihi,GETDATE())
--return @yasgetirici
--end

--select dbo.yashesaplay�c� ('06.12.1997')
--select FirstName,LastName,dbo.yashesaplay�c�(BirthDate)  from Employees

--ev  �devi 
--fiyat adet indirim verildi�inde kdv dahil fiyat� veren fonksiyonu yaz�n�z.
--Drop Table IF EXISTS girdi
--alter function girdi
--(
--@fiyat float,
--@indirim float,
--@adet int

--)
--returns float
--as
--begin
--declare @toplam float
--set @toplam=(@fiyat+@adet)*(1-@indirim)*1.18
--return @toplam
--end

--select dbo.girdi(100.0,2.0,1)




--Table Fonksiyonlar�

--create function SiparisBilgisi 
--(
--@ad nvarchar(20)
--)
--returns table 
--as
--return select o.OrderID,o.OrderDate,e.FirstName+' '+e.LastName as 'AD' from Orders o inner join Employees e on e.EmployeeID=o.EmployeeID where 
--e.FirstName=@ad

--select OrderDate,ad from dbo.SiparisBilgisi('Janet')



--D��ardan girilen kargo firmas�n�n ta��m�� oldu�u sipari�leri listeleyen fonksiyon yaz�n�z


--alter function Kargocu
--(
--@kargoad nvarchar(45)

--)
--returns table 
--as
--return select * from Orders o inner join Shippers s on s.ShipperID=o.ShipVia where s.CompanyName =@kargoad


--select *from dbo.Kargocu ('Speedy Express')  
--select*from Shippers

---****-*-*-*-*T�GERLAR-*-*-*-*-*--**-*
--Tetikleyiciler kullan�c� taraf�ndan elle ger�ekle�tirilemeyen ya da ger�ekle�tirilmesi zaman alan i�lemlerin bir tak�m olaylardan once yada sonra sistem taraf�ndan otomatikman ger�ekle�mesinini sa�layan yap�lard�r.


--2ye ayr�l�r 
--1-DML TR�GGER (SELECT,�NSERT,UPDATE,DELETE G�B� YAPILARDAN �NCE YADA SONRA �ALI�ANLAR )
--2-DDL Trigger (Create,alter,Drop G�B� YAPILARDAN �NCE YADA SONRA �ALI�ANLAR)


--create trigger Tetikci
--on Shippers
--after insert 
--as
--select*from Shippers

--insert into Shippers values('yasar kargo','21223334565')

--diyelim ki ben bu triger� pasif hale getirmek istiyorum . 

--disable trigger Tetikci on Shippers
-- aktif etmek i�inde 
-- enable trigger Tetikci on Shippers
--drop tigger Tetikci

--Kategori tablosuna bir g�ncelleme ger�ekle�tirilden sonra ekrana ''g�ncelleme ba�ar�yla oldu '' mesaj�n� yazd�ran triggeri tasarlayan�z.

--alter trigger Updatee
--on Categories
--after Update
--as
--print 'g�ncelleme ba�ar�yla ger�ekle�tirildi'



--UPDATE Categories
--SET CategoryName = 'Halka Tatl�s�'
--WHERE CategoryID = 9;



--Kategori tablosuna  kay�t eklendikten sonra son kayd�n detaylar�n� g�steren
--trigger tasarlay�n�z

--create trigger tetikci1
--on Categories
--after insert 
--as 
--declare @sonID int 
----�nsert tablosunu tigerin ba�l� bulundu�� tablloya yap�lan son kayd� �zerine alan tablodur.
--select @sonID =CategoryID from inserted
--select*from Categories where CategoryID=@sonID

--insert into Categories(CategoryName,Description)
--values ('Tuzlular','Enfestirler')

--create database YEDEKDB
--go
--use YEDEKDB

--CREATE TABLE Yedek_Kargolar
--(
--KargoID int primary key identity(1,1) not null,
--KargoAdi nvarchar (50)null,
--KargoTel nvarchar (50)null
--)

--create trigger Yedekci
--on Shippers after delete
--as
--declare @silinenad nvarchar(50)
--declare @silinentel nvarchar(50)
--select @silinenad=CompanyName,@silinentel=Phone from deleted
--insert into YEDEKDB.dbo.Yedek_Kargolar(KargoAdi,KargoTel)
--values (@silinenad,@silinentel)


--use YEDEKDB
--go
--select * from YEDEKDB.dbo.Yedek_Kargolar

--use NORTHWND
--go
--delete from Shippers where ShipperID=5


--TR�GGER MODLARI
--1-After bir tabloya yap�lan i�lemlerden hemen sonra �al��an trigger yap�lar�d�r.
--2-Insteaf of bir taloya yap�lmas� istenen i�lemden hemen �nce tetiklenen yap�lard�r.

--create trigger silmeEngeli
--on categories 
--instead of delete 
--as
--declare @silinenkayitsayisi int 
--select @silinenkayitsayisi=count(CategoryID) from deleted where  CategoryID=9
--if @silinenkayitsayisi>0
--begin
--print 'silinemez veri hatas�'
--rollback tran
--end
--else
--begin
--declare @silinecekID int 
--select @silinecekID = CategoryID from deleted
--delete from Categories where CategoryID=@silinecekID
--end

--delete from Categories where CategoryID=9
--delete from Categories where CategoryID=11

-- G�R�N�RDE S�L�NM�� G�B� G�STEREB�L�YORUZ .
--select * from Products

--create trigger trgsil on products
--instead of delete
--as 
--update Products
--set Discontinued = 1 where ProductID in ( select ProductID from deleted)

--begin tran
--delete from Products where  ProductID=1
--rollback tran



--DDL TR�GGER 
--Genellikle create,alter,drop gibi i�lemlerden sonra �al��an tetik�ilerdir.

--instead of kelimesi yerine  for kelimesi kullan�l�r.

--tabloya d�zenlemesini engelleyelim ard�ndan  tablo eklemek i�in  trigger droplamak gerek.
--create trigger TabloduzenlemeEngeli
--on database 
--for ALTER_TABLE
--as
--raiserror('Tablo D�zenleme Engeli',16,1)
--rollback--d�zenleme i�lemi geri al�n�r.

--alter table Shippers
--add Kargofax nvarchar(50) null

--select * from Shippers

--drop trigger TabloduzenlemeEngeli on database


--Server �zerinde veritab�n� olu�turmay� engelleyen bir trigger tasarlay�n�z.

--create trigger DatabaseBlock
--on ALL SERVER 
--for CREATE_DATABASE
--as
--raiserror('Database Olu�turma Engeli',16,1)
--rollback 

--create database olu�tur
--drop trigger DatabaseBlock on all server





--*********************************TRANSACT�ON***************
--Veritaban� �zerinde birbiriyle ba��ml� olarak ger�ekle�en i�lemleriniz varsa ve bu i�lemlerin tamam�n� bir b�t�n olarak
-- kabul g�r�l�p herhangi bir noktada bir ar�za meydana geldi�inde bu tek v�cut halindeki i�lemlerin iptal edilmesini isterseniz bu i�lemleri bir tansaction blo�u i�inde ger�ekle�tirmelisiniz.

--create database batanbank
--go
--use batanbank 
--go
--create table Musteriler 
--(	
--	MusteriID int primary key identity(1,1) not null,
--	MusteriAdi nvarchar(150) not null,
--	Bakiyesi money not null
--)
--go
--insert into Musteriler(MusteriAdi,Bakiyesi) 
--values ('Gorkem',1100000)
--go
--insert into Musteriler(MusteriAdi,Bakiyesi) 
--values ('��kr�',10000)

--select * from Musteriler

--begin try
--update Musteriler set Bakiyesi-=1000 where MusteriID=1
--select 10/0
--update Musteriler set Bakiyesi+=1000 where MusteriID=2
--end try
--begin catch 
--raiserror('Hata var ',16,1)
--end catch 

--Transaction kullanarak yapal�m
--begin try
--begin transaction
--update Musteriler set Bakiyesi-=1000 where MusteriID=1
--select 10/0
--update Musteriler set Bakiyesi+=1000 where MusteriID=2
--commit transaction
--end try
--begin catch 
--raiserror('Hata var ',16,1)
--rollback transaction
--end catch 

