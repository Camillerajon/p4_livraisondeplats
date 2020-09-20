
CREATE SEQUENCE public.client_id_seq;

CREATE TABLE public.client (
                id INTEGER NOT NULL DEFAULT nextval('public.client_id_seq'),
                nom VARCHAR(100) NOT NULL,
                email VARCHAR(100) NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                telephone INTEGER NOT NULL,
                adresse VARCHAR(1000) NOT NULL,
                CONSTRAINT client_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;

CREATE SEQUENCE public.livreur_id_seq;

CREATE TABLE public.livreur (
                id INTEGER NOT NULL DEFAULT nextval('public.livreur_id_seq'),
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                telephone INTEGER NOT NULL,
                statut VARCHAR(100) NOT NULL,
                position INTEGER NOT NULL,
                CONSTRAINT livreur_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.livreur_id_seq OWNED BY public.livreur.id;

CREATE SEQUENCE public.commande_numero_seq;

CREATE SEQUENCE public.commande_livreur_id_seq;

CREATE TABLE public.commande (
                numero INTEGER NOT NULL DEFAULT nextval('public.commande_numero_seq'),
                quantite INTEGER NOT NULL,
                date TIMESTAMP NOT NULL,
                prix REAL NOT NULL,
                statut VARCHAR(100) NOT NULL,
                livreur_id INTEGER NOT NULL DEFAULT nextval('public.commande_livreur_id_seq'),
                client_id INTEGER NOT NULL,
                CONSTRAINT commande_pk PRIMARY KEY (numero)
);


ALTER SEQUENCE public.commande_numero_seq OWNED BY public.commande.numero;

ALTER SEQUENCE public.commande_livreur_id_seq OWNED BY public.commande.livreur_id;

CREATE SEQUENCE public.plat_id_seq;

CREATE TABLE public.plat (
                id INTEGER NOT NULL DEFAULT nextval('public.plat_id_seq'),
                nom VARCHAR(100) NOT NULL,
                prix REAL NOT NULL,
                categorie VARCHAR(100) NOT NULL,
                description VARCHAR(1000) NOT NULL,
                quantite INTEGER NOT NULL,
                CONSTRAINT plat_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.plat_id_seq OWNED BY public.plat.id;

CREATE SEQUENCE public.plat_plat_jour_id_seq;

CREATE TABLE public.plat_jour (
                plat_id INTEGER NOT NULL DEFAULT nextval('public.plat_plat_jour_id_seq'),
                date DATE NOT NULL,
                quantite INTEGER NOT NULL,
                CONSTRAINT plat_jour_pk PRIMARY KEY (plat_id)
);


ALTER SEQUENCE public.plat_plat_jour_id_seq OWNED BY public.plat_jour.plat_id;

CREATE SEQUENCE public.plat_jour_plat_id_seq;

CREATE TABLE public.commande_plat_jour (
                plat_id INTEGER NOT NULL DEFAULT nextval('public.plat_jour_plat_id_seq'),
                commande_numero INTEGER NOT NULL,
                quantite INTEGER NOT NULL,
                CONSTRAINT commande_plat_jour_pk PRIMARY KEY (plat_id, commande_numero)
);


ALTER SEQUENCE public.plat_jour_plat_id_seq OWNED BY public.commande_plat_jour.plat_id;

CREATE SEQUENCE public.livreur_plat_jour_livreur_id_seq;

CREATE TABLE public.livreur_plat_jour (
                plat_id INTEGER NOT NULL,
                livreur_id INTEGER NOT NULL DEFAULT nextval('public.livreur_plat_jour_livreur_id_seq'),
                date INTEGER NOT NULL,
                quantite INTEGER NOT NULL,
                CONSTRAINT livreur_plat_jour_pk PRIMARY KEY (plat_id, livreur_id)
);


ALTER SEQUENCE public.livreur_plat_jour_livreur_id_seq OWNED BY public.livreur_plat_jour.livreur_id;

ALTER TABLE public.commande ADD CONSTRAINT client_commande_fk
FOREIGN KEY (client_id)
REFERENCES public.client (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.livreur_plat_jour ADD CONSTRAINT livreur_livreur_plat_jour_fk
FOREIGN KEY (livreur_id)
REFERENCES public.livreur (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT livreur_commande_fk
FOREIGN KEY (livreur_id)
REFERENCES public.livreur (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande_plat_jour ADD CONSTRAINT commande_commande_plat_jour_fk
FOREIGN KEY (commande_numero)
REFERENCES public.commande (numero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.plat_jour ADD CONSTRAINT plat_plat_jour_fk
FOREIGN KEY (plat_id)
REFERENCES public.plat (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.livreur_plat_jour ADD CONSTRAINT plat_jour_livreur_plat_jour_fk
FOREIGN KEY (plat_id)
REFERENCES public.plat_jour (plat_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande_plat_jour ADD CONSTRAINT plat_jour_commande_plat_jour_fk
FOREIGN KEY (plat_id)
REFERENCES public.plat_jour (plat_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
