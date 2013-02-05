--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.4
-- Dumped by pg_dump version 9.1.4
-- Started on 2012-11-20 08:46:16 EAT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 191 (class 3079 OID 11686)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2088 (class 0 OID 0)
-- Dependencies: 191
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 166 (class 1259 OID 85698)
-- Dependencies: 5
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 165 (class 1259 OID 85696)
-- Dependencies: 166 5
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 2089 (class 0 OID 0)
-- Dependencies: 165
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 2090 (class 0 OID 0)
-- Dependencies: 165
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, true);


--
-- TOC entry 164 (class 1259 OID 85683)
-- Dependencies: 5
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 163 (class 1259 OID 85681)
-- Dependencies: 164 5
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2091 (class 0 OID 0)
-- Dependencies: 163
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 2092 (class 0 OID 0)
-- Dependencies: 163
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 39, true);


--
-- TOC entry 162 (class 1259 OID 85673)
-- Dependencies: 5
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 161 (class 1259 OID 85671)
-- Dependencies: 162 5
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 2093 (class 0 OID 0)
-- Dependencies: 161
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 2094 (class 0 OID 0)
-- Dependencies: 161
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 39, true);


--
-- TOC entry 172 (class 1259 OID 85743)
-- Dependencies: 5
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    password character varying(128) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 85728)
-- Dependencies: 5
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 169 (class 1259 OID 85726)
-- Dependencies: 170 5
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 2095 (class 0 OID 0)
-- Dependencies: 169
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- TOC entry 2096 (class 0 OID 0)
-- Dependencies: 169
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- TOC entry 171 (class 1259 OID 85741)
-- Dependencies: 172 5
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 2097 (class 0 OID 0)
-- Dependencies: 171
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- TOC entry 2098 (class 0 OID 0)
-- Dependencies: 171
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- TOC entry 168 (class 1259 OID 85713)
-- Dependencies: 5
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 167 (class 1259 OID 85711)
-- Dependencies: 5 168
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2099 (class 0 OID 0)
-- Dependencies: 167
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- TOC entry 2100 (class 0 OID 0)
-- Dependencies: 167
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 177 (class 1259 OID 85786)
-- Dependencies: 1992 5
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 85784)
-- Dependencies: 5 177
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 2101 (class 0 OID 0)
-- Dependencies: 176
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- TOC entry 2102 (class 0 OID 0)
-- Dependencies: 176
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 39, true);


--
-- TOC entry 174 (class 1259 OID 85763)
-- Dependencies: 5
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 85761)
-- Dependencies: 174 5
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 2103 (class 0 OID 0)
-- Dependencies: 173
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 2104 (class 0 OID 0)
-- Dependencies: 173
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 13, true);


--
-- TOC entry 175 (class 1259 OID 85776)
-- Dependencies: 5
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 85855)
-- Dependencies: 5
-- Name: theapp_item_category; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE theapp_item_category (
    id integer NOT NULL,
    item_category character varying(40) NOT NULL
);


ALTER TABLE public.theapp_item_category OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 85853)
-- Dependencies: 5 188
-- Name: theapp_item_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE theapp_item_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.theapp_item_category_id_seq OWNER TO postgres;

--
-- TOC entry 2105 (class 0 OID 0)
-- Dependencies: 187
-- Name: theapp_item_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE theapp_item_category_id_seq OWNED BY theapp_item_category.id;


--
-- TOC entry 2106 (class 0 OID 0)
-- Dependencies: 187
-- Name: theapp_item_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('theapp_item_category_id_seq', 14, true);


--
-- TOC entry 190 (class 1259 OID 85888)
-- Dependencies: 5
-- Name: theapp_item_subcategory; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE theapp_item_subcategory (
    id integer NOT NULL,
    item_subcategory character varying(40) NOT NULL,
    item_category_id integer NOT NULL
);


ALTER TABLE public.theapp_item_subcategory OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 85886)
-- Dependencies: 190 5
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
-- TOC entry 2107 (class 0 OID 0)
-- Dependencies: 189
-- Name: theapp_item_subcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE theapp_item_subcategory_id_seq OWNED BY theapp_item_subcategory.id;


--
-- TOC entry 2108 (class 0 OID 0)
-- Dependencies: 189
-- Name: theapp_item_subcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('theapp_item_subcategory_id_seq', 6, true);


--
-- TOC entry 180 (class 1259 OID 85814)
-- Dependencies: 5
-- Name: theapp_report_found_item; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE theapp_report_found_item (
    id integer NOT NULL,
    user_name character varying(40) NOT NULL,
    email character varying(75) NOT NULL,
    item_name character varying(40) NOT NULL,
    identity_number character varying(40),
    item_category character varying(40),
    item_subcategory character varying(40),
    item_brand character varying(40) NOT NULL,
    item_model character varying(40) NOT NULL,
    item_color character varying(40) NOT NULL,
    item_description text NOT NULL,
    where_found character varying(40) NOT NULL,
    where_kept text NOT NULL,
    location_kept character varying(40) NOT NULL
);


ALTER TABLE public.theapp_report_found_item OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 85812)
-- Dependencies: 5 180
-- Name: theapp_report_found_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE theapp_report_found_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.theapp_report_found_item_id_seq OWNER TO postgres;

--
-- TOC entry 2109 (class 0 OID 0)
-- Dependencies: 179
-- Name: theapp_report_found_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE theapp_report_found_item_id_seq OWNED BY theapp_report_found_item.id;


--
-- TOC entry 2110 (class 0 OID 0)
-- Dependencies: 179
-- Name: theapp_report_found_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('theapp_report_found_item_id_seq', 3, true);


--
-- TOC entry 182 (class 1259 OID 85825)
-- Dependencies: 5
-- Name: theapp_search_with_id; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE theapp_search_with_id (
    id integer NOT NULL,
    user_name character varying(40) NOT NULL,
    email character varying(75) NOT NULL,
    item_name character varying(40) NOT NULL,
    identity_number character varying(50) NOT NULL,
    item_description text NOT NULL,
    where_lost text NOT NULL
);


ALTER TABLE public.theapp_search_with_id OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 85823)
-- Dependencies: 5 182
-- Name: theapp_search_with_id_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE theapp_search_with_id_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.theapp_search_with_id_id_seq OWNER TO postgres;

--
-- TOC entry 2111 (class 0 OID 0)
-- Dependencies: 181
-- Name: theapp_search_with_id_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE theapp_search_with_id_id_seq OWNED BY theapp_search_with_id.id;


--
-- TOC entry 2112 (class 0 OID 0)
-- Dependencies: 181
-- Name: theapp_search_with_id_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('theapp_search_with_id_id_seq', 1, true);


--
-- TOC entry 184 (class 1259 OID 85836)
-- Dependencies: 5
-- Name: theapp_search_without_id; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE theapp_search_without_id (
    id integer NOT NULL,
    user_name character varying(40) NOT NULL,
    email character varying(75) NOT NULL,
    item_category character varying(40) NOT NULL,
    item_subcategory character varying(40) NOT NULL,
    item_name character varying(40) NOT NULL,
    item_brand character varying(40) NOT NULL,
    item_model character varying(40) NOT NULL,
    item_color character varying(40) NOT NULL,
    item_description text NOT NULL,
    where_lost text NOT NULL
);


ALTER TABLE public.theapp_search_without_id OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 85834)
-- Dependencies: 184 5
-- Name: theapp_search_without_id_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE theapp_search_without_id_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.theapp_search_without_id_id_seq OWNER TO postgres;

--
-- TOC entry 2113 (class 0 OID 0)
-- Dependencies: 183
-- Name: theapp_search_without_id_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE theapp_search_without_id_id_seq OWNED BY theapp_search_without_id.id;


--
-- TOC entry 2114 (class 0 OID 0)
-- Dependencies: 183
-- Name: theapp_search_without_id_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('theapp_search_without_id_id_seq', 36, true);


--
-- TOC entry 186 (class 1259 OID 85847)
-- Dependencies: 5
-- Name: theapp_site; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE theapp_site (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    location_lat numeric(10,7) NOT NULL,
    location_lon numeric(10,7) NOT NULL
);


ALTER TABLE public.theapp_site OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 85845)
-- Dependencies: 5 186
-- Name: theapp_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE theapp_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.theapp_site_id_seq OWNER TO postgres;

--
-- TOC entry 2115 (class 0 OID 0)
-- Dependencies: 185
-- Name: theapp_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE theapp_site_id_seq OWNED BY theapp_site.id;


--
-- TOC entry 2116 (class 0 OID 0)
-- Dependencies: 185
-- Name: theapp_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('theapp_site_id_seq', 8, true);


--
-- TOC entry 178 (class 1259 OID 85806)
-- Dependencies: 1993 5
-- Name: theapp_user_information; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE theapp_user_information (
    your_name character varying(40) NOT NULL,
    email character varying(75) NOT NULL,
    phone_number integer,
    CONSTRAINT theapp_user_information_phone_number_check CHECK ((phone_number >= 0))
);


ALTER TABLE public.theapp_user_information OWNER TO postgres;

--
-- TOC entry 1986 (class 2604 OID 85701)
-- Dependencies: 165 166 166
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 1985 (class 2604 OID 85686)
-- Dependencies: 163 164 164
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 1984 (class 2604 OID 85676)
-- Dependencies: 161 162 162
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 1989 (class 2604 OID 85746)
-- Dependencies: 172 171 172
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- TOC entry 1988 (class 2604 OID 85731)
-- Dependencies: 169 170 170
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- TOC entry 1987 (class 2604 OID 85716)
-- Dependencies: 167 168 168
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 1991 (class 2604 OID 85789)
-- Dependencies: 177 176 177
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- TOC entry 1990 (class 2604 OID 85766)
-- Dependencies: 174 173 174
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- TOC entry 1998 (class 2604 OID 85858)
-- Dependencies: 187 188 188
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY theapp_item_category ALTER COLUMN id SET DEFAULT nextval('theapp_item_category_id_seq'::regclass);


--
-- TOC entry 1999 (class 2604 OID 85891)
-- Dependencies: 190 189 190
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY theapp_item_subcategory ALTER COLUMN id SET DEFAULT nextval('theapp_item_subcategory_id_seq'::regclass);


--
-- TOC entry 1994 (class 2604 OID 85817)
-- Dependencies: 180 179 180
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY theapp_report_found_item ALTER COLUMN id SET DEFAULT nextval('theapp_report_found_item_id_seq'::regclass);


--
-- TOC entry 1995 (class 2604 OID 85828)
-- Dependencies: 181 182 182
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY theapp_search_with_id ALTER COLUMN id SET DEFAULT nextval('theapp_search_with_id_id_seq'::regclass);


--
-- TOC entry 1996 (class 2604 OID 85839)
-- Dependencies: 183 184 184
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY theapp_search_without_id ALTER COLUMN id SET DEFAULT nextval('theapp_search_without_id_id_seq'::regclass);


--
-- TOC entry 1997 (class 2604 OID 85850)
-- Dependencies: 186 185 186
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY theapp_site ALTER COLUMN id SET DEFAULT nextval('theapp_site_id_seq'::regclass);


--
-- TOC entry 2069 (class 0 OID 85698)
-- Dependencies: 166
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
1	group1
\.


--
-- TOC entry 2068 (class 0 OID 85683)
-- Dependencies: 164
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	1	10
11	1	11
12	1	12
13	1	13
14	1	14
15	1	15
16	1	16
17	1	17
18	1	18
19	1	19
20	1	20
21	1	21
22	1	22
23	1	23
24	1	24
25	1	25
26	1	26
27	1	27
28	1	28
29	1	29
30	1	30
31	1	31
32	1	32
33	1	33
34	1	34
35	1	35
36	1	36
37	1	37
38	1	38
39	1	39
\.


--
-- TOC entry 2067 (class 0 OID 85673)
-- Dependencies: 162
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add log entry	6	add_logentry
17	Can change log entry	6	change_logentry
18	Can delete log entry	6	delete_logentry
19	Can add User information	7	add_user_information
20	Can change User information	7	change_user_information
21	Can delete User information	7	delete_user_information
22	Can add Report found item	8	add_report_found_item
23	Can change Report found item	8	change_report_found_item
24	Can delete Report found item	8	delete_report_found_item
25	Can add search with id	9	add_search_with_id
26	Can change search with id	9	change_search_with_id
27	Can delete search with id	9	delete_search_with_id
28	Can add Search without id	10	add_search_without_id
29	Can change Search without id	10	change_search_without_id
30	Can delete Search without id	10	delete_search_without_id
31	Can add site	11	add_site
32	Can change site	11	change_site
33	Can delete site	11	delete_site
34	Can add Item category	12	add_item_category
35	Can change Item category	12	change_item_category
36	Can delete Item category	12	delete_item_category
37	Can add Item subcategory	13	add_item_subcategory
38	Can change Item subcategory	13	change_item_subcategory
39	Can delete Item subcategory	13	delete_item_subcategory
\.


--
-- TOC entry 2072 (class 0 OID 85743)
-- Dependencies: 172
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, username, first_name, last_name, email, password, is_staff, is_active, is_superuser, last_login, date_joined) FROM stdin;
1	lexx			alexkasina@gmail.com	pbkdf2_sha256$10000$R6fKpaSwmWRo$mULTiaUoQXGjIPGAD2YXGbU7fX6hizyYETeAfJDSG/s=	t	t	t	2012-11-20 01:43:44.600329+03	2012-11-19 11:22:02.948088+03
\.


--
-- TOC entry 2071 (class 0 OID 85728)
-- Dependencies: 170
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 2070 (class 0 OID 85713)
-- Dependencies: 168
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2075 (class 0 OID 85786)
-- Dependencies: 177
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2012-11-19 11:23:27.10267+03	1	11	1	nyeri	1	
2	2012-11-19 11:23:45.812654+03	1	11	2	Nairobi	1	
3	2012-11-19 13:04:02.581322+03	1	12	1	Electronics	1	
4	2012-11-19 13:04:07.012722+03	1	12	2	Shoes	1	
5	2012-11-19 13:04:10.899625+03	1	12	3	Sporting goods	1	
6	2012-11-19 13:04:16.191076+03	1	12	4	Stationary	1	
7	2012-11-19 13:04:23.574833+03	1	12	5	Media	1	
8	2012-11-19 13:04:28.590288+03	1	12	6	Medical stuff	1	
9	2012-11-19 13:04:31.757548+03	1	12	7	Musical instruments	1	
10	2012-11-19 13:04:52.249223+03	1	12	8	Percel, Mail	1	
11	2012-11-19 13:04:57.183924+03	1	12	9	Personal accessories	1	
12	2012-11-19 13:05:08.013598+03	1	12	10	Bus tickets	1	
13	2012-11-19 13:05:13.287415+03	1	12	11	others	1	
14	2012-11-19 13:05:20.308419+03	1	12	12	Bags, Baggage, Luggage	1	
15	2012-11-19 13:05:25.77214+03	1	12	13	Jewellery	1	
16	2012-11-19 13:05:36.640364+03	1	12	14	Personal accessories	1	
17	2012-11-19 13:05:52.34576+03	1	13	1	phone	1	
18	2012-11-19 13:06:08.814384+03	1	13	2	ipod	1	
19	2012-11-19 13:06:24.554045+03	1	13	3	laptop	1	
20	2012-11-19 13:06:33.119053+03	1	13	4	Hannison	1	
21	2012-11-19 13:06:48.235736+03	1	13	5	Heels	1	
22	2012-11-19 13:07:16.315826+03	1	13	6	Ball(football)	1	
23	2012-11-19 13:07:27.464661+03	1	13	7	Ball(rugby)	1	
24	2012-11-19 13:13:26.887282+03	1	13	1	phone	1	
25	2012-11-19 13:13:34.199607+03	1	13	2	ipod	1	
26	2012-11-19 13:13:40.350203+03	1	13	3	Hannison	1	
27	2012-11-19 13:13:49.326813+03	1	13	4	Heels	1	
28	2012-11-19 13:13:58.605721+03	1	13	5	Ball(football)	1	
29	2012-11-19 13:14:05.993652+03	1	13	6	Ball(rugby)	1	
30	2012-11-19 16:28:42.70526+03	1	11	1	nyeri	2	Changed location_lat and location_lon.
31	2012-11-19 16:35:57.580778+03	1	11	3	Mombasa	1	
32	2012-11-19 16:37:20.528221+03	1	11	4	Kisumu	1	
33	2012-11-19 16:38:07.771201+03	1	11	4	Kisumu	2	Changed location_lat and location_lon.
34	2012-11-19 16:38:13.69398+03	1	11	5	Karatina	1	
35	2012-11-19 16:38:46.699734+03	1	11	5	Karatina	2	Changed location_lat and location_lon.
36	2012-11-19 16:39:31.109248+03	1	11	6	Nanyuki	1	
37	2012-11-19 16:40:32.470905+03	1	11	7	Nyahururu	1	
38	2012-11-19 16:56:04.566387+03	1	11	8	Thika	1	
39	2012-11-20 02:45:59.807982+03	1	2	1	group1	1	
\.


--
-- TOC entry 2073 (class 0 OID 85763)
-- Dependencies: 174
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	user	auth	user
4	content type	contenttypes	contenttype
5	session	sessions	session
6	log entry	admin	logentry
7	User information	theapp	user_information
8	Report found item	theapp	report_found_item
9	search with id	theapp	search_with_id
10	Search without id	theapp	search_without_id
11	site	theapp	site
12	Item category	theapp	item_category
13	Item subcategory	theapp	item_subcategory
\.


--
-- TOC entry 2074 (class 0 OID 85776)
-- Dependencies: 175
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
e6e2809b662f4fa4236a811620886e5c	ZTZlNGEzYzU5ZWQ5ZTE1MWQzYmE4NzNlM2M3ZWVlY2NkMmU1NmUwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2012-12-03 11:22:26.659735+03
a883c432fe26b043a878476f12d87013	ZTZlNGEzYzU5ZWQ5ZTE1MWQzYmE4NzNlM2M3ZWVlY2NkMmU1NmUwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2012-12-03 22:58:10.528053+03
84a5317233e8773d4f8e933494c4ef62	ZTZlNGEzYzU5ZWQ5ZTE1MWQzYmE4NzNlM2M3ZWVlY2NkMmU1NmUwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2012-12-04 01:43:44.611968+03
\.


--
-- TOC entry 2081 (class 0 OID 85855)
-- Dependencies: 188
-- Data for Name: theapp_item_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY theapp_item_category (id, item_category) FROM stdin;
1	Electronics
2	Shoes
3	Sporting goods
4	Stationary
5	Media
6	Medical stuff
7	Musical instruments
8	Percel, Mail
9	Personal accessories
10	Bus tickets
11	others
12	Bags, Baggage, Luggage
13	Jewellery
14	Personal accessories
\.


--
-- TOC entry 2082 (class 0 OID 85888)
-- Dependencies: 190
-- Data for Name: theapp_item_subcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY theapp_item_subcategory (id, item_subcategory, item_category_id) FROM stdin;
1	phone	1
2	ipod	1
3	Hannison	2
4	Heels	2
5	Ball(football)	3
6	Ball(rugby)	3
\.


--
-- TOC entry 2077 (class 0 OID 85814)
-- Dependencies: 180
-- Data for Name: theapp_report_found_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY theapp_report_found_item (id, user_name, email, item_name, identity_number, item_category, item_subcategory, item_brand, item_model, item_color, item_description, where_found, where_kept, location_kept) FROM stdin;
1	alex	alexkasina@gmail.com	identity card	27637693	electronics	dogs	N/a	N/a	white	Has he name Sam Ndibui.	Rugby pitch in kuct.	security desk at the main gate on the main nyeri-nyahururu road. 	Nyeri
2	sam	sam@gmail.com	visa	k27637693	1		N/a	n/a	brown	Has the name daisy on it.	bonus shop near bomas in kuct.	bonus shop	1
3	brian	brian@gmail.com	phone	N/a	1		samsung	galaxy	black	samsung galaxy with green stripe.	room 9	security desk in old admin building kuct.	1
\.


--
-- TOC entry 2078 (class 0 OID 85825)
-- Dependencies: 182
-- Data for Name: theapp_search_with_id; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY theapp_search_with_id (id, user_name, email, item_name, identity_number, item_description, where_lost) FROM stdin;
1	daisy	daisy@gmail.com	visa	k27637693	Has the name daisy.	I donn know.
\.


--
-- TOC entry 2079 (class 0 OID 85836)
-- Dependencies: 184
-- Data for Name: theapp_search_without_id; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY theapp_search_without_id (id, user_name, email, item_category, item_subcategory, item_name, item_brand, item_model, item_color, item_description, where_lost) FROM stdin;
1	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
2	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
3	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
4	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
5	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
6	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
7	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
8	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
9	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
10	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
11	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
12	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
13	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
14	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
15	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
16	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
17	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
18	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
19	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
20	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
21	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
22	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
23	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
24	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
25	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
26	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
27	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
28	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
29	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
30	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
31	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
32	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
33	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
34	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
35	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
36	ken	ken@gmail.com	1		phone	samsung		black	samsung galaxy with safcom line	bus park in kuct.
\.


--
-- TOC entry 2080 (class 0 OID 85847)
-- Dependencies: 186
-- Data for Name: theapp_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY theapp_site (id, name, location_lat, location_lon) FROM stdin;
2	Nairobi	0.0166670	35.2663690
1	nyeri	-0.4168760	36.9509810
3	Mombasa	-4.0434770	39.6682060
4	Kisumu	-0.0917020	34.7679570
5	Karatina	-0.4831580	37.1273550
6	Nanyuki	0.0166670	37.0666670
7	Nyahururu	0.0351640	36.3642920
8	Thika	-1.0387570	37.0833750
\.


--
-- TOC entry 2076 (class 0 OID 85806)
-- Dependencies: 178
-- Data for Name: theapp_user_information; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY theapp_user_information (your_name, email, phone_number) FROM stdin;
alex	alexkasina@gmail.com	\N
sam	sam@gmail.com	\N
daisy	daisy@gmail.com	727894083
brian	brian@gmail.com	\N
ken	ken@gmail.com	72757688
\.


--
-- TOC entry 2012 (class 2606 OID 85705)
-- Dependencies: 166 166
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2007 (class 2606 OID 85690)
-- Dependencies: 164 164 164
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- TOC entry 2010 (class 2606 OID 85688)
-- Dependencies: 164 164
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2014 (class 2606 OID 85703)
-- Dependencies: 166 166
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2002 (class 2606 OID 85680)
-- Dependencies: 162 162 162
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- TOC entry 2004 (class 2606 OID 85678)
-- Dependencies: 162 162
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2023 (class 2606 OID 85733)
-- Dependencies: 170 170
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2026 (class 2606 OID 85735)
-- Dependencies: 170 170 170
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- TOC entry 2028 (class 2606 OID 85748)
-- Dependencies: 172 172
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2017 (class 2606 OID 85718)
-- Dependencies: 168 168
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2020 (class 2606 OID 85720)
-- Dependencies: 168 168 168
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- TOC entry 2030 (class 2606 OID 85750)
-- Dependencies: 172 172
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2040 (class 2606 OID 85795)
-- Dependencies: 177 177
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2032 (class 2606 OID 85770)
-- Dependencies: 174 174 174
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- TOC entry 2034 (class 2606 OID 85768)
-- Dependencies: 174 174
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2037 (class 2606 OID 85783)
-- Dependencies: 175 175
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2053 (class 2606 OID 85860)
-- Dependencies: 188 188
-- Name: theapp_item_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY theapp_item_category
    ADD CONSTRAINT theapp_item_category_pkey PRIMARY KEY (id);


--
-- TOC entry 2056 (class 2606 OID 85893)
-- Dependencies: 190 190
-- Name: theapp_item_subcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY theapp_item_subcategory
    ADD CONSTRAINT theapp_item_subcategory_pkey PRIMARY KEY (id);


--
-- TOC entry 2045 (class 2606 OID 85822)
-- Dependencies: 180 180
-- Name: theapp_report_found_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY theapp_report_found_item
    ADD CONSTRAINT theapp_report_found_item_pkey PRIMARY KEY (id);


--
-- TOC entry 2047 (class 2606 OID 85833)
-- Dependencies: 182 182
-- Name: theapp_search_with_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY theapp_search_with_id
    ADD CONSTRAINT theapp_search_with_id_pkey PRIMARY KEY (id);


--
-- TOC entry 2049 (class 2606 OID 85844)
-- Dependencies: 184 184
-- Name: theapp_search_without_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY theapp_search_without_id
    ADD CONSTRAINT theapp_search_without_id_pkey PRIMARY KEY (id);


--
-- TOC entry 2051 (class 2606 OID 85852)
-- Dependencies: 186 186
-- Name: theapp_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY theapp_site
    ADD CONSTRAINT theapp_site_pkey PRIMARY KEY (id);


--
-- TOC entry 2043 (class 2606 OID 85811)
-- Dependencies: 178 178
-- Name: theapp_user_information_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY theapp_user_information
    ADD CONSTRAINT theapp_user_information_pkey PRIMARY KEY (email);


--
-- TOC entry 2005 (class 1259 OID 85876)
-- Dependencies: 164
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- TOC entry 2008 (class 1259 OID 85877)
-- Dependencies: 164
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2000 (class 1259 OID 85875)
-- Dependencies: 162
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- TOC entry 2021 (class 1259 OID 85881)
-- Dependencies: 170
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- TOC entry 2024 (class 1259 OID 85880)
-- Dependencies: 170
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- TOC entry 2015 (class 1259 OID 85879)
-- Dependencies: 168
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2018 (class 1259 OID 85878)
-- Dependencies: 168
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2038 (class 1259 OID 85884)
-- Dependencies: 177
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- TOC entry 2041 (class 1259 OID 85883)
-- Dependencies: 177
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- TOC entry 2035 (class 1259 OID 85882)
-- Dependencies: 175
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- TOC entry 2054 (class 1259 OID 85899)
-- Dependencies: 190
-- Name: theapp_item_subcategory_item_category_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX theapp_item_subcategory_item_category_id ON theapp_item_subcategory USING btree (item_category_id);


--
-- TOC entry 2058 (class 2606 OID 85691)
-- Dependencies: 2003 164 162
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2062 (class 2606 OID 85736)
-- Dependencies: 166 2013 170
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2060 (class 2606 OID 85721)
-- Dependencies: 162 168 2003
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2057 (class 2606 OID 85771)
-- Dependencies: 174 162 2033
-- Name: content_type_id_refs_id_728de91f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_728de91f FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2065 (class 2606 OID 85801)
-- Dependencies: 2033 174 177
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2064 (class 2606 OID 85796)
-- Dependencies: 2027 172 177
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2059 (class 2606 OID 85706)
-- Dependencies: 166 164 2013
-- Name: group_id_refs_id_3cea63fe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_3cea63fe FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2066 (class 2606 OID 85894)
-- Dependencies: 190 2052 188
-- Name: theapp_item_subcategory_item_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY theapp_item_subcategory
    ADD CONSTRAINT theapp_item_subcategory_item_category_id_fkey FOREIGN KEY (item_category_id) REFERENCES theapp_item_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2063 (class 2606 OID 85756)
-- Dependencies: 2027 172 170
-- Name: user_id_refs_id_831107f1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_831107f1 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2061 (class 2606 OID 85751)
-- Dependencies: 172 2027 168
-- Name: user_id_refs_id_f2045483; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_f2045483 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2087 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2012-11-20 08:46:17 EAT

--
-- PostgreSQL database dump complete
--

