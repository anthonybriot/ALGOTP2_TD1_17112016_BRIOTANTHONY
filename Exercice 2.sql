/*Création du schéma*/

create schema MAGASIN;

/*La table CLIENT*/

create table CLIENT ( ID_CLIENT char (10) not null,

                      NOM char (12) not null,
					  
					  PRENOM char (12) not null,
					  
					  ADRESSE char (40) not null,

             primary key (ID_CLIENT));
			 

/*La table PRODUIT*/
			 
			 
create table PRODUIT (	CODE_PRODUIT decimal (20) not null,
						
						LIBELLE decimal (20) not null,
						
						PRIX decimal (20) not null,
						
			primary key (CODE_PRODUIT));
			
			
/*La table COMMANDE*/

create table COMMANDE (	ID_COMMANDE decimal (20) not null,

						DATE date not null,
						
						ID_CLIENT decimal (10) not null,
						
						ADRESSE_DE_LIVRAISON char (40) not null,
						
						QUANTITE_PRODUIT int not null,
						
						CODE_PRODUIT decimal (20) not null,
						
			primary key (ID_COMMANDE,ID_CLIENT),
			
			foreign key (ID_CLIENT) references CLIENT
			 
				on delete no action on update cascade,
				
			foreign key (CODE_PRODUIT) references PRODUIT,
			
				on delete no action on update cascade)
				
						
/*index*/

create index XDATE on COMMANDE(DATE);						
			
			
			 
			 