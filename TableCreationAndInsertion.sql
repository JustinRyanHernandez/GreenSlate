CREATE TABLE Users (
	Id int PRIMARY KEY NOT NULL,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL
	);

CREATE TABLE Project (
	Id INT PRIMARY KEY NOT NULL,
	StartDate DATETIME NOT NULL,
	EndDate DATETIME NOT NULL,
	Credits INT NOT NULL
	);

CREATE TABLE UserProject (
	UserId INT FOREIGN KEY REFERENCES Users(Id) NOT NULL,
	ProjectId INT FOREIGN KEY REFERENCES Project(Id) NOT NULL,
	IsActive BIT NOT NULL,
	AssignedDate DATETIME NOT NULL
)

INSERT INTO Users(
	Id,
	FirstName,
	LastName
	)
VALUES
	(
		1,
		'Justin',
		'Hernandez'
	),
	(
		2,
		'Jenny',
		'Lyons'
	),
	(
		3,
		'Jaclyn',
		'Fiore'
	);

INSERT INTO Project(
	Id,
	StartDate,
	EndDate,
	Credits
	)

VALUES 
	(
		1,
		'2019/01/20',
		'2019/03/06',
		5
	),
	(
		2,
		'2019/05/10',
		'2019/05/15',
		2
	),
	(
		3,
		'2018/12/12',
		'2018/12/24',
		4
	),
	(
		4,
		'2019/04/01',
		'2019/06/01',
		10
	),
	(
		5,
		'2019/02/02',
		'2019/03/01',
		4
	),
	(
		6,
		'2019/06/06',
		'2019/06/16',
		2
	),
	(
		7,
		'2019/02/10',
		'2019/08/10',
		22
	),
	(
		8,
		'2019/03/15',
		'2019/04/01',
		4
	),
	(
		9,
		'2019/03/01',
		'2019/03/15',
		2
	),
	(
		10,
		'2019/11/01',
		'2019/12/01',
		6
	);


INSERT INTO UserProject(
	UserId,
	ProjectId,
	IsActive,
	AssignedDate
	)

VALUES 
	(
		1,
		1,
		0,
		'2019/01/22'
	),
	(
		1,
		2,
		0,
		'2019/03/06'
	),
	(
		1,
		3,
		0,
		'2018/12/11'
	),
	(
		1,
		4,
		1,
		'2019/03/01'
	),
	(
		1,
		5,
		0,
		'2019/02/03'
	),
	(
		2,
		6,
		1,
		'2019/03/06'
	),
	(
		2,
		7,
		1,
		'2019/02/22'
	),
	(
		2,
		8,
		1,
		'2019/03/06'
	),
	(
		2,
		9,
		1,
		'2019/03/03'
	),
	(
		2,
		10,
		0,
		'2019/02/11'
	),
	(
		3,
		10,
		0,
		'2019/03/02'
	),
	(
		3,
		8,
		1,
		'2019/02/21'
	),
	(
		3, 
		6,
		1,
		'2019/03/04'
	),
	(
		3,
		4,
		1,
		'2019/03/05'
	),
	(
		3, 
		2,
		0,
		'2019/04/01'
	);



select * from Project
select * from UserProject
select * from Users

