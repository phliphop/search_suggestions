--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 9.6.9

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: aux_component_templates; Type: TABLE; Schema: public; Owner: jamiedover
--

CREATE TABLE public.aux_component_templates (
    id integer NOT NULL,
    content text NOT NULL,
    creation_timestamp timestamp without time zone DEFAULT now() NOT NULL,
    nick_name character varying(255) NOT NULL
);


ALTER TABLE public.aux_component_templates OWNER TO jamiedover;

--
-- Name: COLUMN aux_component_templates.creation_timestamp; Type: COMMENT; Schema: public; Owner: jamiedover
--

COMMENT ON COLUMN public.aux_component_templates.creation_timestamp IS 'Should primary query by id.';


--
-- Name: aux_component_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: jamiedover
--

CREATE SEQUENCE public.aux_component_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aux_component_templates_id_seq OWNER TO jamiedover;

--
-- Name: aux_component_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamiedover
--

ALTER SEQUENCE public.aux_component_templates_id_seq OWNED BY public.aux_component_templates.id;


--
-- Name: search_term_index; Type: TABLE; Schema: public; Owner: jamiedover
--

CREATE TABLE public.search_term_index (
    id integer NOT NULL,
    term character varying(255) NOT NULL,
    creation_timestamp timestamp without time zone DEFAULT now() NOT NULL,
    ip_address character varying(64) NOT NULL,
    aux_component_template_id integer
);


ALTER TABLE public.search_term_index OWNER TO jamiedover;

--
-- Name: COLUMN search_term_index.ip_address; Type: COMMENT; Schema: public; Owner: jamiedover
--

COMMENT ON COLUMN public.search_term_index.ip_address IS 'components are optional';


--
-- Name: search_term_index_id_seq; Type: SEQUENCE; Schema: public; Owner: jamiedover
--

CREATE SEQUENCE public.search_term_index_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.search_term_index_id_seq OWNER TO jamiedover;

--
-- Name: search_term_index_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamiedover
--

ALTER SEQUENCE public.search_term_index_id_seq OWNED BY public.search_term_index.id;


--
-- Name: aux_component_templates id; Type: DEFAULT; Schema: public; Owner: jamiedover
--

ALTER TABLE ONLY public.aux_component_templates ALTER COLUMN id SET DEFAULT nextval('public.aux_component_templates_id_seq'::regclass);


--
-- Name: search_term_index id; Type: DEFAULT; Schema: public; Owner: jamiedover
--

ALTER TABLE ONLY public.search_term_index ALTER COLUMN id SET DEFAULT nextval('public.search_term_index_id_seq'::regclass);


--
-- Data for Name: aux_component_templates; Type: TABLE DATA; Schema: public; Owner: jamiedover
--

COPY public.aux_component_templates (id, content, creation_timestamp, nick_name) FROM stdin;
\.


--
-- Name: aux_component_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamiedover
--

SELECT pg_catalog.setval('public.aux_component_templates_id_seq', 1, false);


--
-- Data for Name: search_term_index; Type: TABLE DATA; Schema: public; Owner: jamiedover
--

COPY public.search_term_index (id, term, creation_timestamp, ip_address, aux_component_template_id) FROM stdin;
\.


--
-- Name: search_term_index_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamiedover
--

SELECT pg_catalog.setval('public.search_term_index_id_seq', 1, false);


--
-- Name: aux_component_templates aux_component_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: jamiedover
--

ALTER TABLE ONLY public.aux_component_templates
    ADD CONSTRAINT aux_component_templates_pkey PRIMARY KEY (id);


--
-- Name: search_term_index search_term_index_pkey; Type: CONSTRAINT; Schema: public; Owner: jamiedover
--

ALTER TABLE ONLY public.search_term_index
    ADD CONSTRAINT search_term_index_pkey PRIMARY KEY (id);


--
-- Name: search_term_index search_term_index_aux_component_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamiedover
--

ALTER TABLE ONLY public.search_term_index
    ADD CONSTRAINT search_term_index_aux_component_template_id_fkey FOREIGN KEY (aux_component_template_id) REFERENCES public.aux_component_templates(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

