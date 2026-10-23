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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 8, 97);
INSERT INTO public.games VALUES (2, 9, 473);
INSERT INTO public.games VALUES (3, 8, 6);
INSERT INTO public.games VALUES (4, 8, 84);
INSERT INTO public.games VALUES (5, 8, 672);
INSERT INTO public.games VALUES (6, 10, 477);
INSERT INTO public.games VALUES (7, 11, 395);
INSERT INTO public.games VALUES (8, 10, 368);
INSERT INTO public.games VALUES (9, 10, 60);
INSERT INTO public.games VALUES (10, 10, 291);
INSERT INTO public.games VALUES (11, 12, 906);
INSERT INTO public.games VALUES (12, 12, 74);
INSERT INTO public.games VALUES (13, 13, 14);
INSERT INTO public.games VALUES (14, 13, 293);
INSERT INTO public.games VALUES (15, 12, 785);
INSERT INTO public.games VALUES (16, 12, 801);
INSERT INTO public.games VALUES (17, 12, 107);
INSERT INTO public.games VALUES (18, 14, 75);
INSERT INTO public.games VALUES (19, 14, 513);
INSERT INTO public.games VALUES (20, 15, 175);
INSERT INTO public.games VALUES (21, 15, 388);
INSERT INTO public.games VALUES (22, 14, 524);
INSERT INTO public.games VALUES (23, 14, 498);
INSERT INTO public.games VALUES (24, 14, 817);
INSERT INTO public.games VALUES (25, 16, 793);
INSERT INTO public.games VALUES (26, 16, 814);
INSERT INTO public.games VALUES (27, 17, 986);
INSERT INTO public.games VALUES (28, 17, 471);
INSERT INTO public.games VALUES (29, 16, 704);
INSERT INTO public.games VALUES (30, 16, 199);
INSERT INTO public.games VALUES (31, 16, 339);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1792775942439');
INSERT INTO public.users VALUES (2, 'user_1792775942438');
INSERT INTO public.users VALUES (3, 'fasan');
INSERT INTO public.users VALUES (4, 'user_1792776031997');
INSERT INTO public.users VALUES (5, 'user_1792776031996');
INSERT INTO public.users VALUES (6, 'user_1792776578224');
INSERT INTO public.users VALUES (7, 'user_1792776578223');
INSERT INTO public.users VALUES (8, 'user_1792777057717');
INSERT INTO public.users VALUES (9, 'user_1792777057716');
INSERT INTO public.users VALUES (10, 'user_1792777092425');
INSERT INTO public.users VALUES (11, 'user_1792777092424');
INSERT INTO public.users VALUES (12, 'user_1792777292838');
INSERT INTO public.users VALUES (13, 'user_1792777292837');
INSERT INTO public.users VALUES (14, 'user_1792777375346');
INSERT INTO public.users VALUES (15, 'user_1792777375345');
INSERT INTO public.users VALUES (16, 'user_1792777754425');
INSERT INTO public.users VALUES (17, 'user_1792777754424');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 31, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 17, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

