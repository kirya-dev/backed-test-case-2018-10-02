--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 9.5.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.department OWNER TO postgres;

--
-- Name: department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.department_id_seq OWNER TO postgres;

--
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.department_id_seq OWNED BY public.department.id;


--
-- Name: stuff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stuff (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    middle_name character varying(255),
    sex character varying(1),
    salary bigint
);


ALTER TABLE public.stuff OWNER TO postgres;

--
-- Name: stuff_department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stuff_department (
    stuff_id integer NOT NULL,
    department_id integer NOT NULL
);


ALTER TABLE public.stuff_department OWNER TO postgres;

--
-- Name: stuff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stuff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stuff_id_seq OWNER TO postgres;

--
-- Name: stuff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stuff_id_seq OWNED BY public.stuff.id;


--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department (id, created_at, updated_at, name) FROM stdin;
15	2018-10-02 02:37:18	2018-10-02 12:52:32	Отдел закупок
16	2018-10-02 11:59:19	2018-10-02 12:52:42	Отдел продаж
17	2018-10-02 11:59:26	2018-10-02 12:52:51	PR-отдел
\.


--
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_id_seq', 17, true);


--
-- Data for Name: stuff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stuff (id, created_at, updated_at, first_name, last_name, middle_name, sex, salary) FROM stdin;
4	2018-10-02 01:12:48	2018-10-02 12:53:39	Иван	Йода	\N	M	999
5	2018-10-02 01:18:40	2018-10-02 12:54:05	Петр	Вейдер	\N	M	2424
6	2018-10-02 01:37:34	2018-10-02 12:54:35	Ольга	Кеноби	\N	F	231334
\.


--
-- Data for Name: stuff_department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stuff_department (stuff_id, department_id) FROM stdin;
5	15
4	16
6	17
6	16
\.


--
-- Name: stuff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stuff_id_seq', 8, true);


--
-- Name: department_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pk PRIMARY KEY (id);


--
-- Name: stuff_department_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stuff_department
    ADD CONSTRAINT stuff_department_pk PRIMARY KEY (stuff_id, department_id);


--
-- Name: stuff_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stuff
    ADD CONSTRAINT stuff_pk PRIMARY KEY (id);


--
-- Name: fk_5451422c950a1740; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stuff_department
    ADD CONSTRAINT fk_5451422c950a1740 FOREIGN KEY (stuff_id) REFERENCES public.stuff(id) ON DELETE CASCADE;


--
-- Name: fk_5451422cae80f5df; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stuff_department
    ADD CONSTRAINT fk_5451422cae80f5df FOREIGN KEY (department_id) REFERENCES public.department(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

