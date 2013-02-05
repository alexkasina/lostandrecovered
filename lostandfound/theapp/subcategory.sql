--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.4
-- Dumped by pg_dump version 9.1.4
-- Started on 2012-11-19 13:10:08 EAT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 190 (class 1259 OID 85863)
-- Dependencies: 5
-- Name: theapp_item_subcategory; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE theapp_item_subcategory (
    id integer NOT NULL,
    item_category_id integer NOT NULL,
    item_subcategory character varying(40) NOT NULL
);


ALTER TABLE public.theapp_item_subcategory OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 85861)
-- Dependencies: 5 190
-- Name: theapp_item_subcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE theapp_item_subcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.theapp_item_subcategory_id_seq OWNER TO postgres;

--
-- TOC entry 1976 (class 0 OID 0)
-- Dependencies: 189
-- Name: theapp_item_subcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE theapp_item_subcategory_id_seq OWNED BY theapp_item_subcategory.id;


--
-- TOC entry 1977 (class 0 OID 0)
-- Dependencies: 189
-- Name: theapp_item_subcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('theapp_item_subcategory_id_seq', 7, true);


--
-- TOC entry 1968 (class 2604 OID 85866)
-- Dependencies: 190 189 190
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY theapp_item_subcategory ALTER COLUMN id SET DEFAULT nextval('theapp_item_subcategory_id_seq'::regclass);


--
-- TOC entry 1973 (class 0 OID 85863)
-- Dependencies: 190
-- Data for Name: theapp_item_subcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY theapp_item_subcategory (id, item_category_id, item_subcategory) FROM stdin;
1	1	phone
2	1	ipod
3	1	laptop
4	2	Hannison
5	2	Heels
6	3	Ball(football)
7	3	Ball(rugby)
\.


--
-- TOC entry 1971 (class 2606 OID 85868)
-- Dependencies: 190 190
-- Name: theapp_item_subcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY theapp_item_subcategory
    ADD CONSTRAINT theapp_item_subcategory_pkey PRIMARY KEY (id);


--
-- TOC entry 1969 (class 1259 OID 85885)
-- Dependencies: 190
-- Name: theapp_item_subcategory_item_category_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX theapp_item_subcategory_item_category_id ON theapp_item_subcategory USING btree (item_category_id);


--
-- TOC entry 1972 (class 2606 OID 85869)
-- Dependencies: 188 190
-- Name: theapp_item_subcategory_item_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY theapp_item_subcategory
    ADD CONSTRAINT theapp_item_subcategory_item_category_id_fkey FOREIGN KEY (item_category_id) REFERENCES theapp_item_category(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2012-11-19 13:10:08 EAT

--
-- PostgreSQL database dump complete
--

