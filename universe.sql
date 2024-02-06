--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comets (
    name character varying(30),
    comets_id integer NOT NULL,
    is_periodic boolean DEFAULT false NOT NULL
);


ALTER TABLE public.comets OWNER TO freecodecamp;

--
-- Name: comets_comets_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comets_comets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comets_comets_id_seq OWNER TO freecodecamp;

--
-- Name: comets_comets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comets_comets_id_seq OWNED BY public.comets.comets_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    age_in_millions_of_years integer,
    distance_from_earth integer,
    temperature numeric(5,1),
    color text,
    is_spherical boolean,
    has_life boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30),
    age_in_millions_of_years integer,
    distance_from_earth integer,
    temperature numeric(5,1),
    color text,
    is_spherical boolean,
    has_life boolean NOT NULL,
    planet_id integer,
    moon_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    age_in_millions_of_years integer,
    distance_from_earth integer,
    temperature numeric(5,1),
    color text,
    is_spherical boolean,
    has_life boolean NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    age_in_millions_of_years integer,
    distance_from_earth integer,
    temperature numeric(5,1),
    color text,
    is_spherical boolean,
    has_life boolean NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comets comets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets ALTER COLUMN comets_id SET DEFAULT nextval('public.comets_comets_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comets VALUES ('Comet Hale–Bopp', 2, false);
INSERT INTO public.comets VALUES ('Halleys Comet', 1, true);
INSERT INTO public.comets VALUES ('81P/Wild', 3, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 1000, 3, 1000.9, 'clear', true, false);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 4000, 0, 500.1, 'clear', true, false);
INSERT INTO public.galaxy VALUES (3, 'Virgo', 14000, 0, 5000.1, 'clear', true, false);
INSERT INTO public.galaxy VALUES (4, 'Cartwheel', 700, 23, 1900.1, 'purple', true, false);
INSERT INTO public.galaxy VALUES (5, 'Sunflower', 830, 38, 190.1, 'blue', true, false);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 467, 91, 39.1, 'red', true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Our moon', 4530, 0, 11.3, 'grey', true, false, 1, 1);
INSERT INTO public.moon VALUES ('Phobos', 4530, 0, 11.3, 'green', true, false, 3, 2);
INSERT INTO public.moon VALUES ('Deimos', 4530, 0, 11.3, 'blue-green', true, false, 3, 3);
INSERT INTO public.moon VALUES ('Enceladus', 124, 1, 1.3, 'white', true, false, 6, 4);
INSERT INTO public.moon VALUES ('Titan', 124, 1, 1.3, 'blue-green', true, false, 6, 5);
INSERT INTO public.moon VALUES ('Ganymede', 124, 1, 1.3, 'white', true, false, 5, 6);
INSERT INTO public.moon VALUES ('Albiorix', 134, 1, 1.3, 'unknown', true, false, 5, 7);
INSERT INTO public.moon VALUES ('Erriapus', 134, 1, 1.3, 'unknown', true, false, 5, 8);
INSERT INTO public.moon VALUES ('Jarnsaxa', 134, 1, 1.3, 'unknown', true, false, 5, 9);
INSERT INTO public.moon VALUES ('Narvi', 134, 1, 1.3, 'unknown', true, false, 5, 10);
INSERT INTO public.moon VALUES ('Hyperion', 134, 1, 1.3, 'unknown', true, false, 5, 11);
INSERT INTO public.moon VALUES ('Farbauti', 134, 1, 1.3, 'unknown', true, false, 5, 12);
INSERT INTO public.moon VALUES ('Loge', 134, 1, 1.3, 'unknown', true, false, 5, 13);
INSERT INTO public.moon VALUES ('Surtur', 134, 1, 1.3, 'unknown', true, false, 5, 14);
INSERT INTO public.moon VALUES ('Cyllene', 134, 1, 1.3, 'red', true, false, 5, 15);
INSERT INTO public.moon VALUES ('Herse', 134, 1, 1.3, 'Brown', false, false, 5, 16);
INSERT INTO public.moon VALUES ('Callisto', 134, 1, 1.3, 'unknown', true, false, 5, 17);
INSERT INTO public.moon VALUES ('Thrymr', 134, 1, 1.3, 'unknown', true, false, 5, 18);
INSERT INTO public.moon VALUES ('Greip', 134, 1, 1.3, 'unknown', true, false, 5, 19);
INSERT INTO public.moon VALUES ('Suttungr', 134, 1, 1.3, 'unknown', true, false, 5, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 2000, 0, 1.0, 'Blue', true, true, 2);
INSERT INTO public.planet VALUES (2, 'Mercury', 2000, 0, 1.0, 'Green', true, false, 2);
INSERT INTO public.planet VALUES (3, 'Mars', 2000, 0, 1.0, 'Red', true, false, 2);
INSERT INTO public.planet VALUES (4, 'Venus', 2000, 0, 4.0, 'Blue-Green', true, false, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 2020, 0, 7.0, 'Orange', true, false, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 2120, 0, 9.0, 'Yellow', true, false, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 2031, 0, 20.0, 'Yellow', true, false, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 2131, 1, 23.0, 'Blue', true, false, 2);
INSERT INTO public.planet VALUES (9, 'X313-AB', 22131, 100, 235.0, 'Grey', true, false, 4);
INSERT INTO public.planet VALUES (10, 'X233-AB', 22931, 103, 935.0, 'White', true, false, 4);
INSERT INTO public.planet VALUES (11, 'X233-AD', 22931, 103, 935.0, 'White', true, false, 4);
INSERT INTO public.planet VALUES (12, 'BCYZ-AD', 22931, 103, 935.0, 'White', true, false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Mirach', 10, 3, 100.9, 'orange', true, false, 1);
INSERT INTO public.star VALUES (2, 'Sun', 4600, 0, 10.1, 'yellow', true, false, 2);
INSERT INTO public.star VALUES (3, 'Epsilon Virginis', 6900, 0, 9999.1, 'blue-green', true, false, 3);
INSERT INTO public.star VALUES (4, 'Bayer', 2389, 234, 4899.1, 'blue', true, false, 4);
INSERT INTO public.star VALUES (5, 'HD', 1281, 249, 456.1, 'White', true, false, 4);
INSERT INTO public.star VALUES (6, 'chara', 14661, 184, 943.1, 'White', true, false, 5);


--
-- Name: comets_comets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comets_comets_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: comets comets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT comets_pkey PRIMARY KEY (comets_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comets unique_comets; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT unique_comets UNIQUE (name);


--
-- Name: galaxy unique_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy UNIQUE (name);


--
-- Name: moon unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon UNIQUE (name);


--
-- Name: planet unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet UNIQUE (name);


--
-- Name: star unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star UNIQUE (name);


--
-- Name: moon moon_revolves_around_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_revolves_around_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_revolves_around_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_revolves_around_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_is_in_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_is_in_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

