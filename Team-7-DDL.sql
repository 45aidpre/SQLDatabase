drop table customer cascade;
drop table cryptocurrency cascade;
drop table marketActivities cascade;
drop table portfolio cascade;
drop table transactions cascade;

create table customer
	(name				varchar(25),
	 id					numeric(7),
	 bankName			varchar(25),
	 accountNumber		numeric(15),
	 routingNumber		numeric(9,0),
	 ssn				numeric(9),
	 bday				numeric(8),
	 age				numeric(3,0),
	 phone				numeric(10,0),
	 email				varchar(30),
	 creditScore		numeric(3,0),
	 balance			numeric(10,2),
	 joinDate			numeric(8),
	 address			varchar(50),
	 loginPassword		varchar(30),
	 primary key (id)
	);
	
create table cryptocurrency
	(id     			numeric(5),
	 name				varchar(35) unique,
	 currentValue		numeric(7,2),
	 highValueToday		numeric(7,2),
	 lowValueToday		numeric(7,2),
	 marketCap          numeric(15,2),
	 volume				numeric(15,0),
	 percentChange24h	numeric(6,4),
	 percentChange7d	numeric(6,4),
	 availableSupply	numeric(15,0),
	 totalSupply		numeric(15,0),
	 primary key (id, name)
	);
	
create table marketActivities
	(cryptoId			numeric(5),
	 cryptoName         varchar(25),
     high				numeric(12,2),
	 low 				numeric(12,2),
	 active 			numeric(12,2),
	 volume				numeric(14,0),
	 marketCap			numeric(14,0),
	 percentChange24h	numeric(5,2),
	 totalMarketCap24h	numeric(14),
	 recommendation		varchar(15),
	 primary key (cryptoId),
	 foreign key (cryptoName) references cryptocurrency (name)
	);

create table portfolio
	(customerId			numeric(7),
	 numberCoinsOwned	numeric(3),
	 portfolioValue		numeric(12,2),
	 primary key (customerId)
	);

create table transactions
	(id     			numeric(15),
     customerId         numeric(7),
	 type				varchar(15),
	 amount				numeric(12,2),
	 currency   		varchar(20),
	 timestamp			numeric(14),
	 status				varchar(15),
	 fee				numeric(6,2),
	 primary key (id),
	 foreign key (customerId) references customer (id)
	);	
