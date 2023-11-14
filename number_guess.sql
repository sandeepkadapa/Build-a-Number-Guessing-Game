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
-- Name: game; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0
);


ALTER TABLE public.game OWNER TO freecodecamp;

--
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game VALUES ('user_1699919659470', 1, 499);
INSERT INTO public.game VALUES ('user_1699919659469', 1, 559);
INSERT INTO public.game VALUES ('user_1699919806627', 1, 95);
INSERT INTO public.game VALUES ('user_1699919806626', 1, 721);
INSERT INTO public.game VALUES ('user_1699919814910', 1, 204);
INSERT INTO public.game VALUES ('user_1699919814909', 1, 208);
INSERT INTO public.game VALUES ('user_1699919970266', 1, 215);
INSERT INTO public.game VALUES ('user_1699919970265', 1, 702);
INSERT INTO public.game VALUES ('user_1699919991082', 1, 760);
INSERT INTO public.game VALUES ('user_1699919991081', 1, 133);
INSERT INTO public.game VALUES ('user_1699919996922', 1, 232);
INSERT INTO public.game VALUES ('user_1699919996921', 1, 951);
INSERT INTO public.game VALUES ('4564564', 1, 7);
INSERT INTO public.game VALUES ('sandeep', 2, 9);
INSERT INTO public.game VALUES ('user_1699920737519', 2, 545);
INSERT INTO public.game VALUES ('user_1699920737520', 5, 280);
INSERT INTO public.game VALUES ('user_1699920841471', 2, 160);
INSERT INTO public.game VALUES ('user_1699920841472', 5, 541);


--
-- Name: game game_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

