CREATE TABLE if not exists Clienti(Numero_Cliente SERIAL PRIMARY KEY,
				 Nome VARCHAR NOT NULL,
					 Cognome VARCHAR NOT NULL,
					 Data_Nascita DATE NOT NULL,
					 Regione_Residenza VARCHAR NOT NULL);
					 
create table if not exists Fornitori(
	numero_fornitore serial primary key,
	denominazione varchar not null,
	regione_residenza varchar not null


);			   
CREATE TABLE if not exists Fatture(
	Numero_Fattura SERIAL PRIMARY KEY,
	Tipologia VARCHAR NOT NULL,
	Importo decimal NOT NULL,
	Iva VARCHAR NOT NULL default'20%',
	Id_Cliente int8 NOT NULL,
	Data_Fattura date not null,
	numero_fornitore int8 not null,
	
	CONSTRAINT Fatture_Clienti_FK foreign key (Id_Cliente)references Clienti(Numero_Cliente), 
	CONSTRAINT Fatture_Fornitori_FK foreign key (Numero_Fornitore)references Fornitori(numero_fornitore) 
	
);

create table if not exists Prodotti(
	id_prodotto serial primary key,
	descizione varchar not null,
	in_produzione boolean not null default'false',
	in_commercio varchar not null  default'false',
	data_attivazione date not null,
	data_disattivazione date not null
	
	
);

insert into Clienti (nome,cognome,data_nascita,regione_residenza)
	values('Mario','Rossi','1992/07/11','Tortora'),
	('Marco','La Gamma','1991/04/23','Rotonda'),
	('Silvia','La Gala','1980/05/19','Roma');
	
insert into Fornitori(
	denominazione,
	regione_residenza )values('Epicode s.r.l.','Calabria'),
	('Assicurazioni','Basilicata'),
	('Epicode','Lazio');
	
select nome,cognome FROM Clienti where extract (year from Data_Nascita)= '1992';
select * from Fornitori ;