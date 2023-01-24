--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    radius_in_light_years integer NOT NULL,
    discovered_in_year integer,
    galaxy_type text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_sr_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_sr_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_sr_seq OWNER TO freecodecamp;

--
-- Name: galaxy_sr_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_sr_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_in_kilometers integer,
    is_spherical boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_sr_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_sr_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_sr_seq OWNER TO freecodecamp;

--
-- Name: moon_sr_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_sr_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    star_id integer,
    has_life boolean,
    is_dwarf boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_sr_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_sr_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_sr_seq OWNER TO freecodecamp;

--
-- Name: planet_sr_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_sr_seq OWNED BY public.planet.planet_id;


--
-- Name: rockets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.rockets (
    rockets_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.rockets OWNER TO freecodecamp;

--
-- Name: rockets_rockets_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.rockets_rockets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rockets_rockets_id_seq OWNER TO freecodecamp;

--
-- Name: rockets_rockets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.rockets_rockets_id_seq OWNED BY public.rockets.rockets_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer NOT NULL,
    radius_in_millions_of_km numeric,
    spectral_type text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_sr_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_sr_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_sr_seq OWNER TO freecodecamp;

--
-- Name: star_sr_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_sr_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_sr_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_sr_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_sr_seq'::regclass);


--
-- Name: rockets rockets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rockets ALTER COLUMN rockets_id SET DEFAULT nextval('public.rockets_rockets_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_sr_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Antromeda', 110000, 965, 'spiral');
INSERT INTO public.galaxy VALUES (2, 'Triangulum Galaxy', 30000, 1654, 'spiral');
INSERT INTO public.galaxy VALUES (3, 'Milky Way', 52850, 1610, 'spiral');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 30000, 1773, 'spiral');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 25000, 1781, 'spiral');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 85000, 1781, 'spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737, true, 3);
INSERT INTO public.moon VALUES (2, 'Deimos', 6, false, 4);
INSERT INTO public.moon VALUES (3, 'Phobos', 11, false, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 2634, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1560, true, 5);
INSERT INTO public.moon VALUES (6, 'Adrastea', 8, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 2410, true, 5);
INSERT INTO public.moon VALUES (8, 'Io', 1821, true, 5);
INSERT INTO public.moon VALUES (9, 'Dia', 2, true, 5);
INSERT INTO public.moon VALUES (10, 'Titan', 2574, true, 6);
INSERT INTO public.moon VALUES (11, 'Enceladus', 252, true, 6);
INSERT INTO public.moon VALUES (12, 'Atlas', 15, false, 6);
INSERT INTO public.moon VALUES (13, 'Calypso', 11, false, 6);
INSERT INTO public.moon VALUES (14, 'Dione', 561, true, 6);
INSERT INTO public.moon VALUES (15, 'Epimetheus', 58, false, 6);
INSERT INTO public.moon VALUES (16, 'Helene', 18, false, 6);
INSERT INTO public.moon VALUES (17, 'Ariel', 578, true, 7);
INSERT INTO public.moon VALUES (18, 'Oberon', 761, true, 7);
INSERT INTO public.moon VALUES (19, 'Tritan', 1353, true, 8);
INSERT INTO public.moon VALUES (20, 'Charon', 606, true, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'closest to sun', 4, false, false);
INSERT INTO public.planet VALUES (2, 'Venus', 'hottest planet in solar systen', 4, false, false);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our Home', 4, true, false);
INSERT INTO public.planet VALUES (4, 'Mars', 'desert world with thin atmosphere', 4, false, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'largest planet in solar system', 4, false, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 'planet with rings', 4, false, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 'planet with 90 degree tilt from orbit', 4, false, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 'first planet located through mathematical calculations', 4, false, false);
INSERT INTO public.planet VALUES (9, 'Ceres', 'it is too dim to be seen by naked eyes', 4, false, true);
INSERT INTO public.planet VALUES (10, 'Pluto', 'It orbits sun', 4, false, true);
INSERT INTO public.planet VALUES (11, 'Quaoar', 'It is located in kuiper belt', 4, false, true);
INSERT INTO public.planet VALUES (12, 'Sedna', 'one of the largest orbit in solar system', 4, false, true);


--
-- Data for Name: rockets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.rockets VALUES (1, 'Atlas V', '107 feet long');
INSERT INTO public.rockets VALUES (2, 'Falcon 9', 'Space X rocket');
INSERT INTO public.rockets VALUES (3, 'Electron', '59 foot long');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'UY Scuti', 3, 11883.3, 'M4la-lab');
INSERT INTO public.star VALUES (2, 'VY Canis Majoris', 3, 987.89, 'M3');
INSERT INTO public.star VALUES (3, 'Antares', 3, 473.08, 'M1.5lab-lb');
INSERT INTO public.star VALUES (4, 'Sun', 3, 6.95, 'G2V');
INSERT INTO public.star VALUES (5, 'Betelgeuse', 3, 617.1, 'M2lab');
INSERT INTO public.star VALUES (6, 'KY Cygni', 3, 1046.1, 'M3');


--
-- Name: galaxy_sr_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_sr_seq', 6, true);


--
-- Name: moon_sr_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_sr_seq', 20, true);


--
-- Name: planet_sr_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_sr_seq', 12, true);


--
-- Name: rockets_rockets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.rockets_rockets_id_seq', 3, true);


--
-- Name: star_sr_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_sr_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT id_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: moon name_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_unq UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star radius_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT radius_unique UNIQUE (radius_in_millions_of_km);


--
-- Name: rockets rockets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rockets
    ADD CONSTRAINT rockets_pkey PRIMARY KEY (rockets_id);


--
-- Name: rockets rockets_rockets_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rockets
    ADD CONSTRAINT rockets_rockets_id_key UNIQUE (rockets_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

