--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter integer NOT NULL,
    description text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.asteroid ALTER COLUMN asteroid_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.asteroid_asteroid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age integer NOT NULL,
    diameter integer,
    radius numeric,
    description text,
    is_habitable boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age integer NOT NULL,
    diameter integer,
    radius numeric,
    description text,
    is_habitable boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age integer NOT NULL,
    diameter integer,
    radius numeric,
    description text,
    is_habitable boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age integer NOT NULL,
    diameter integer,
    radius numeric,
    description text,
    is_habitable boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid OVERRIDING SYSTEM VALUE VALUES (1, 'Ceres', 939, 'Largest object in the asteroid belt');
INSERT INTO public.asteroid OVERRIDING SYSTEM VALUE VALUES (2, 'Vesta', 525, 'Large asteroid in the asteroid belt');
INSERT INTO public.asteroid OVERRIDING SYSTEM VALUE VALUES (3, 'Pallas', 512, 'Large asteroid in the asteroid belt');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (1, 'Milky Way', 13600, 105700, 52850, 'Home galaxy of Earth', true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (2, 'Andromeda', 10010, 120000, 60000, 'Nearest major galaxy', false);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (3, 'Triangulum', 8500, 60000, 30000, 'Spiral galaxy', false);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (4, 'Whirlpool', 500, 76000, 38000, 'Interacting spiral galaxy', false);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (5, 'Sombrero', 9000, 50000, 25000, 'Galaxy with a bright central bulge', false);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (6, 'Cartwheel', 1200, 150000, 75000, 'Ring-shaped galaxy', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 'Moon', 4500, 3475, 1737.5, 'Natural satellite of Earth', false, 3);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 'Phobos', 4500, 22, 11, 'Moon of Mars', false, 4);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 'Deimos', 4500, 12, 6, 'Moon of Mars', false, 4);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 'Io', 4500, 3643, 1821.5, 'Volcanically active moon of Jupiter', false, 5);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 'Europa', 4500, 3122, 1561, 'Icy moon of Jupiter', false, 5);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 'Ganymede', 4500, 5268, 2634, 'Largest moon in the solar system', false, 5);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 'Callisto', 4500, 4821, 2410.5, 'Outer moon of Jupiter', false, 5);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 'Titan', 4500, 5150, 2575, 'Largest moon of Saturn', false, 6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 'Rhea', 4500, 1528, 764, 'Moon of Saturn', false, 6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 'Enceladus', 4500, 504, 252, 'Icy moon of Saturn', false, 6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 'Dione', 4500, 1123, 561.5, 'Moon of Saturn', false, 6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 'Tethys', 4500, 1062, 531, 'Moon of Saturn', false, 6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 'Mimas', 4500, 396, 198, 'Small moon of Saturn', false, 6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 'Iapetus', 4500, 1469, 734.5, 'Moon of Saturn', false, 6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 'Ariel', 4500, 1158, 579, 'Moon of Uranus', false, 7);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 'Umbriel', 4500, 1169, 584.5, 'Moon of Uranus', false, 7);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 'Titania', 4500, 1578, 789, 'Largest moon of Uranus', false, 7);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 'Oberon', 4500, 1523, 761.5, 'Outer moon of Uranus', false, 7);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 'Triton', 4500, 2706, 1353, 'Largest moon of Neptune', false, 8);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 'Nereid', 4500, 340, 170, 'Moon of Neptune', false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (1, 'Mercury', 4500, 4879, 2439.5, 'Smallest planet in the solar system', false, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (2, 'Venus', 4500, 12104, 6052, 'Hot rocky planet', false, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (3, 'Earth', 4540, 12742, 6371, 'Planet with known life', true, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (4, 'Mars', 4600, 6779, 3389.5, 'Red planet', false, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (5, 'Jupiter', 4600, 139820, 69911, 'Largest planet', false, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, 'Saturn', 4500, 116460, 58232, 'Planet with prominent rings', false, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, 'Uranus', 4500, 50724, 25362, 'Ice giant', false, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, 'Neptune', 4500, 49244, 24622, 'Distant ice giant', false, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 'Sirius Prime', 3000, 15000, 7500, 'Fictional planet orbiting Sirius', false, 2);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, 'Centauri Prime', 3000, 14000, 7000, 'Fictional planet orbiting Proxima Centauri', false, 3);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, 'Vega Prime', 2000, 18000, 9000, 'Fictional planet orbiting Vega', false, 5);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, 'Polaris Prime', 1500, 12000, 6000, 'Fictional planet orbiting Polaris', false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (1, 'Sun', 4600, 1392700, 696340, 'Star at the center of our solar system', true, 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (2, 'Sirius', 242, 2380000, 1190000, 'Brightest star in the night sky', false, 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (3, 'Proxima Centauri', 4850, 214000, 107000, 'Closest known star to the Sun', false, 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (4, 'Betelgeuse', 10000, 1400000000, 700000000, 'Red supergiant star', false, 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (5, 'Vega', 455, 3750000, 1875000, 'Bright star in Lyra', false, 2);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (6, 'Polaris', 70, 48000000, 24000000, 'The North Star', false, 3);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


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

