
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


CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    speed integer NOT NULL,
    description text,
    is_active boolean
);


ALTER TABLE public.comet OWNER TO freecodecamp;


CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;



ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;



CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric,
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;



CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;



ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;




CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter integer,
    description text,
    is_spherical boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;



CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;



ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;



CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth numeric,
    has_life boolean,
    is_spherical boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;



CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;



ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;



CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    temperature integer,
    is_spherical boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

-

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;




ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);



ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);




ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);



ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);



ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);




INSERT INTO public.comet VALUES (1, 'Halley', 70, 'Periodic comet', true);
INSERT INTO public.comet VALUES (2, 'HaleBopp', 45, 'Bright comet', true);
INSERT INTO public.comet VALUES (3, 'Encke', 69, 'Short period', true);




INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Home galaxy', 13600, 0, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral', 10000, 2537000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Galaxy', 12000, 3000000, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Galaxy', 11000, 23000000, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Galaxy', 13000, 29000000, false);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'Galaxy', 12500, 17000000, false);




INSERT INTO public.moon VALUES (1, 'Moon', 3474, 'Earth moon', true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 'Mars moon', true, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 'Mars moon', true, 4);
INSERT INTO public.moon VALUES (4, 'Io', 3643, 'Jupiter moon', true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 3122, 'Jupiter moon', true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5268, 'Jupiter moon', true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4821, 'Jupiter moon', true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 5150, 'Saturn moon', true, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 1528, 'Saturn moon', true, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 1469, 'Saturn moon', true, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 1123, 'Saturn moon', true, 6);
INSERT INTO public.moon VALUES (12, 'Tethys', 1062, 'Saturn moon', true, 6);
INSERT INTO public.moon VALUES (13, 'Enceladus', 504, 'Saturn moon', true, 6);
INSERT INTO public.moon VALUES (14, 'Mimas', 396, 'Saturn moon', true, 6);
INSERT INTO public.moon VALUES (15, 'Titania', 1578, 'Uranus moon', true, 7);
INSERT INTO public.moon VALUES (16, 'Oberon', 1523, 'Uranus moon', true, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 1169, 'Uranus moon', true, 7);
INSERT INTO public.moon VALUES (18, 'Ariel', 1158, 'Uranus moon', true, 7);
INSERT INTO public.moon VALUES (19, 'Triton', 2707, 'Neptune moon', true, 8);
INSERT INTO public.moon VALUES (20, 'Nereid', 340, 'Neptune moon', true, 8);




INSERT INTO public.planet VALUES (1, 'Mercury', 0.4, false, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0.7, false, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1.5, false, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 5.2, false, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 9.5, false, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 19.8, false, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 30, false, true, 1);
INSERT INTO public.planet VALUES (9, 'Kepler22b', 600, false, true, 2);
INSERT INTO public.planet VALUES (10, 'ProximaB', 4.2, false, true, 3);
INSERT INTO public.planet VALUES (11, 'Gliese581g', 20, false, true, 4);
INSERT INTO public.planet VALUES (12, 'HD209458b', 150, false, true, 5);




INSERT INTO public.star VALUES (1, 'Sun', 4600, 5500, true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 300, 9940, true, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1000, 3500, true, 2);
INSERT INTO public.star VALUES (4, 'Rigel', 800, 12000, true, 3);
INSERT INTO public.star VALUES (5, 'Polaris', 700, 6000, true, 4);
INSERT INTO public.star VALUES (6, 'Vega', 500, 9600, true, 5);




SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);




SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);



SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);




SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);




SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);




ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);



ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);



ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);




ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);




ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);




ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);




ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);



ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);




ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);




ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);




ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);




ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);




