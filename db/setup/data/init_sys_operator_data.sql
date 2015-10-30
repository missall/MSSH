--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.4.0
-- Started on 2015-07-16 09:07:16 CST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 2035 (class 0 OID 0)
-- Dependencies: 175
-- Name: s_oper_id; Type: SEQUENCE SET; Schema: public; Owner: nms
--

SELECT pg_catalog.setval('s_oper_id', 1, false);


--
-- TOC entry 2029 (class 0 OID 32793)
-- Dependencies: 174
-- Data for Name: sys_operator; Type: TABLE DATA; Schema: public; Owner: nms
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE sys_operator DISABLE TRIGGER ALL;

COPY sys_operator (sys_operator_id, login_name, gender, delete_flag, name, password, id_card, status, tel_no, email, created_by, modified_by, date_created, date_modified) FROM stdin;
\.


ALTER TABLE sys_operator ENABLE TRIGGER ALL;

-- Completed on 2015-07-16 09:07:19 CST

--
-- PostgreSQL database dump complete
--

