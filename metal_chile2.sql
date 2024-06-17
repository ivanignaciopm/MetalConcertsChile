--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Ubuntu 16.0-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.0 (Ubuntu 16.0-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: band; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.band (
    name character varying(20) NOT NULL,
    foundation_year integer NOT NULL,
    genre_id integer,
    country_id integer NOT NULL,
    band_id integer NOT NULL
);


ALTER TABLE public.band OWNER TO postgres;

--
-- Name: band_band_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.band_band_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.band_band_id_seq OWNER TO postgres;

--
-- Name: band_band_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.band_band_id_seq OWNED BY public.band.band_id;


--
-- Name: band_concert; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.band_concert (
    band_id integer NOT NULL,
    concert_id integer NOT NULL
);


ALTER TABLE public.band_concert OWNER TO postgres;

--
-- Name: concert; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.concert (
    date date NOT NULL,
    concert_id integer NOT NULL,
    venue_id integer,
    concert_name character varying(50) NOT NULL
);


ALTER TABLE public.concert OWNER TO postgres;

--
-- Name: concert_column_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.concert_column_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.concert_column_id_seq OWNER TO postgres;

--
-- Name: concert_column_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.concert_column_id_seq OWNED BY public.concert.concert_id;


--
-- Name: concert_genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.concert_genre (
    concert_id integer NOT NULL,
    genre_id integer NOT NULL
);


ALTER TABLE public.concert_genre OWNER TO postgres;

--
-- Name: countries_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.countries_country_id_seq OWNER TO postgres;

--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    country_id integer DEFAULT nextval('public.countries_country_id_seq'::regclass) NOT NULL,
    country character varying(20)
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: genre_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genre_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genre_genre_id_seq OWNER TO postgres;

--
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    genre_id integer DEFAULT nextval('public.genre_genre_id_seq'::regclass) NOT NULL,
    genre character varying(50)
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- Name: musician; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.musician (
    name character varying NOT NULL,
    birth_date date NOT NULL,
    country_id integer,
    principal_instrument character varying,
    musician_id integer NOT NULL,
    band_id integer
);


ALTER TABLE public.musician OWNER TO postgres;

--
-- Name: musician_musician_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.musician_musician_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.musician_musician_id_seq OWNER TO postgres;

--
-- Name: musician_musician_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.musician_musician_id_seq OWNED BY public.musician.musician_id;


--
-- Name: venues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venues (
    name character varying NOT NULL,
    location character varying NOT NULL,
    venue_id integer NOT NULL
);


ALTER TABLE public.venues OWNER TO postgres;

--
-- Name: venues_venue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venues_venue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.venues_venue_id_seq OWNER TO postgres;

--
-- Name: venues_venue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venues_venue_id_seq OWNED BY public.venues.venue_id;


--
-- Name: band band_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.band ALTER COLUMN band_id SET DEFAULT nextval('public.band_band_id_seq'::regclass);


--
-- Name: concert concert_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concert ALTER COLUMN concert_id SET DEFAULT nextval('public.concert_column_id_seq'::regclass);


--
-- Name: musician musician_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musician ALTER COLUMN musician_id SET DEFAULT nextval('public.musician_musician_id_seq'::regclass);


--
-- Name: venues venue_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venues ALTER COLUMN venue_id SET DEFAULT nextval('public.venues_venue_id_seq'::regclass);


--
-- Data for Name: band; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.band (name, foundation_year, genre_id, country_id, band_id) FROM stdin;
Dream Theater	1985	7	1	1
Kreator	1982	1	7	2
Blind Guardian	1984	5	7	3
Helloween	1984	5	7	4
Cannibal Corpse	1988	3	1	5
Dimmu Borgir	1993	4	13	6
Behemoth	1991	4	23	7
Gojira	1996	1	16	8
Mastodon	2000	6	1	9
Testament	1983	1	1	10
Cradle of Filth	1991	4	2	11
In Flames	1990	7	5	12
Metallica	1981	1	1	13
Iron Maiden	1975	3	2	14
Slayer	1981	1	1	15
Megadeth	1983	1	1	16
Anthrax	1981	1	1	17
Nightwish	1996	4	12	18
Opeth	1989	7	5	19
Amon Amarth	1992	10	5	20
Arch Enemy	1995	5	5	21
Rammstein	1994	8	7	22
Sepultura	1984	1	9	23
Lacuna Coil	1994	8	15	24
Black Sabbath	1968	2	2	25
\.


--
-- Data for Name: band_concert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.band_concert (band_id, concert_id) FROM stdin;
\.


--
-- Data for Name: concert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.concert (date, concert_id, venue_id, concert_name) FROM stdin;
2009-01-01	1	41	Iron Maiden
2010-01-01	2	41	Metallica
2010-01-01	3	2	Megadeth
2011-01-01	4	40	Slayer
2013-01-01	5	40	Black Sabbath
2018-01-01	6	1	Judas Priest
2019-01-01	7	40	Kiss
2014-01-01	8	1	Dream Theater
2013-01-01	9	2	Anthrax
2011-01-01	10	1	Mötley Crüe
\.


--
-- Data for Name: concert_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.concert_genre (concert_id, genre_id) FROM stdin;
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (country_id, country) FROM stdin;
1	USA
2	UK
3	Chile
4	Netherlands
5	Sweden
6	Canada
7	Germany
8	Australia
9	Brazil
10	Argentina
11	Spain
12	Finland
13	Norway
14	Denmark
15	Italy
16	France
17	Ireland
18	Mexico
19	Japan
20	South Korea
21	Belgium
23	Colombia
\.


--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genre (genre_id, genre) FROM stdin;
1	Thrash Metal
2	Heavy Metal/Doom Metal
3	NWOBHM
4	Symphonic Metal
5	Groove Metal
6	Death Metal
7	Black Metal
8	Power Metal
9	Progressive Metal
10	Gothic Metal
11	Folk Metal
12	Sludge Metal
13	Stoner Metal
14	Industrial Metal
15	Alternative Metal
16	Nu Metal
17	Metalcore
18	Deathcore
19	Grindcore
20	Post-Metal
21	Djent
22	Melodic Death Metal
23	Technical Death Metal
24	Viking Metal
25	Pirate Metal
26	Neo-Classical Metal
27	Christian Metal
28	Avant-Garde Metal
29	Atmospheric Black Metal
30	Depressive Black Metal
31	War Metal
\.


--
-- Data for Name: musician; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.musician (name, birth_date, country_id, principal_instrument, musician_id, band_id) FROM stdin;
Scott Ian	1963-12-31	1	Rhythm Guitar	45	17
Charlie Benante	1962-11-27	1	Drums	46	17
Frank Bello	1965-07-09	1	Bass	47	17
Joey Belladonna	1960-10-13	1	Vocals	48	17
Jon Donais	1976-04-29	1	Lead Guitar	49	17
Bruce Dickinson	1958-08-07	2	Vocals	50	14
Steve Harris	1956-03-12	2	Bass	51	14
Dave Murray	1956-12-23	2	Guitar	52	14
Adrian Smith	1957-02-27	2	Guitar	53	14
Janick Gers	1957-01-27	2	Guitar	54	14
Nicko McBrain	1952-06-05	2	Drums	55	14
David Ellefson	1964-11-12	1	Bass	56	16
Kiko Loureiro	1972-06-16	1	Guitar	57	16
Dirk Verbeuren	1975-01-31	1	Drums	58	16
Gary Holt	1964-05-04	1	Guitar	61	15
Paul Bostaph	1964-03-06	1	Drums	62	15
James Hetfield	1963-08-03	1	Vocals/Guitar	1	13
Lars Ulrich	1963-12-26	1	Drums	2	13
Dave Mustaine	1961-09-13	1	Vocals/Guitar	3	16
Tom Araya	1961-06-06	1	Vocals/Bass	4	15
Kerry King	1964-06-03	1	Guitar	5	15
Tuomas Holopainen	1976-12-25	12	Keyboards	6	18
Mikael Åkerfeldt	1974-04-17	5	Vocals/Guitar	7	19
Johan Hegg	1973-04-29	5	Vocals	8	20
Michael Amott	1969-07-28	5	Guitar	9	21
Till Lindemann	1963-01-04	7	Vocals	10	22
Max Cavalera	1969-08-04	9	Vocals/Guitar	11	23
Cristina Scabbia	1972-06-06	15	Vocals	12	24
John Petrucci	1967-07-12	1	Guitar	13	1
Mille Petrozza	1966-12-18	7	Vocals/Guitar	14	2
Hansi Kürsch	1966-08-10	7	Vocals	15	3
Andi Deris	1964-08-18	7	Vocals	16	4
George "Corpsegrinder" Fisher	1970-07-08	1	Vocals	17	5
Shagrath	1976-11-18	13	Vocals	18	6
Nergal	1977-06-05	23	Vocals/Guitar	19	7
Joe Duplantier	1976-10-19	16	Vocals/Guitar	20	8
Brann Dailor	1975-03-19	1	Drums	21	9
Chuck Billy	1962-06-23	1	Vocals	22	10
Jordan Rudess	1956-11-04	1	Keyboards	28	1
James LaBrie	1963-05-05	1	Vocals	29	1
John Myung	1967-01-24	1	Bass	30	1
Mike Mangini	1963-04-18	1	Drums	31	1
Sami Yli-Sirniö	1973-04-19	12	Guitar	33	2
Christian Giesler	1970-11-18	7	Bass	34	2
Jürgen "Ventor" Reil	1966-06-26	7	Drums	35	2
André Olbrich	1968-05-03	7	Guitar	37	3
Marcus Siepen	1970-01-08	7	Guitar	38	3
Frederik Ehmke	1978-05-28	7	Drums	39	3
Michael Weikath	1962-08-07	7	Guitar	41	4
Sascha Gerstner	1977-04-02	7	Guitar	42	\N
Markus Grosskopf	1965-09-21	7	Bass	43	\N
Dani Löble	1973-03-22	7	Drums	44	\N
\.


--
-- Data for Name: venues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venues (name, location, venue_id) FROM stdin;
Movistar Arena	Santiago	1
Teatro Caupolicán	Santiago	2
Blondie	Santiago	3
Club Chocolate	Santiago	4
Rock y Guitarras	Santiago	5
Bar de René	Santiago	6
La Batuta	Santiago	7
Teatro Municipal de Valparaíso	Valparaíso	8
El Huevo	Valparaíso	9
Club Kmasú Premiere	Santiago	10
Teatro Coliseo	Santiago, Chile	11
Teatro Nescafé de las Artes	Santiago, Chile	12
Thelonious	Santiago, Chile	13
Club Subterraneo	Santiago, Chile	14
Sala SCD - Bellavista	Santiago, Chile	15
Estadio Bicentenario Municipal de La Florida	Santiago, Chile	16
Club Amanda	Santiago, Chile	17
Club La Feria	Santiago, Chile	18
Matucana 100	Santiago, Chile	19
Club Chocolate	Santiago, Chile	20
Salón del Mambo	Santiago, Chile	21
Teatro Teletón	Santiago, Chile	22
Blondie	Santiago, Chile	23
Sala Metrónomo	Santiago, Chile	24
Warehouse Chile	Santiago, Chile	25
El Manduca	Santiago, Chile	26
Espacio Riesco	Santiago, Chile	27
Teatro Caupolicán	Santiago, Chile	28
Sala Faq Records San Diego	Santiago, Chile	29
Chocolate Club	Santiago, Chile	30
Club Ámbar	Santiago, Chile	31
Arena Recoleta	Santiago, Chile	32
House of Rock & Blues	Santiago, Chile	33
Sala SCD Egaña	Santiago, Chile	34
Hipódromo Chile	Santiago, Chile	35
Bar El Clan	Santiago, Chile	36
naula magna liceo manuel de salas	Santiago, Chile	37
Crearock	Santiago, Chile	38
Estadio Nacional	Santiago	40
Club Hípico	Santiago	41
\.


--
-- Name: band_band_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.band_band_id_seq', 25, true);


--
-- Name: concert_column_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.concert_column_id_seq', 10, true);


--
-- Name: countries_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_country_id_seq', 23, true);


--
-- Name: genre_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genre_genre_id_seq', 31, true);


--
-- Name: musician_musician_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.musician_musician_id_seq', 62, true);


--
-- Name: venues_venue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.venues_venue_id_seq', 42, true);


--
-- Name: band_concert band_concert_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.band_concert
    ADD CONSTRAINT band_concert_pkey PRIMARY KEY (band_id, concert_id);


--
-- Name: band band_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.band
    ADD CONSTRAINT band_id_unique UNIQUE (band_id);


--
-- Name: band band_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.band
    ADD CONSTRAINT band_pkey PRIMARY KEY (name, foundation_year, country_id);


--
-- Name: concert_genre concert_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concert_genre
    ADD CONSTRAINT concert_genre_pkey PRIMARY KEY (concert_id, genre_id);


--
-- Name: concert concert_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concert
    ADD CONSTRAINT concert_id_unique UNIQUE (concert_id);


--
-- Name: countries countries_country_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_country_key UNIQUE (country);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);


--
-- Name: genre genre_genre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_genre_key UNIQUE (genre);


--
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genre_id);


--
-- Name: musician musician_musician_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musician
    ADD CONSTRAINT musician_musician_id_key UNIQUE (musician_id);


--
-- Name: musician musician_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musician
    ADD CONSTRAINT musician_pkey PRIMARY KEY (name, birth_date);


--
-- Name: concert pk_concert; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concert
    ADD CONSTRAINT pk_concert PRIMARY KEY (concert_name, date);


--
-- Name: countries unique_country_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT unique_country_id UNIQUE (country_id);


--
-- Name: genre unique_genre_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT unique_genre_id UNIQUE (genre_id);


--
-- Name: venues venues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venues
    ADD CONSTRAINT venues_pkey PRIMARY KEY (name, location);


--
-- Name: venues venues_venue_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venues
    ADD CONSTRAINT venues_venue_id_key UNIQUE (venue_id);


--
-- Name: band_concert band_concert_band_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.band_concert
    ADD CONSTRAINT band_concert_band_id_fkey FOREIGN KEY (band_id) REFERENCES public.band(band_id);


--
-- Name: band_concert band_concert_concert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.band_concert
    ADD CONSTRAINT band_concert_concert_id_fkey FOREIGN KEY (concert_id) REFERENCES public.concert(concert_id);


--
-- Name: band band_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.band
    ADD CONSTRAINT band_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(country_id);


--
-- Name: band band_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.band
    ADD CONSTRAINT band_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genre(genre_id);


--
-- Name: concert_genre concert_genre_concert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concert_genre
    ADD CONSTRAINT concert_genre_concert_id_fkey FOREIGN KEY (concert_id) REFERENCES public.concert(concert_id);


--
-- Name: concert_genre concert_genre_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concert_genre
    ADD CONSTRAINT concert_genre_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genre(genre_id);


--
-- Name: concert concert_venue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concert
    ADD CONSTRAINT concert_venue_id_fkey FOREIGN KEY (venue_id) REFERENCES public.venues(venue_id);


--
-- Name: musician fk_country_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musician
    ADD CONSTRAINT fk_country_id FOREIGN KEY (country_id) REFERENCES public.countries(country_id);


--
-- Name: musician musician_band_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musician
    ADD CONSTRAINT musician_band_id_fkey FOREIGN KEY (band_id) REFERENCES public.band(band_id);


--
-- Name: musician musician_country_of_origin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musician
    ADD CONSTRAINT musician_country_of_origin_fkey FOREIGN KEY (country_id) REFERENCES public.countries(country_id);


--
-- PostgreSQL database dump complete
--

