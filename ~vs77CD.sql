create database AB104

use AB104

create table Roles(
Id int primary key identity,
Name varchar(32))

create table Users(
Id int primary key identity,
Username varchar(128),
Password varchar(64),
RoleId int foreign key references Roles(Id) not null)


insert into Roles values ('Admin'),('Moderator'),('Member')

insert into Users values ('Asiman','asiman1234',1),
('Zuzuu','zuzu1234',2),
('Shamama','cepis1234',3)


select u.Id,u.Username,r.Name Role from Users u
join Roles r
on u.RoleId=r.Id

-------------------------------------------------------------------------------


create table Colors(
Id int primary key identity,
Name nvarchar(64))

create table Categories(
Id int primary key identity,
Name nvarchar(64))


create table Products(
Id int primary key identity,
Name nvarchar(64) not null,
Price decimal(18,2) not null,
Cost int not null,
CategoryId int foreign key references Categories(Id)
)

create table ProductColors(
ProductId int foreign key references Products(Id),
ColorId int foreign key references Colors(Id)
)



insert into Categories values ('Hoddie'),('T-shirt'),('Trousers')

insert into Colors values ('Blue'),('Red'),('White'),('Black')

insert into Products values ('LC Waikiki','30.0',10,1),('TrendyolMan','40.5',10,2),('Koton','60.0',15,3)


insert into ProductColors values(1,1),(1,2),(1,3),(1,4),
(2,2),(2,3),
(3,1),(3,4)


select p.Name,ca.Name Category,co.Name Color,p.Price from Products p
join Categories ca
on p.CategoryId=ca.Id
join ProductColors pc
on pc.ProductId=p.Id
join Colors co
on  pc.ColorId=co.Id