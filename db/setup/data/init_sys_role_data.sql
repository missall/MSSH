--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.4.0
-- Started on 2015-07-16 09:07:08 CST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 2035 (class 0 OID 0)
-- Dependencies: 179
-- Name: s_role_id; Type: SEQUENCE SET; Schema: public; Owner: nms
--

SELECT pg_catalog.setval('s_role_id', 1, false);


--
-- TOC entry 2029 (class 0 OID 32810)
-- Dependencies: 178
-- Data for Name: sys_role; Type: TABLE DATA; Schema: public; Owner: nms
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE sys_role DISABLE TRIGGER ALL;

COPY sys_role (sys_role_id, name, delete_flag, created_by, modified_by, date_created, date_modified) FROM stdin;
3	123	\N	\N	\N	\N	\N
4	12312312	\N	\N	\N	\N	\N
5	13279123	\N	\N	\N	\N	\N
6	13279123123123	\N	\N	\N	\N	\N
7	123123213123123	\N	\N	\N	\N	\N
8	1231232131231231123	\N	\N	\N	\N	\N
9	7127317	\N	\N	\N	\N	\N
10	7127123317	\N	\N	\N	\N	\N
11	8288262	\N	\N	\N	\N	\N
12	8288262	\N	\N	\N	\N	\N
13	8288262	\N	\N	\N	\N	\N
14	8288262	\N	\N	\N	\N	\N
15	12	\N	\N	\N	\N	\N
16	adasd	\N	\N	\N	\N	\N
17	asdasda	\N	\N	\N	\N	\N
18	2131280	\N	\N	\N	\N	\N
19	1230192	\N	\N	\N	\N	\N
20	sasjdlaksd	\N	\N	\N	\N	\N
\.


ALTER TABLE sys_role ENABLE TRIGGER ALL;

-- Completed on 2015-07-16 09:07:12 CST

--
-- PostgreSQL database dump complete
--

