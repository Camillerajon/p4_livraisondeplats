--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-05-18 17:53:17

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE foodexpress;
--
-- TOC entry 2904 (class 1262 OID 16438)
-- Name: foodexpress; Type: DATABASE; Schema: -; Owner: adm_foodexpress
--

CREATE DATABASE foodexpress WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';


ALTER DATABASE foodexpress OWNER TO adm_foodexpress;

\connect foodexpress

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 18113)
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id integer NOT NULL,
    nom character varying NOT NULL,
    email character varying(100) NOT NULL,
    prenom character varying(100) NOT NULL,
    telephone integer NOT NULL,
    adresse character varying(1000) NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 18111)
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_id_seq OWNER TO postgres;

--
-- TOC entry 2905 (class 0 OID 0)
-- Dependencies: 202
-- Name: client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;


--
-- TOC entry 208 (class 1259 OID 18139)
-- Name: commande; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commande (
    numero integer NOT NULL,
    quantite integer NOT NULL,
    date timestamp without time zone NOT NULL,
    prix real NOT NULL,
    statut character varying(100) NOT NULL,
    livreur_id integer NOT NULL,
    client_id integer NOT NULL
);


ALTER TABLE public.commande OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 18137)
-- Name: commande_livreur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.commande_livreur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commande_livreur_id_seq OWNER TO postgres;

--
-- TOC entry 2906 (class 0 OID 0)
-- Dependencies: 207
-- Name: commande_livreur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.commande_livreur_id_seq OWNED BY public.commande.livreur_id;


--
-- TOC entry 206 (class 1259 OID 18135)
-- Name: commande_numero_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.commande_numero_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commande_numero_seq OWNER TO postgres;

--
-- TOC entry 2907 (class 0 OID 0)
-- Dependencies: 206
-- Name: commande_numero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.commande_numero_seq OWNED BY public.commande.numero;


--
-- TOC entry 214 (class 1259 OID 18167)
-- Name: commande_plat_jour; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commande_plat_jour (
    plat_id integer NOT NULL,
    commande_numero integer NOT NULL,
    quantite integer NOT NULL
);


ALTER TABLE public.commande_plat_jour OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 18129)
-- Name: livreur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.livreur (
    id integer NOT NULL,
    nom character varying(100) NOT NULL,
    prenom character varying(100) NOT NULL,
    telephone numeric NOT NULL,
    statut character varying(100) NOT NULL,
    "position" integer NOT NULL
);


ALTER TABLE public.livreur OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 18127)
-- Name: livreur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.livreur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.livreur_id_seq OWNER TO postgres;

--
-- TOC entry 2908 (class 0 OID 0)
-- Dependencies: 204
-- Name: livreur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.livreur_id_seq OWNED BY public.livreur.id;


--
-- TOC entry 216 (class 1259 OID 18175)
-- Name: livreur_plat_jour; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.livreur_plat_jour (
    plat_id integer NOT NULL,
    livreur_id integer NOT NULL,
    date integer NOT NULL,
    quantite integer NOT NULL
);


ALTER TABLE public.livreur_plat_jour OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 18173)
-- Name: livreur_plat_jour_livreur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.livreur_plat_jour_livreur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.livreur_plat_jour_livreur_id_seq OWNER TO postgres;

--
-- TOC entry 2909 (class 0 OID 0)
-- Dependencies: 215
-- Name: livreur_plat_jour_livreur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.livreur_plat_jour_livreur_id_seq OWNED BY public.livreur_plat_jour.livreur_id;


--
-- TOC entry 210 (class 1259 OID 18148)
-- Name: plat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plat (
    id integer NOT NULL,
    nom character varying(100) NOT NULL,
    prix real NOT NULL,
    categorie character varying(100) NOT NULL,
    description character varying(1000) NOT NULL,
    quantite integer NOT NULL
);


ALTER TABLE public.plat OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 18146)
-- Name: plat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plat_id_seq OWNER TO postgres;

--
-- TOC entry 2910 (class 0 OID 0)
-- Dependencies: 209
-- Name: plat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plat_id_seq OWNED BY public.plat.id;


--
-- TOC entry 212 (class 1259 OID 18159)
-- Name: plat_jour; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plat_jour (
    plat_id integer NOT NULL,
    date date NOT NULL,
    quantite integer NOT NULL
);


ALTER TABLE public.plat_jour OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 18165)
-- Name: plat_jour_plat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plat_jour_plat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plat_jour_plat_id_seq OWNER TO postgres;

--
-- TOC entry 2911 (class 0 OID 0)
-- Dependencies: 213
-- Name: plat_jour_plat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plat_jour_plat_id_seq OWNED BY public.commande_plat_jour.plat_id;


--
-- TOC entry 211 (class 1259 OID 18157)
-- Name: plat_plat_jour_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plat_plat_jour_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plat_plat_jour_id_seq OWNER TO postgres;

--
-- TOC entry 2912 (class 0 OID 0)
-- Dependencies: 211
-- Name: plat_plat_jour_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plat_plat_jour_id_seq OWNED BY public.plat_jour.plat_id;


--
-- TOC entry 2729 (class 2604 OID 18116)
-- Name: client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);


--
-- TOC entry 2731 (class 2604 OID 18142)
-- Name: commande numero; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande ALTER COLUMN numero SET DEFAULT nextval('public.commande_numero_seq'::regclass);


--
-- TOC entry 2732 (class 2604 OID 18143)
-- Name: commande livreur_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande ALTER COLUMN livreur_id SET DEFAULT nextval('public.commande_livreur_id_seq'::regclass);


--
-- TOC entry 2735 (class 2604 OID 18170)
-- Name: commande_plat_jour plat_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande_plat_jour ALTER COLUMN plat_id SET DEFAULT nextval('public.plat_jour_plat_id_seq'::regclass);


--
-- TOC entry 2730 (class 2604 OID 18132)
-- Name: livreur id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livreur ALTER COLUMN id SET DEFAULT nextval('public.livreur_id_seq'::regclass);


--
-- TOC entry 2736 (class 2604 OID 18178)
-- Name: livreur_plat_jour livreur_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livreur_plat_jour ALTER COLUMN livreur_id SET DEFAULT nextval('public.livreur_plat_jour_livreur_id_seq'::regclass);


--
-- TOC entry 2733 (class 2604 OID 18151)
-- Name: plat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plat ALTER COLUMN id SET DEFAULT nextval('public.plat_id_seq'::regclass);


--
-- TOC entry 2734 (class 2604 OID 18162)
-- Name: plat_jour plat_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plat_jour ALTER COLUMN plat_id SET DEFAULT nextval('public.plat_plat_jour_id_seq'::regclass);


--
-- TOC entry 2885 (class 0 OID 18113)
-- Dependencies: 203
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.client (id, nom, email, prenom, telephone, adresse) VALUES (1, 'NOETHER', 'emmynoether@hotmail.fr', 'Emmy', 445859376, '280avenue de la prairie 75018 Paris');
INSERT INTO public.client (id, nom, email, prenom, telephone, adresse) VALUES (2, 'DUPONT', 'dupont.natacha@hotmail.fr', 'Natacha', 445971376, '18b rue de la lumière 75001 Paris');
INSERT INTO public.client (id, nom, email, prenom, telephone, adresse) VALUES (3, 'MALTO', 'laurentmalto@gmail.com', 'Laurent', 442059376, '58 avenue du petit mesnil 75012 Paris');
INSERT INTO public.client (id, nom, email, prenom, telephone, adresse) VALUES (4, 'NICOMA', 'nicoma.simon@hotmail.fr', 'Simon', 444221376, '26 rue Edmond Rostand 75007 Paris');
INSERT INTO public.client (id, nom, email, prenom, telephone, adresse) VALUES (5, 'BONDU', 'laurie.bondu@wanadoo.fr', 'Laurie', 448929376, '154 boulevard de la libération 75004 Paris');


--
-- TOC entry 2890 (class 0 OID 18139)
-- Dependencies: 208
-- Data for Name: commande; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.commande (numero, quantite, date, prix, statut, livreur_id, client_id) VALUES (1001, 1, '2020-05-14 00:00:00', 12.99, 'Livrée', 1, 1);


--
-- TOC entry 2896 (class 0 OID 18167)
-- Dependencies: 214
-- Data for Name: commande_plat_jour; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.commande_plat_jour (plat_id, commande_numero, quantite) VALUES (2, 1001, 1);


--
-- TOC entry 2887 (class 0 OID 18129)
-- Dependencies: 205
-- Data for Name: livreur; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.livreur (id, nom, prenom, telephone, statut, "position") VALUES (1, 'Dubois', 'Franck', 491706388, 'Disponible', 43284202);


--
-- TOC entry 2898 (class 0 OID 18175)
-- Dependencies: 216
-- Data for Name: livreur_plat_jour; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2892 (class 0 OID 18148)
-- Dependencies: 210
-- Data for Name: plat; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.plat (id, nom, prix, categorie, description, quantite) VALUES (1, 'Sauté de porc aux olives', 12.99, 'plat', 'Concentré de saveur, avec une viande revenue avec une sauce comme à la maison', 100);
INSERT INTO public.plat (id, nom, prix, categorie, description, quantite) VALUES (2, 'Risotto aux palourdes', 16.99, 'plat', 'Risotto aux palourdes petits pois et asperge verte', 100);


--
-- TOC entry 2894 (class 0 OID 18159)
-- Dependencies: 212
-- Data for Name: plat_jour; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.plat_jour (plat_id, date, quantite) VALUES (2, '2020-05-14', 2);


--
-- TOC entry 2913 (class 0 OID 0)
-- Dependencies: 202
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_id_seq', 1, false);


--
-- TOC entry 2914 (class 0 OID 0)
-- Dependencies: 207
-- Name: commande_livreur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.commande_livreur_id_seq', 1, false);


--
-- TOC entry 2915 (class 0 OID 0)
-- Dependencies: 206
-- Name: commande_numero_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.commande_numero_seq', 1, false);


--
-- TOC entry 2916 (class 0 OID 0)
-- Dependencies: 204
-- Name: livreur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.livreur_id_seq', 1, true);


--
-- TOC entry 2917 (class 0 OID 0)
-- Dependencies: 215
-- Name: livreur_plat_jour_livreur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.livreur_plat_jour_livreur_id_seq', 1, false);


--
-- TOC entry 2918 (class 0 OID 0)
-- Dependencies: 209
-- Name: plat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plat_id_seq', 1, false);


--
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 213
-- Name: plat_jour_plat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plat_jour_plat_id_seq', 1, false);


--
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 211
-- Name: plat_plat_jour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plat_plat_jour_id_seq', 1, false);


--
-- TOC entry 2738 (class 2606 OID 18121)
-- Name: client client_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pk PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 18145)
-- Name: commande commande_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pk PRIMARY KEY (numero);


--
-- TOC entry 2748 (class 2606 OID 18172)
-- Name: commande_plat_jour commande_plat_jour_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande_plat_jour
    ADD CONSTRAINT commande_plat_jour_pk PRIMARY KEY (plat_id, commande_numero);


--
-- TOC entry 2740 (class 2606 OID 18134)
-- Name: livreur livreur_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livreur
    ADD CONSTRAINT livreur_pk PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 18180)
-- Name: livreur_plat_jour livreur_plat_jour_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livreur_plat_jour
    ADD CONSTRAINT livreur_plat_jour_pk PRIMARY KEY (plat_id, livreur_id);


--
-- TOC entry 2746 (class 2606 OID 18164)
-- Name: plat_jour plat_jour_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plat_jour
    ADD CONSTRAINT plat_jour_pk PRIMARY KEY (plat_id);


--
-- TOC entry 2744 (class 2606 OID 18156)
-- Name: plat plat_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plat
    ADD CONSTRAINT plat_pk PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 18186)
-- Name: commande client_commande_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT client_commande_fk FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 2754 (class 2606 OID 18201)
-- Name: commande_plat_jour commande_commande_plat_jour_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande_plat_jour
    ADD CONSTRAINT commande_commande_plat_jour_fk FOREIGN KEY (commande_numero) REFERENCES public.commande(numero);


--
-- TOC entry 2752 (class 2606 OID 18196)
-- Name: commande livreur_commande_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT livreur_commande_fk FOREIGN KEY (livreur_id) REFERENCES public.livreur(id);


--
-- TOC entry 2756 (class 2606 OID 18191)
-- Name: livreur_plat_jour livreur_livreur_plat_jour_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livreur_plat_jour
    ADD CONSTRAINT livreur_livreur_plat_jour_fk FOREIGN KEY (livreur_id) REFERENCES public.livreur(id);


--
-- TOC entry 2755 (class 2606 OID 18216)
-- Name: commande_plat_jour plat_jour_commande_plat_jour_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande_plat_jour
    ADD CONSTRAINT plat_jour_commande_plat_jour_fk FOREIGN KEY (plat_id) REFERENCES public.plat_jour(plat_id);


--
-- TOC entry 2757 (class 2606 OID 18211)
-- Name: livreur_plat_jour plat_jour_livreur_plat_jour_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livreur_plat_jour
    ADD CONSTRAINT plat_jour_livreur_plat_jour_fk FOREIGN KEY (plat_id) REFERENCES public.plat_jour(plat_id);


--
-- TOC entry 2753 (class 2606 OID 18206)
-- Name: plat_jour plat_plat_jour_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plat_jour
    ADD CONSTRAINT plat_plat_jour_fk FOREIGN KEY (plat_id) REFERENCES public.plat(id);


--
-- TOC entry 1730 (class 826 OID 18268)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: adm_foodexpress
--

ALTER DEFAULT PRIVILEGES FOR ROLE adm_foodexpress GRANT ALL ON TABLES  TO PUBLIC;


-- Completed on 2020-05-18 17:53:17

--
-- PostgreSQL database dump complete
--

