--XML and Xquery

declare @doc int, @xmldoc varchar(max)

set @xmldoc = '
      <root>
	  <employee id="111" Name="Sandeep" address="mumbai"/>
	  <employee id="123" Name="Madan" address="matunga"/>
	  <employee id="134" Name="Aditya" address="thane"/>
	  </root>
'

exec sp_xml_preparedocument @doc output, @xmldoc

select id,name,address
from
openxml(@doc, 'root/employee',1)
with(id int,name varchar(10),address varchar(10))

create proc xqueries
as
begin
DECLARE @books xml
SET @books = '

<bookstore>

<book category="COOKING">
  <title lang="en">Everyday Italian</title>
  <author>Giada De Laurentiis</author>
  <year>2005</year>
  <price>30.00</price>
</book>

<book category="CHILDREN">
  <title lang="en">Harry Potter</title>
  <author>J K. Rowling</author>
  <year>2005</year>
  <price>29.99</price>
</book>

<book category="WEB">
  <title lang="en">XQuery Kick Start</title>
  <author>James McGovern,Per Bothner,Kurt Cagle,James Linn,Vaidyanathan Nagarajan</author>
  <year>2003</year>
  <price>49.99</price>
</book>

<book category="WEB">
  <title lang="en">Learning XML</title>
  <author>Erik T. Ray</author>
  <year>2003</year>
  <price>39.95</price>
</book>

</bookstore>
'
--SELECT @books.query('/bookstore/book/price')

--SELECT @books.query('/bookstore')

--select @books.value('(/bookstore/book)[1]', 'nvarchar(30)')

--select @books.value('(/bookstore/book/@category)[1]', 'nvarchar(30)')

--select @books.value('(/bookstore/book/@category)[3]', 'nvarchar(30)')

--select @books.value('(/bookstore/book/title)[1]', 'nvarchar(30)')

--select @books.value('(/bookstore/book/title[@lang = "en"])[1]', 'nvarchar(30)')

select
@books.value('(/bookstore/book/@category)[1]', 'nvarchar(30)') as Category,
@books.value('(/bookstore/book/title)[1]', 'nvarchar(30)') as title,
@books.value('(/bookstore/book/author)[1]', 'nvarchar(30)') as author,
@books.value('(/bookstore/book/year)[1]', 'nvarchar(30)') as year,
@books.value('(/bookstore/book/price)[1]', 'nvarchar(30)') as price
union all
select
@books.value('(/bookstore/book/@category)[2]', 'nvarchar(30)') as Category,
@books.value('(/bookstore/book/title)[2]', 'nvarchar(30)') as title,
@books.value('(/bookstore/book/author)[2]', 'nvarchar(30)') as author,
@books.value('(/bookstore/book/year)[2]', 'nvarchar(30)') as year,
@books.value('(/bookstore/book/price)[2]', 'nvarchar(30)') as price
union all
select
@books.value('(/bookstore/book/@category)[3]', 'nvarchar(30)') as Category,
@books.value('(/bookstore/book/title)[3]', 'nvarchar(30)') as title,
@books.value('(/bookstore/book/author)[3]', 'nvarchar(30)') as author,
@books.value('(/bookstore/book/year)[3]', 'nvarchar(30)') as year,
@books.value('(/bookstore/book/price)[3]', 'nvarchar(30)') as price
union all
select
@books.value('(/bookstore/book/@category)[4]', 'nvarchar(30)') as Category,
@books.value('(/bookstore/book/title)[4]', 'nvarchar(30)') as title,
@books.value('(/bookstore/book/author)[4]', 'nvarchar(30)') as author,
@books.value('(/bookstore/book/year)[4]', 'nvarchar(30)') as year,
@books.value('(/bookstore/book/price)[4]', 'nvarchar(30)') as price

end
exec xqueries

drop procedure xqueries


----------------------------------------------------

declare @xmlcontent xml

--Select CAST(@XmlDocStudents as varchar(max))

set @xmlcontent = '
<bookstore>

<book category="COOKING">
  <title lang="en">Everyday Italian</title>
  <author>Giada De Laurentiis</author>
  <year>2005</year>
  <price>30.00</price>
</book>

<book category="CHILDREN">
  <title lang="en">Harry Potter</title>
  <author>J K. Rowling</author>
  <year>2005</year>
  <price>29.99</price>
</book>

<book category="WEB">
  <title lang="en">XQuery Kick Start</title>
  <author>James McGovern,Per Bothner,Kurt Cagle,James Linn,Vaidyanathan Nagarajan</author>
  <year>2003</year>
  <price>49.99</price>
</book>

<book category="WEB">
  <title lang="en">Learning XML</title>
  <author>Erik T. Ray</author>
  <year>2003</year>
  <price>39.95</price>
</book>

</bookstore>
'

declare @doccnt int,@Xmldoc varchar(max)


exec sp_xml_preparedocument @doccnt output,@Xmlcontent

Select * from OPENXML(@doccnt, 'bookstore/book', 2)
with (title varchar(50) ,author nvarchar(max) ,year int , price float )