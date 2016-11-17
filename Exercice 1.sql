create schema BANQUE;

create dbspace SP_CLIENT;

create dbspace SP_COMPTE;

/*La table COMPTE*/

create table COMPTE ( 	ID_COMPTE decimal (20) not null,

                       SOLDE decimal (40) not null,

             primary key (ID_COMPTE))

             in SP_COMPTE;
			 
/*Les tables RETRAIT et DEPOT*/


create table RETRAIT ( ID_RETRAIT decimal (20) not null,

						ID_COMPTE decimal (20) not null,

						DATE date not null,
					  
						MONTANT decimal (40) not null,

             primary key (ID_RETRAIT,ID_COMPTE),
			 
			 foreign key (ID_COMPTE) references COMPTE
			 
				on delete no action on update cascade)

             in SP_COMPTE;
			 
			 
create table DEPOT 	( 	ID_DEPOT decimal (20) not null,

						ID_COMPTE decimal (20) not null,

						DATE date not null,
					  
						MONTANT decimal (40) not null,

             primary key (ID_DEPOT,ID_COMPTE),
			 
			 foreign key (ID_COMPTE) references COMPTE
			 
				on delete no action on update cascade)

             in SP_COMPTE;
			 

/*Les tables CLIENT ET POSSESSION*/

create table CLIENT ( ID_CLIENT decimal (10) not null,

                      NOM char (12) not null,
					  
					  PRENOM char (12) not null,
					  
					  ADRESSE char (40) not null,

             primary key (ID_CLIENT))
			 
			 in SP_CLIENT;
			 
create table POSSESSION (	ID_POSSESSION decimal (20) not null,

							ID_CLIENT decimal (10) not null,

							ID_COMPTE decimal (20) not null,

             primary key (ID_POSSESSION,ID_CLIENT,ID_COMPTE),
			 
			 foreign key (ID_CLIENT) references CLIENT
			 
				on delete no action on update cascade,
			
			foreign key (ID_COMPTE) references COMPTE
				
				on delete no action on update cascade);
				
				
/*index*/

create index XPOSS on POSSESSION(ID_CLIENT,ID_COMPTE);
