--CREATE DATABASE Company
--USE Company

CREATE TABLE Isci(
	Id int identity(1,1) PRIMARY KEY,
	Adi nvarchar (50),
	Soyadi nvarchar (60),
	Ata_Adi nvarchar (50),
	VezifeId int references Vezife(Id),
	Maas float
	
)

INSERT INTO Isci 
	VALUES ('Inci','Kerimova','Taleh',1,940),
	 ('Senan','Agababayev','Murad',2,1780),
	 ('Eziz','Memmedli','Musa',3,2360),
	 ('Aysel','Hesenova','Rauf',4,760)
	 

--SELECT * FROM Isci

CREATE TABLE Vezife(
	Id int identity(1,1) PRIMARY KEY,
	Ad nvarchar	(50)
	
)


INSERT INTO Vezife
	VALUES('Satis Meneceri'),
	      ('Kassir'),
		  ('Satici'),
		  ('Anbardar')
	

CREATE TABLE Filial (
	Id int identity(1,1) PRIMARY KEY,
	Ad nvarchar	(50)
)
--SELECT * FROM Satis

INSERT INTO Filial
VALUES('Araz market, Zaqatala filiali'),
('Araz market, Seki filiali'),
('Araz market, Sabirabad filiali')


CREATE TABLE Mehsul(
	Id int identity(1,1) PRIMARY KEY,
	Ad nvarchar (50),
	Alis_Qiymeti DECIMAL(3,2),
	Satis_Qiymeti DECIMAL(3,2)
)

INSERT INTO Mehsul
VALUES('Fairy',1.90,3),
      ('Pantene',3.10,6),
      ('Palmolive',0.95,2),
      ('Domestos',1.60,4)

      

CREATE TABLE Satis(
	Id int identity(1,1) PRIMARY KEY,
	MehsulId int references Mehsul(Id),
	IsciId int references Isci(Id),
	SatisTarixi DATE,
	FilialId int references Filial(Id)
)

INSERT INTO Satis
VALUES(1,2,'2022-04-12',1),
	  (2,3,'2022-01-25',2),
	  (3,4,'2021-06-01',3),
	  (4,5,'2021-06-12',4)
	  
	  

SELECT Satis.IsciId, Satis.MehsulId, Satis.FilialId, Mehsul.Alis_Qiymeti,Mehsul.Satis_Qiymeti FROM Satis --1
INNER JOIN Mehsul
ON
Mehsul.Id=Satis.Id


SELECT COUNT (IsciId) AS MehsulId FROM Satis --2
 

SELECT Sum(Satis_Qiymeti) AS Satis FROM Mehsul WHERE Id = 3 or  Id = 4 --3


SELECT COUNT(MehsulId) AS IsciId FROM Satis WHERE Satis.IsciId=4 --4


SELECT Satis.SatisTarixi, Satis.FilialId FROM Satis WHERE Satis.Id =4  --5 
ORDER BY Satis.FilialId DESC


SELECT Satis.SatisTarixi, Satis.MehsulId FROM Satis WHERE Satis.Id =3 or Satis.Id=4 --6
ORDER BY Satis.MehsulId DESC



