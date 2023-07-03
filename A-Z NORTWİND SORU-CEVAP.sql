--use NORTHWND
--select*from Shippers
--select CompanyName from Shippers
--select *from Emplloyees

--select FirstName+''+LastName as [Ad Soyad], datediff(year,BirthDate,getdate()) as Yaþ from Employees 

--ürün tablosundaki ürünleri isimleri,fiyatlarý ve kdv dahil fiyatlarý þeklinde listeleyiniz.
--select productName as 'Ürün Adý', UnitPrice as 'Fiyat',(UnitPrice*1.8) as 'KDV FÝYAT' from Products

--ÇALIÞAN TABLOSUNDAKÝ LONDRADA YAÞANLARI GETÝRME
--select *from Employees where City='London'
--select *from Employees where City like 'L%'--%L% --%L

--Mart ayýnda alýnmýþ olan sipariþlerin ORDERID,ORDerDATE kolonlarý olacak þekilde listeleyiniz.
--select *from Orders where Month(OrderDate)=3 --Mart ayýndaki sipariþleri getirdik.
--select OrderID,OrderDate from Orders where DATENAME (month,OrderDate)='March'

--KategoriÝD si  5 olmayan ürünlerin adlarýný ve CategoryIDlerini listeleyen sorgu yazýnýz. 

--select CategoryID,ProductName from Products where CategoryID !=5 -- <> þeklindede eþit olmadýðýný ifade edebiliriz

--1993 tarihinden sonra iþe girmiþ personelin adýný ve soyadýný yazýnýz ve iþe giriþ tarihini listeleyiniz

--select LastName,FirstName,HireDate from Employees where HireDate>='1993' 

--Mantýksal operatörler AND VE OR

--Ürün stok miktarý 20-50 arasýndaki ürünleri listeleyim
--select ProductName, UnitsInStock from Products where UnitsInStock>=20 and UnitsInStock<=50
--Yaþý 50den büyük Ýngilterede oturmayan çalýþanlarýn  adlarýný ve yaþlarýný listeleyiniz.
--Ýsimler þu formatta olmalýdýr A.Fuller
--select LEFT(FirstName,1)+'.' as FirstName ,LastName,Country, datediff(year,BirthDate,getdate()) as BirthDate from Employees   where Country<>'UK' and datediff(year,BirthDate,getdate())>50  
--1997 dahil yýlýndan sonra alýnmýþ kargo ücreti(Freight) 20 den büyük ve Fransaya gönderilmemiþ (ShipCountry) 
--sipariþlerin OrderID,sipariþ tarihleri ve teslimtarihleri(shippedDate) ve kargo ücretlerini listeleyiniz.
--select*from  Orders
--select OrderID,OrderDate,ShippedDate,Freight,ShipCountry from Orders where OrderDate>='1997' and Freight>'20' and ShipCountry!='France' 

--null ifadeleri
--Müþteriye henüz ulaþmamýþ sipariþleri listeyelim.

--select OrderID,OrderDate,ShippedDate from Orders where ShippedDate is null
--Müþteriye henüz ulaþmýþ sipariþleri listeyelim.
--select OrderID,OrderDate,ShippedDate from Orders where ShippedDate is not null

--Kimseye Rapor vermeyen personelin Adý Soyadý ve Ünvaný sutunlarýný getirerek listeleyelim.
--select LastName,FirstName,TitleOfCourtesy from Employees where ReportsTo is null

--Kategori Id si =5 olan ürün bedeli 20< büyük  100> den küçük olan ve stok null olmayan ürünleri listeleyiniz
--SELECT CategoryID,UnitPrice,UnitsInStock from Products where CategoryID=5 and UnitPrice>20 and UnitPrice<100  and UnitsInStock is  not null


--DUMON YADA ALFKI OLAN CUSTOMER ÝDLERÝNE SAHÝP müþteriler tarafýndan 1 nolu personelin onayladýðý 3 nolu kargo firmasý tarafýndan taþýnmýþ Shipregion ý null olan 
--sipariþleri listeleyiniz.
--select *from Orders where (CustomerID='DUMON' or CustomerID='ALFKI') and EmployeeID=1 and ShipVia='3' and ShipRegion is null


--Sipariþ tablosunda 3,5,7,12 product idlerini içermeyen kayýtlarý listeleyiniz.
--select* from [Order Details] where ProductID not in (3,5,7,12)
--Üçüncü karakteri a,b,c den bir tanesi olan ürünleri listeleyiniz
--select*from Products where ProductName   like  '__[abc]%'
--select*from Products where ProductName not  like  '__[abc]%'
--Sýralama komutu Order by desc (büyükten küçüðe ) asc(küçükten büyüðe) 

--Personellerimizi A-Z ye sýralayalým
--select EmployeeID,FirstName+'' +LastName as'adsoyad' from Employees order by AdSoyad asc
--select EmployeeID,FirstName+'' +LastName as'adsoyad' from Employees order by AdSoyad desc

--ülkesi fransa olan müþterileri þirker adlarýna göre sýralý bir þekilde listeleyiniz.
--select*from Customers where Country='France' order by CompanyName  asc

--Stok miktarý 50den büyük olan fiyatlarýna göre ürünleri listeleyin
--select *from Products where UnitsInStock>'50'order by UnitPrice asc

--Ürünler tablosunda tüm ürünler fiyatýna göre a dan z ye sýralý ürün fiyatý ayný olanlar stok miktarýna göre z den a
--sýralý þekilde listeleyiniz.

--select *from Products  order by UnitPrice asc ,UnitsInStock desc

--select distinct Country from Employees
--Birden fazla ayný isimli kayýtlarý tek bir kayýt olarak göstermek için distinct komutu kullanýrýz.
--Sipariþ detayda satýlan ürünleri idlerine göre listeleyiniz.

--select distinct ProductID,UnitPrice from [Order Details] order by ProductID 

--select top(10)*from Products
--fiyatý 50 den büyük olan ürünlerden satýþ adedi en fazla 10 ürünü listeleyiniz.
--select top(10)*from [Order Details] where UnitPrice>'50'order by Quantity desc
--select top(10) with ties *from [Order Details] where UnitPrice>'50'order by Quantity desc

--between-and kalýbý 
--stok miktarý 20den büyük 49dan küçük ürünleri listeliyiniz.
--select *from products Products where UnitsInStock between 20 and 40 order by UnitsInStock

--baþ harfi c olan stoklarda mevcut 10 ile 250  dolar arasý ücreti olan ürünleri fiyatlarýna göre listeleyiniz.

--select *from Products  where ProductName like 'C%' and UnitPrice between '10' and '250' and
--UnitsInStock>0 order by UnitPrice 

--Çarþamba günü alýnan kargo ücreti 20-75 arasýnda olan teslim tarihi olmayan sipariþlerin bilgilerini raporlayýnýz.
--OrderID sine göre büyükten küçüðe doðru sýralayýnýz.
--use NORTHWND
--select*from Orders  where Freight between '20' and '75' and ShippedDate is null and  dateName (weekday, OrderDate)='Wednesday' order by OrderID desc

--Arama Ýþlemleri (LIKE)
--select CompanyName from Customers where CompanyName like 'A%'
--select CompanyName from Customers where CompanyName like '%A'
--select CompanyName from Customers where CompanyName like '%ltd%'
--select CompanyName from Customers where CompanyName like '__mon%'
--select CompanyName from Customers where CompanyName like '[AS]%' 
--select CompanyName from Customers where CompanyName like '[A-D]%' ÝLK HARFÝ A OLUP D HARFÝ ARASINDA OLANLAR
--select CompanyName from Customers where CompanyName like 'A[^N]%' ÝLK HARFÝ A OLUP N OLMAYANLAR

--Ülkesi ingiltere olmayan adi a ile baþlayýp soyadý r ile biten doðum tarihi 1985 ten önce olan  çalýþanlarýn listeleyiniz.
--select FirstName,LastName,BirthDate,Country from Employees where LastName like '%r' and FirstName like 'A%' and Country!='UK' and DATENAME(year,BirthDate)<'1985'  

--Japoncaya akýcý konuþan personel kimdir? japanese
--select  * from Employees where Notes like '%japanese%'

--Aggreate Fonksiyonlar

--Sql tanýmlanmýþ hesaplama fonksiyonlarý (count,max,min,sum,avg)
--Stokta bulunan kaç tane ürünümüz vardýr?
--select count(ProductID) from Products where UnitsInStock>0


--1996 yýlýndan sonra alýnmýþ kaç adet sipariþ vardýr?
--select count(OrderID) from Orders where datename(year,OrderDate)>'1996'


--Kaç Ülkeden müþterimiz bulunmaktadýr.
--select count(DISTINCT Country) as ÜlkeSayýsý from Customers


--Stoktaki bulunan tüm ürünlerin toplam fiyatý nekadardýr.
--select Sum(UnitPrice) from Products where UnitsInStock>0



--1997 yýlýnda alýnmýþ sipariþler için toplam ne kadarlýk Kargo ödemesi yapýlmýþtýr
--select  sum(Freight) from Orders where datename(year,OrderDate)='1997'

--Tüm yýllardaki alýnmýþ olan sipariþleri için ortalama nekadarlýk kargo ödemesi yapýlmýþtýr.
--select sum(Freight)/count(OrderID) from Orders 

--Þuana kadar toplam Ciromuz ne kadardýr? indirim hesaba katýlacak
--select sum(UnitPrice*Quantity*(1-Discount)) from [Order Details]

--Bu zamana dek ödenmiþ ortalama kargo ücreti nedir?(avg)
--select avg(Freight) from Orders

--Ülke baþýna ortalama ne kadar kargo ücreti ödenmiþtir?
--select   sum(Freight)/ count (distinct ShipCountry) from Orders  

--select max(UnitPrice) from Products
--select min(UnitPrice) from Products

--Müþteri Idleri ilk harfi A-K arasýnda olanlarýn vermiþ olduklarý  sipariþ tarihi 01.01.1997 ile 06.06.1997 arasýnda olan sipariþlere en az ne kadar 
--kargo ücreti ödenmiþtir.
--select  min(Freight) from Orders WHERE CustomerID like '[A-K]%' and OrderDate between '01.01.1997' and '06.06.1997' 

--Maksimum satýþ tutarýmýz ne kadardýr?
--select  max(UnitPrice*Quantity) from [Order Details] 

--En düþük satýþ tutarýmýz ne kadardýr?
--select  min(UnitPrice*Quantity) from [Order Details] 

--2,4,5,7 nolu çalýþanlarýn almýþ olduklarý sipariþleri listeleyiniz
--select *from Employees WHERE EmployeeID in (2,4,5,7)

--1 yada 2 nolu kargo firmasý ile taþýmýþ 1996 yýlýnda perþembe günü alýnmýþ sipariþler için ödenen en yüksek kargo bedeli
--select  max(Freight) as [1 ya da 2 nolu Kargo Firma]from Orders where
--ShipVia in (1,2) and datename(weekday,OrderDate)='Wednesday' and year(OrderDate)

--'CACTU','DUMON' YADA 'PERIC' idli müþteriler tarafýndan istenmiþ ,2 nolu kargo firmasýyla taþýnmamýþ
--kargo ücreti 20-200 dolar arasý olan sipariþlere toplan ne kadarlýk kargo ücreti yapýlmýþtýr?

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

--Ürün tablosunda stok miktarý 50den küçükler ekran kritik sok 
--stok miktarý 50 ve 75 olanlar ekranda normal stok
--sok miktarý 75den büyük olanlar ekranda stok fazlasý gözükecek þekiilde stok durumu
--kolonu ekleyerek listelemenizi istiyoruz.
--select ProductName,UnitsInStock,[StokDurum]=case 

--when UnitsInStock<50 then 'Kritik Stok'
--when UnitsInStock between 50 and 75 then 'Normal Stok'
--when UnitsInStock>75 then 'Stok Fazlasý'

--end,UnitPrice,ÜrünFiyatý=case
--when UnitPrice<50 then 'AzPahalý'
--when UnitPrice between 50 and 75 then 'Normal Fiyat'
--when UnitPrice>75 then 'Pahalý'
--end
--from Products order by UnitsInStock desc

-----------------Group By yapýsý-------------------------------------

--Normal gruplamanýn dýþýnda Aggreate fonksiyonlarýnda sutunlarýnýda sorguya dahil etmek için kullanýrýz.
--select Country,Count(Country) from Employees group by Country
--select CategoryID,COUNT(ProductID)  as [Kategoriye göre Urun Sayýsý] from Products group by CategoryID
--order by [Kategoriye göre Urun Sayýsý] desc

--Her bir kategoride ücret bazýnda toplam nekadarlýk ürünüm var.

--select CategoryID,sum(UnitsInStock*UnitPrice)   from Products group by CategoryID

----hangi personel kaç satýþ yapmýþtýr?
--select EmployeeID, count(*)as Yapýlansatýþ from Orders group by EmployeeID


----hangi müþteri kaç kere alýþveriþ yapmýþtýr?
--select CustomerID,COUNT(*)as [Kaç Kere Alýþveriþ yapmýþ] from Orders group by CustomerID

--Hangi tedarikçi hangi kategorideki üründen toplam tutar bulunmaktadýr.
--select SupplierID,CategoryID,sum(UnitPrice*UnitsInStock) from Products group by SupplierID,CategoryID order by SupplierID


------------------Alt Sorgular(SubQuery)--------
--Ýçiçe sorgulardýr.Inner join yetersiz kaldýðýnda  having iþlemi yetersiz kaldýðýnda kullanýlýr.

--Ortalama ücretin üzerinde yer alan ürünleri gösteriniz.
--select ProductName,UnitPrice,(select avg(UnitPrice) from Products ) as 'ORTALAMAFÝYAT' from Products where UnitPrice> (select avg(UnitPrice) from Products ) 

--Nancy nin almýþ olduðu sipariþlerin Idlerini listeleyiniz.

--select OrderID  from Orders  where     EmployeeID=(select EmployeeID from Employees where FirstName='Nancy') 

--Beverages kategorisine ait ürünleri listeleyiniz.
--select ProductName,CategoryID from Products where CategoryID=(select CategoryID from Categories where CategoryName='Beverages')
--select ProductName,(select CategoryName from Categories where CategoryID=p.CategoryID) from Products p where p.CategoryID=(select CategoryID from Categories where CategoryName='Beverages')

--Nancy,Andrew yada Janet tarafýndan alýnmýþ ve speedy express ile taþýnmýþ sipariþleri listeleyiniz.
--select OrderID,EmployeeID,ShipVia from orders Orders where
--EmployeeID in(select EmployeeID from Employees where FirstName in ('Nancy', 'Andrew', 'Janet'))
--and ShipVia in (select ShipperID from Shippers where CompanyName !='Speedy Express') 

--ürünler tablosundaki ürünleri ürünleri getiren tedarikçilerle beraber listeleyiniz.
--select ProductName,(select CompanyName from Suppliers s where  s.SupplierID= p.SupplierID)  from Products p 

--Ürünlerle birlikte ürünün satýþ adedini listeleyen sorguyu yazýnýz
--select ProductName,(select sum(Quantity) from [Order Details] where ProductID=p.ProductID) from Products p

--hangi satýþta kaç adet ürün satýlmýþtýr.
--select  OrderID, (select sum(Quantity) from [Order Details] od where od.OrderID=o.OrderID) from Orders o


--VINET ýd li müþterinin sipariþlerin ürünlerini detaylý listeleyiniz. 
--select * from Orders where CustomerID='VINET'
 --select*from [Order Details] where OrderID in (select OrderID from Orders where CustomerID='VINET')


--3 numaralý ürünün satýþýnýn yapýldýðý müþteri ID lerini listeleyiniz.
--select CustomerID from orders where OrderID in (select OrderID from [Order Details] where ProductID=3 )
--select  (select CustomerID from Orders a where a.OrderID=o.OrderID) from [Order Details] o where ProductID=3

--2 numaralý nakliyecinin taþýdýðý 4 numaralý persnelin satýþ yaptýðý müþterilin bilgilerini listeleyiniz.
--select*from Customers where CustomerID in (select CustomerID from Orders where EmployeeID=4 and ShipVia=2)


--Kategori ID si 5 olan ürünlerin  detaylý satýþ listesini listeliyiz
--select*from [Order Details] where ProductID in (select ProductID from Products where CategoryID=5)

--En fazla satýþ adedi olan ürünümüz hangisidir?
--select top(1) ProductID,MAX(Quantity)as Miktar from [Order Details] group by ProductID order by Miktar desc

----En az satýþ adedi olan ürünümüz hangisidir?
--select top(1) ProductID,min(Quantity)as Miktar from [Order Details] group by ProductID order by Miktar asc


----En fazla satýþ yapan personelimiz?
--select top(1) EmployeeID,COUNT(*) as Miktar  from  Orders  group by EmployeeID order by  Miktar desc



------------------------------------JONÝLER--------------------------------------------
--Joinler her iki tabloyu birbirine baðlarlar
--3 Çeþit join vardýr.
--1)Ýnner Join
--2)Outer join
--2-1)Left outer join
--2-2)Right outer join 
--2-3)Full outer join
--3)Cross Join
--select p.ProductName,p.UnitPrice,p.UnitsInStock  from Products p
--inner join Categories c  on p.CategoryID=c.Category

--Ürünleri  adlarýný tedarik eden þirketlerin adlarýna göre listeleyiniz
--select s.ProductName,s.SupplierID from Products s 
--inner join Suppliers p on p.SupplierID=s.SupplierID


--Ürünlerin satýþ raporunu ürün adý,satýþ fiyatý,adet ve indirim oranlarý listeleyiniz 
--select
--p.ProductName as [Ürün Adý],
--s.UnitPrice as [Satýþ Fiyatý] , 
--p.UnitsInStock as [Adet],
--s.Discount as [Ýndirim Oraný]
--from Products p
--inner join [Order Details] s on s.ProductID =p.ProductID

--Hangi satýþta hangi ürünler satýlmýþtýr.
--select o.ProductID,s.OrderID,s.ShippedDate,p.ProductName,o.Quantity,o.UnitPrice
--from Orders s inner join [Order Details] o on  s.OrderID=o.OrderID  
--inner join Products p on p.ProductID=o.ProductID


--Hangi personel hangi müþteriye hangi tarihte satýþ yapmýþtýr.
--Kullanýcý firmasý - Çalýþan Adý,Sipariþ Tarihi 
--select e.FirstName +' '+LastName as ÇalýþanID,o.OrderDate,o.CustomerID,C.CompanyName
--from Orders o inner join Customers s on s.CustomerID=o.CustomerID
--inner join Employees e on e.EmployeeID=o.EmployeeID
--inner join Customers c on c.CustomerID=S.CustomerID

----Hangi müþteri hangi üründe kaç dolarlýk satýn almýþtýr(Fiyat)
----ContacName,fiyat,ÜrünÝsmi

--select od.CompanyName,(os.UnitPrice*os.Quantity*(1-Discount) )as Fiyat,ProductName,os.Quantity from Customers  od
--inner join Orders o on o.CustomerID=od.CustomerID
--inner join [Order Details] os on os.OrderID=o.OrderID
--inner join Products p on p.ProductID=os.ProductID

--hangi personel hangi kategoriden hangi ürünleri satmýþtýr.

--select cp.CategoryName,od.Quantity,od.ProductID,e.EmployeeID,e.FirstName+' '+LastName as [ Çalýþan Adý Soyadý],p.ProductName
--from Employees e
--inner join Orders o on o.EmployeeID=e.EmployeeID
--inner join [Order Details] od on od.OrderID=o.OrderID
--inner join Products p on p.ProductID=od.ProductID
--inner join Categories cp on cp.CategoryID=p.CategoryID

--Beverages kategorisine ait stoklarda bulunan ürünleri listeliyiniz.
--select * from  Products p
--inner join Categories c  on c.CategoryID=p.CategoryID where CategoryName='Beverages' and p.UnitsInStock>0

--Federal Shipping ile taþýnmýþ ve nancy nin almýþ olduðu sipariþleri listeleyiniz.
--select * from Orders o
--inner join Shippers s on ShipperID=o.ShipVia  
--inner join Employees em on em.EmployeeID=o.EmployeeID
--where s.CompanyName='Federal Shipping' and em.FirstName='Nancy'

--Müþteri Tablosunda CompanyName'leri arasýnda a harfi bulunan vermiþ olduðu  sipariþleri Nancy,Andrew,Janet tarafýndan
--alýnmýþ,Speed Express ile taþýnmamýþ  sipariþlere toplam nekadarlýk kargo ücreti ödenmiþtir.

--select sum(o.Freight) from Orders o
--inner join Shippers s on ShipperID= o.ShipVia
--inner join Customers cs on cs.CustomerID=o.CustomerID
--inner join Employees em on em.EmployeeID=o.EmployeeID
--where cs.CompanyName like '%a%' and em.FirstName in ('Nancy','Andrew','Janet') and s.CompanyName<>'Speedy Express'

--En çok ürün aldýðýmýz 3 toptancýyý  almýþ olduðumuz ürün miktarýna göre raporlayýnýz.
--select top(3) s.CompanyName,count(*) as [alýnansipariþ] from Products p
--inner join Suppliers s on s.SupplierID=p.SupplierID
-- group by s.CompanyName
-- order by alýnansipariþ desc 

--HER BÝR ÜRÜNDEN TOPLAM NE KADAR SATIÞ YAPIÞMIÞTIR VE O ÜRÜNLER HANGÝ KATEGORÝYE AÝTTÝR
--select CategoryName,ProductName,SUM(od.Quantity*od.UnitPrice) AS GELÝR from [Order Details] od
--inner join Products p on p.ProductID=od.ProductID
--inner join Categories c on c.CategoryID=p.CategoryID
--group by CategoryName,ProductName
--ORDER BY GELÝR DESC

--SOL TABLOYLA ÝLGÝLÝ ÖRNEK

--select* from Products p
--right outer join Categories c on c.CategoryID=p.CategoryID
--left outerda solunda kalan tabloyu baz alýr ve  fromun adresindekilerin hepsini getirir.

--select* from Products p
--full outer join Categories c on c.CategoryID=p.CategoryID


--Hangi ürün hangi nakliye firmasý ile taþýnmýþtýr.

--select s.CompanyName,p.ProductName from Products p
-- inner join [Order Details] od on od.ProductID=p.ProductID
--inner join Orders o on o.OrderID=od.OrderID
--left outer join Shippers s on s.ShipperID=o.ShipVia
--GROUP by s.CompanyName,p.ProductName


--Hangi tedarikçiden toplam kaç tl ürün satýlmýþtýr.

--select s.CompanyName,SUM(od.Quantity*od.UnitPrice*(1-od.Discount)) as TotalFiyat  from Suppliers s
--inner  join Products pp on pp.SupplierID=s.SupplierID
--inner join [Order Details] od on od.ProductID=pp.ProductID
--group by s.CompanyName
--order by TotalFiyat desc

--Kategorilerin toplam satýþ tutarý listeleyiniz 
--select c.CategoryName,SUM(od.Quantity*od.UnitPrice*(1-od.Discount)) as SatýþTutarý from Categories c
--left  join Products p on p.CategoryID=c.CategoryID
--left outer join [Order Details] od on od.ProductID=p.ProductID
--group by CategoryName
--order by SatýþTutarý desc

--Nakliyecilerin toplam taþýdýklarý ürünlerin satýþ tutarlarýný listeleyiniz.

--select s.CompanyName,sum(od.Quantity*od.UnitPrice*(1-od.Discount)) from  Shippers s
--right join Orders o on o.ShipVia=s.ShipperID
--inner join [Order Details] od on od.OrderID=o.OrderID
--inner join Products pp on pp.ProductID=od.ProductID
--group by s.CompanyName

--hangi Personel hangi ürünü toplam kaç dolara satmýþtýr.

--select e.FirstName+' '+LastName as SatýcýAdSoyad,p.ProductName as ürünAdý,
--SUM(od.Quantity*od.UnitPrice*(1-od.Discount))  as Tutar from Employees e
--inner join Orders s on s.EmployeeID=e.EmployeeID
--inner join [Order Details] od on od.OrderID=s.OrderID
--right join Products p on p.ProductID=od.ProductID
--group by ProductName,e.FirstName+' '+LastName

--select s.FirstName+' '+LastName as SatýcýAdSoyad,p.ProductName as ürünAdý,
--SUM(od.Quantity*od.UnitPrice*(1-od.Discount))as Tutar from Products p 
--left join [Order Details] od on od.ProductID=p.ProductID
--left join Orders o on o.OrderID=od.OrderID
--left join Employees s on s.EmployeeID=o.EmployeeID
--group by p.ProductName,s.FirstName+' '+LastName

--Having yapýsý----
----Aggregate fonksiyonlar aracýlýðý ile alýnan sonuçara where koþulu kullanamayýz
----where koþulu yerine having kelimesi ile koþul koyabiliriz.


--Toplam satýþ miktarý 1200 üzerinde olan ürünleri listeleyiniz.
--select p.ProductName, SUM(od.Quantity) as 'Sipariþ Miktarý' from [Order Details] od
--inner join Products p on p.ProductID=od.ProductID
-- group by p.ProductName 
--having SUM(od.Quantity)>1200
--order by [Sipariþ Miktarý] desc


--Hangi personel hangi ürünü toplam kaç dolara satmýþtýr.
--satýþ tutarý 1000den büyük olanlarý listeleyiniz.

--select e.FirstName+' '+LastName as 'Çalýþan Ýsim',p.ProductName,SUM(od.Quantity*od.UnitPrice*(1-od.Discount))
--as 'SatýþTutarý' from [Order Details] od
-- inner join Products p on p.ProductID=od.ProductID
-- RIGHT join Orders o on o.OrderID=od.OrderID
-- inner join Employees e on e.EmployeeID=o.EmployeeID
-- group by e.FirstName+' '+LastName,p.ProductName
-- having SUM(od.Quantity*od.UnitPrice*(1-od.Discount))>1000
-- order by SatýþTutarý desc 


--250den fazla sipariþ taþýmýþ olan kargo firmalarýnýn adlarýný telefon numaralarýný ve sipariþ sayýlarýný listeleyiniz.
--select s.CompanyName,s.Phone,COUNT(o.ShipVia) as SipariþEdilenMiktar from Orders o
--inner join Shippers s on s.ShipperID=o.ShipVia
--group by s.CompanyName,s.Phone
--having COUNT(o.ShipVia)>250
--order by SipariþEdilenMiktar desc

--*********************************use AdventureWorks2019***************************************************************
--Sipariþ tablosundaki müþteri baþýna toplam vade tutarý listeleyiniz.
--select CustomerID,sum(TotalDue) as 'Müþteri Baþýna Toplam Vade' from Sales.SalesOrderHeader
--group by CustomerID
--having SUM(TotalDue)>3000 and count(*)=6
--count 6 ya eþit olan 6 kez sipar vermiþ olan tüm müþteriler

------------------------------Tablolarý birleþtirme komutlarý----------------------------
--Kolonlarýn ortak olmasý gerekir.
--select CompanyName,Phone,'Tedarikçi',Fax from Suppliers
--union -- tablo birleþtirme
--select CompanyName,Phone,'MÜÞTERÝ',City from Customers

--Kesiþim kümesi alýnýr her iki tablodaki ortak deðerleri alýrýz.
--select UnitPrice,ProductID from [Order Details]
--intersect --kesiþim demek 
--select UnitPrice,ProductID from Products  order by UnitPrice 


--Fark Kümesi--ÝLK TABLODAKÝ FARK ALINIR EN ÜSTE NE YAZILIYORSA 
--select UnitPrice,ProductID from [Order Details]
--except ----fark kümesi
--select UnitPrice,ProductID from Products  order by UnitPrice 

--select UnitPrice,ProductID from  Products
--except --fark kümesi
--select UnitPrice,ProductID from [Order Details]  order by UnitPrice 

--Cross Join her iki tabloyu kartezyen çarparak kayýtlarý listeler 
--örnek 3 categorin var 5tane ürünün var 3*5=den sana 15tane ürün getiricek 

--select ProductName,CategoryName from Products cross join Categories


---Ýnsert iþlemi ----
--insert into Shippers (CompanyName,Phone)
--values('deneme','212 555 66 77')
--go
--select * from Shippers

--Eðer sýrasýný bilirtak bu þekildede eklenebilir
--insert into Shippers values ('deneme','212 555 66 77')


--Herkes kendini bir çalýþan olarak  istediði kolonlarý kullanarak employee tablosuna eklesin

--insert into Employees values ('Gökçeli','Görkem','Sales Representative','Dr.','2023-02-06 00:00:00.000','1997-12-06 00:00:00.000','Cumhuriyet no:66','Ýstanbul','','35333','TR','(212) 222 85 63','','','','2','')
--insert into Employees(FirstName,LastName,Title,TitleOfCourtesy,City,Country)
--values('Gogole','BABA','KRAL','TC','Ýstanbul','TR')

--update Employees set Title='Müdür',TitleOfCourtesy='Md.'
--go
--select *from Employees where FirstName='Görkem'


--Çalýþanlar tablosunda Nancy adli çalýþanýn doðum tarihini 11.03.1980 ve þehir bilgisini 
--Ýstanbul olarak deðiþtiriniz.

--update Employees set BirthDate='11.03.1980',City='Ýstanbul' where FirstName= 'Nancy'
--go 
--select *from Employees 

--BÝR UPDATE YAPARKEN BAÞINA BEGÝN KOYMASSAN ROLLBACK TRAN YAPAMAZSIN 
--begin tran
--update Products set UnitPrice = 50
--select *from Products


--rollback tran

--DELETE YAPISI--
--BEGÝN TRAN
--DELETE FROM Shippers where ShipperID>3
--go
--rollblack tran


----View Nesnesi-------------**-*-*-*-*-*-
--Bir sorgu içerisinde birden fazla iþlem gerçeleþtiriyorsak ve üstüne üstlük bu sorguyu defalarca çalýþtýrmamýz gerekiyorsa her defasýnda ayný kodlarý yazmak yerine bu kodlarý tutan sanal tablolar oluþtururuz.

--Örnek Amerikjalý Müþterilerden alýnmýþ bir sipariþi listeleyen bir sorgu tasarlayýnýz.

--create view Amerikalilar
--as
--Select c.CustomerID,CompanyName,OrderID,OrderDate from Orders o inner join Customers c on c.CustomerID=o.CustomerID  where c.Country='USA'
--go 
--select * from Amerikalilar

--Ürün satýþlarý ürünýd,ürün ismi,ürün price , ürün stokmiktarý ve ürün satýþ fiyatý olarak satýlan ürünleri listeleyen view oluþturup çalýþtýralým
--use NORTHWND
--create view UrunSatýslarý
--as
--select p.ProductID,p.ProductName,(od.UnitPrice*(1-Discount)) as SatýþFiyatý ,p.UnitsInStock as 'Stok Miktarý' from [Order Details] od 
--inner join Products p on p.ProductID=od.ProductID 
--go
--select pro from UrunSatýslarý
 
--Speedy Express ile taþýnmýþ, nancynin almýþ aldýðý olduðu Pazartesi  günleri DUMON ya da ALFKI 'li müþteriler tarafýndan verilmiþ olan sipariþleri  saklayan bir vir view oluþturunuz.

--alter view SpecialTablo
--as
--select s.CompanyName,e.FirstName,c.CustomerID,o.OrderDate ,DATENAME(WEEKDAY,o.OrderDate) as 'Gün'from Orders o
--i	nner join Customers c on c.CustomerID=o.CustomerID
--inner join Shippers s on s.ShipperID=o.ShipVia
--inner join Employees e on e.EmployeeID=o.EmployeeID
--where s.CompanyName='Speedy Express' and (C.CustomerID='DUMON' or C.CustomerID='ALFKI') AND DATENAME(WEEKDAY,o.OrderDate)='Monday' and e.FirstName='Nancy'
--go
--select* from SpecialTablo

--Hangi ürün hangi müþteri hangi personelden aldýðýný listelyen view yazalým 
--view in ismi DetaliSatisraporu

--create view DetayliSatisRaporu
--as
--select e.FirstName+' '+e.LastName  as Pazarlayan,o.CustomerID,p.ProductName from Orders o
--inner join [Order Details] od on od.OrderID=o.OrderID
--inner join Products p on p.ProductID=od.ProductID
--inner join Employees e on e.EmployeeID=o.EmployeeID
--go
--select *from DetayliSatisRaporu

--View üzerinden insert iþlemi-------------------

--create view Kategorislemler
--as
--select * from Categories

--insert into Kategorislemler(CategoryName,[Description])
--values ('Sütlü Tatlýlar','Süt iyidir Ca+ dan dolayý  kemiðe iyi gelir')
--go
--select*from Kategorislemler

--Bu örnekte ekleme yapýlamýyor  join olduðu için
--create view KategoriUrunleri
--as
--select ProductName,CategoryName from Categories inner join Products on Products.CategoryID=Categories.CategoryID

--insert into KategoriUrunleri(ProductName,CategoryName)
--values('Sütlü Nuriye','Sütlü Tatlýlar')


--Viewda Order by kullanýmý 'top()'  kullanmak zorundayýz.
--create view FiyataGoreUrunler
--as 
--select top 77 ProductName,UnitPrice from Products order by UnitPrice desc 
--go 
--select * from FiyataGoreUrunler


--Witch check option 
--view üzerinde insert iþlemi gerçekleþtirirken eðer view niz üzerinde bir where kriteri tanýmlýysa
--insert edilirken gönderilen deðerin  de bu kritere uygun olmasýný saðlayabiliriz.

--create view  FilebaslayanKargolar
--as
--select * from Shippers where CompanyName like 'F%' with check option
--go
--select * from FilebaslayanKargolar

----Yukarda companynamede like F ile koþul atadýðýmýz için bir insert iþleminde companyname eklerken F ile baþlayan bir baþlýk ekleyebilirim.
--insert into FilebaslayanKargolar(CompanyName)
--values ('Fly Kargo')
--go
--select * from FilebaslayanKargolar

--with schemabinding 
--view ýn baðlý olduðu tablolardaki kolonlarý kitler ve o tablolarýn kolonlarýnýn silinmesine engel olur

--create view TumKargolar
--with schemabinding 
--as
--select CompanyName from dbo.Shippers


----Deðiþtirmeye çalýþýyoruz þimdi
--alter table Shippers drop column Phone 
 -------------------------------------------Views 
 --create view KategoriyeGoreUrunler
 --with schemabinding,encryption
 --as
 --select CategoryName,ProductName,UnitsInStock,UnitPrice,(UnitPrice*1.18) as 'KDV LÝ FÝYAT' from dbo.Categories
 --inner join dbo.Products on Products.CategoryID=Categories.CategoryID
 --inner join  dbo.Suppliers on Suppliers.SupplierID=Products.SupplierID
 --where CategoryName='Beverages' and Country='USA' and UnitsInStock > 0

 ---Storeced Procedure----
 --select,insert,update,delete gibi komutlarý çalýþtýrabilen metotlardýr.
 --çok hýzlý ve güvenlidirler.
 --hýzlý olmalarýnýn nedeni server tarafýndan çalýþýr.
 --Güvenli olmalarýnýn nedeni parametlerle dýþarýdan bilgi alýrlar.
 --Client ta çalýþmadýklarýnda client pclerin donanýmsal olarak bir anlamý kalmaz.

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

 --Dýþarýdan deðer kadar ürünlerin fiyatlarýna zam yapan prosedür tasarlayýnýz.

--create proc ZamYap1
--(
--@ZamYap int
--)
--as
--update Products
--set UnitPrice+=@ZamYap


--ZamYap1 10
--select* from Products


--Dýþarýdan girilen kategori adýna göre o kategoriye ait olan ürünleri listeleyen bir prodesur.

--create Proc Getir
--(
--@aranacakkategori nvarchar(20)
--)
--as
--select p.ProductName,c.CategoryName from Products p inner join Categories c on c.CategoryID=p.CategoryID
--where CategoryName=@aranacakkategori

--exec Getir 'Meat/Poultry'

--Dýþarýdan girilen kargo firmasý tarafýndan taþýnmýþ ve yine dýþarýndan girilen kargo ödemesi deðer aralýðýndaki sipariþleri listelyen bir prosedur yazýnýz

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


--Dýþarýdan girilen karakter dizisini içerisinde barýndan 'müþteri adýna' sahip müþterilerce verilmiþ sipariþleri listeleyen
--produsedür tasarlayýnýz (MüsteriSipariþleri)

--alter Proc MüsteriSipariþleri
--(
--@karakter char
--)
--as
--select o.OrderID,o.OrderDate,s.CustomerID,s.CompanyName from Orders o inner join Customers s on s.CustomerID=o.CustomerID
--where s.CustomerID like '%'+@karakter+'%' 

-- MüsteriSipariþleri 'et'

--Stok miktarý min-max dýþarýdan girilen 2 deðer arasýnda olan ürün ücreti dýþardan girilen 2 deðer arasýnda olan  toptancý firma adý dýþarýdan girilen  ve belirli harfleri barýndýran ürünlerin adlarýný fiyatlarýný toptancý þirket adlarýný ve fiyatlarýnýn kdv eklenmiþ hallerini gösteren bir procedur tasarlayýnýz.

--alter proc ProductsDetails
--(
--@Deger1 int,
--@Deger2 int,
--@Urun1 int,
--@Urun2 int,
--@ToptancýAd nvarchar(45)

--)
--as
--select s.SupplierID, p.UnitsInStock,s.CompanyName,p.ProductName,p.UnitPrice*1.8 as 'Kdv Eklenmiþ Hali' from  Products p
--inner join Suppliers s on s.SupplierID=p.SupplierID
--where s.CompanyName like @ToptancýAd and
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

--select p.ProductName, s.CompanyName, p.UnitsInStock, p.UnitPrice*1.18 as 'KDV Eklenmiþ Hali' from Products p inner join Suppliers s on s.SupplierID = p.SupplierID
--where p.UnitsInStock between @stokmiktar1 and @stokmiktar2
--and p.UnitPrice between @ucret1 and @ucret2
--and s.CompanyName = @firmaAdi
--and p.ProductName like '%'+@urunad+'%'

--exec urundetaygetir '10','50','1000','5000','Exotic Liquids','a'


--Dýþarýdan girilen çalýþanID'si tarafýndan alýnmýþ  sipariþleri listeleyin.Ancak dýþarýdan kaç adet çalýþan ID geldiði bilinmememktedýr.

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



--Hangi Kargo firmasýnýn sipariþleri gelsin

--create proc ShipperOrder

--(
--@shippers nvarchar(max)
--)
--as
--declare @sorgu nvarchar(max)
--set @sorgu=('select * from Orders where ShipVia in ('+@shippers+')' )

--execute(@sorgu)

--ShipperOrder '1,2,3'

-------------------------------------------*TSQL ÝF KOMUTU*-------------------------------
--declare @sayi int 
--select @sayi=COUNT(*) from Products
--if @sayi > 150
--begin
--print 'Fazla ürün var ' 
--end
--else
--begin
--print 'Az ürün var'
--end
-------------------------------------------------------------------------------------------------------
--use NORTHWND
--GO
--select * from sys.tables -- nortwindteki tablolar sys içerisinde tutulur görmek için <<<







--if exists (select * from sys.tables where Name='Customers')
--begin
--print 'Müþteri tablosu bu veritabanýnda mevcut'
--end 
--else 
--begin 
--print 'Müþteri tablosu bu veritabanýnda mevcut deðil'
--end


---------------------------------------------------------------------------------------------
--declare @sayac int=1;
--while @sayac<11
--begin 
--print @sayac
--set @sayac+=1
--end

---------------------------------------------------------------------
-- BÝR ÝÞ YERÝNE GÝTTÝN VE TABLOLARI BÝLMÝYORSAN TSQL KULLANARAK KONTROL EDEBÝLÝRSÝN
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
--	select @urunad='Ürün Kodu: '+CAST(ProductID as nvarchar(max))+' Ürün Adý: '+ProductName+'Ürün Miktarý: '+cast( UnitsInStock as nvarchar(max))  from Products 
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
--			(3,'Ýtalya',0),
--			  (4,'Hollanda',0),
--				(5,'Polonya',0)
--go
--select * from ornektablo


--declare @counter int,@maxid int ,@countryName nvarchar(100)
--select @counter=min(id),@maxid=max(id) from ornektablo

--while (@counter is not null and @counter<=@maxid)
--begin
-- select @countryName=ulkeadi from ornektablo where id=@counter
--print convert (varchar,@counter)+'. ülke si '+ @countryName
--set @counter+=1
--end
--------------------------------------------------------------------------
--KATEGORÝ EKLEME 
--create proc KategoriEkleyici
--(
-- @ad nvarchar(20),
-- @sonID int output
-- --eðer procedure içerisindeki bir deðeri dýþarýya çýkarmak isterseniz >>>output<<< anahtar kelimesini kullanýrýz.
-- )
-- as
-- insert into Categories (CategoryName) values (@ad)
--set @sonID = SCOPE_IDENTITY()
---- SCOPE_IDENTITY() METODU SON KAYDIN ÝD SÝNÝ BÝZE GETÝRÝR 
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

----olmayan kategori için test
--select  * from Categories

--exec UrunEkleyici 'Fýrýnda Sütlaç', 'Sütlü Tatlýlar'

--exec UrunEkleyici 'baklava','þerbetli tatlýlar'

--------------------------------------------------------------------------------------
-------------------***********************FONKSÝYONLAR**********---------------------------------------
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
-- Girilen 3 sayýnýn ortalamasýný geri döndüren bir fonksiyon yazýnýz.
--create function sayiort
--(
--@sayibir int,
--@sayiiki int,
--@sayiüç int
--)
--returns int 
--as 
--begin
--declare @ortalama int
--set @ortalama = (@sayibir+@sayiiki+@sayiüç)/3
--return @ortalama
--end

--select dbo.sayiort(2,2,3) as ortalama

-------------------------------------------------------
--SQL DE TAM SAYI VERÝ TÝPLERÝ 
--tinyint -1byte
--smallint - 2byte
--int - 4 byte
--bigint -8byte

--sqlde ondalýk sayý veri tipleri
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
--declare @birleþtirici char(19)
--set @birleþtirici=LOWER(left(@ad,3)+'.'+RIGHT(@soyad,3))+'@hotmail.com'
--return @birleþtirici
--end

--select dbo.mailolusturucu('Görkem','Beyazkaya')

--select FirstName,LastName,dbo.mailolusturucu(FirstName,LastName) from Employees

----Yaþ Hesaplayýcý fonksiyonu yazýnýz
--create function yashesaplayýcý
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

--select dbo.yashesaplayýcý ('06.12.1997')
--select FirstName,LastName,dbo.yashesaplayýcý(BirthDate)  from Employees

--ev  ödevi 
--fiyat adet indirim verildiðinde kdv dahil fiyatý veren fonksiyonu yazýnýz.
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




--Table Fonksiyonlarý

--create function SiparisBilgisi 
--(
--@ad nvarchar(20)
--)
--returns table 
--as
--return select o.OrderID,o.OrderDate,e.FirstName+' '+e.LastName as 'AD' from Orders o inner join Employees e on e.EmployeeID=o.EmployeeID where 
--e.FirstName=@ad

--select OrderDate,ad from dbo.SiparisBilgisi('Janet')



--Dýþardan girilen kargo firmasýnýn taþýmýþ olduðu sipariþleri listeleyen fonksiyon yazýnýz


--alter function Kargocu
--(
--@kargoad nvarchar(45)

--)
--returns table 
--as
--return select * from Orders o inner join Shippers s on s.ShipperID=o.ShipVia where s.CompanyName =@kargoad


--select *from dbo.Kargocu ('Speedy Express')  
--select*from Shippers

---****-*-*-*-*TÝGERLAR-*-*-*-*-*--**-*
--Tetikleyiciler kullanýcý tarafýndan elle gerçekleþtirilemeyen ya da gerçekleþtirilmesi zaman alan iþlemlerin bir takým olaylardan once yada sonra sistem tarafýndan otomatikman gerçekleþmesinini saðlayan yapýlardýr.


--2ye ayrýlýr 
--1-DML TRÝGGER (SELECT,ÝNSERT,UPDATE,DELETE GÝBÝ YAPILARDAN ÖNCE YADA SONRA ÇALIÞANLAR )
--2-DDL Trigger (Create,alter,Drop GÝBÝ YAPILARDAN ÖNCE YADA SONRA ÇALIÞANLAR)


--create trigger Tetikci
--on Shippers
--after insert 
--as
--select*from Shippers

--insert into Shippers values('yasar kargo','21223334565')

--diyelim ki ben bu trigerý pasif hale getirmek istiyorum . 

--disable trigger Tetikci on Shippers
-- aktif etmek içinde 
-- enable trigger Tetikci on Shippers
--drop tigger Tetikci

--Kategori tablosuna bir güncelleme gerçekleþtirilden sonra ekrana ''güncelleme baþarýyla oldu '' mesajýný yazdýran triggeri tasarlayanýz.

--alter trigger Updatee
--on Categories
--after Update
--as
--print 'güncelleme baþarýyla gerçekleþtirildi'



--UPDATE Categories
--SET CategoryName = 'Halka Tatlýsý'
--WHERE CategoryID = 9;



--Kategori tablosuna  kayýt eklendikten sonra son kaydýn detaylarýný gösteren
--trigger tasarlayýnýz

--create trigger tetikci1
--on Categories
--after insert 
--as 
--declare @sonID int 
----Ýnsert tablosunu tigerin baðlý bulunduðý tablloya yapýlan son kaydý üzerine alan tablodur.
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


--TRÝGGER MODLARI
--1-After bir tabloya yapýlan iþlemlerden hemen sonra çalýþan trigger yapýlarýdýr.
--2-Insteaf of bir taloya yapýlmasý istenen iþlemden hemen önce tetiklenen yapýlardýr.

--create trigger silmeEngeli
--on categories 
--instead of delete 
--as
--declare @silinenkayitsayisi int 
--select @silinenkayitsayisi=count(CategoryID) from deleted where  CategoryID=9
--if @silinenkayitsayisi>0
--begin
--print 'silinemez veri hatasý'
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

-- GÖRÜNÜRDE SÝLÝNMÝÞ GÝBÝ GÖSTEREBÝLÝYORUZ .
--select * from Products

--create trigger trgsil on products
--instead of delete
--as 
--update Products
--set Discontinued = 1 where ProductID in ( select ProductID from deleted)

--begin tran
--delete from Products where  ProductID=1
--rollback tran



--DDL TRÝGGER 
--Genellikle create,alter,drop gibi iþlemlerden sonra çalýþan tetikçilerdir.

--instead of kelimesi yerine  for kelimesi kullanýlýr.

--tabloya düzenlemesini engelleyelim ardýndan  tablo eklemek için  trigger droplamak gerek.
--create trigger TabloduzenlemeEngeli
--on database 
--for ALTER_TABLE
--as
--raiserror('Tablo Düzenleme Engeli',16,1)
--rollback--düzenleme iþlemi geri alýnýr.

--alter table Shippers
--add Kargofax nvarchar(50) null

--select * from Shippers

--drop trigger TabloduzenlemeEngeli on database


--Server üzerinde veritabýný oluþturmayý engelleyen bir trigger tasarlayýnýz.

--create trigger DatabaseBlock
--on ALL SERVER 
--for CREATE_DATABASE
--as
--raiserror('Database Oluþturma Engeli',16,1)
--rollback 

--create database oluþtur
--drop trigger DatabaseBlock on all server





--*********************************TRANSACTÝON***************
--Veritabaný üzerinde birbiriyle baðýmlý olarak gerçekleþen iþlemleriniz varsa ve bu iþlemlerin tamamýný bir bütün olarak
-- kabul görülüp herhangi bir noktada bir arýza meydana geldiðinde bu tek vücut halindeki iþlemlerin iptal edilmesini isterseniz bu iþlemleri bir tansaction bloðu içinde gerçekleþtirmelisiniz.

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
--values ('Þükrü',10000)

--select * from Musteriler

--begin try
--update Musteriler set Bakiyesi-=1000 where MusteriID=1
--select 10/0
--update Musteriler set Bakiyesi+=1000 where MusteriID=2
--end try
--begin catch 
--raiserror('Hata var ',16,1)
--end catch 

--Transaction kullanarak yapalým
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

