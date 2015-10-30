--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.4.0
-- Started on 2015-07-16 09:07:03 CST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 2035 (class 0 OID 0)
-- Dependencies: 173
-- Name: s_func_id; Type: SEQUENCE SET; Schema: public; Owner: nms
--

SELECT pg_catalog.setval('s_func_id', 1, false);


--
-- TOC entry 2029 (class 0 OID 32786)
-- Dependencies: 172
-- Data for Name: sys_function; Type: TABLE DATA; Schema: public; Owner: nms
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE sys_function DISABLE TRIGGER ALL;

COPY sys_function (sys_function_id, name, memo, auth_flag, fun_func_id, level_id, method_name, is_auth, date_created, created_by) FROM stdin;
\.


ALTER TABLE sys_function ENABLE TRIGGER ALL;

-- Completed on 2015-07-16 09:07:08 CST

--
-- PostgreSQL database dump complete
--

