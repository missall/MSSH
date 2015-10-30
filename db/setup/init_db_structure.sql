--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.4.0
-- Started on 2015-07-16 09:06:49 CST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 207 (class 3079 OID 11756)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2115 (class 0 OID 0)
-- Dependencies: 207
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 188 (class 1259 OID 32870)
-- Name: bug_code; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bug_code (
    bug_code_id numeric(10,0) NOT NULL,
    number character varying(50) NOT NULL,
    name character varying(50),
    alert_id character varying(160),
    remark character varying(500)
);


--
-- TOC entry 190 (class 1259 OID 32884)
-- Name: bug_solution; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bug_solution (
    bug_solution_id numeric(10,0) NOT NULL,
    bug_code_id numeric(10,0) NOT NULL,
    solution character varying(500) NOT NULL,
    remark character varying(500)
);


--
-- TOC entry 186 (class 1259 OID 32848)
-- Name: device; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE device (
    device_id numeric(10,0) NOT NULL,
    device_model_id numeric(10,0) NOT NULL,
    ipaddress character varying(20) NOT NULL,
    macaddress character varying(50) NOT NULL,
    front character varying(50) NOT NULL,
    created_by numeric(10,0),
    modified_by numeric(10,0),
    date_created timestamp(6) without time zone NOT NULL,
    date_modified timestamp(6) without time zone,
    remark character varying(200)
);


--
-- TOC entry 193 (class 1259 OID 32900)
-- Name: device_alarmInfo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "device_alarmInfo" (
    device_alarminfo_id numeric(10,0) NOT NULL,
    device_id numeric(10,0) NOT NULL,
    oid character varying(50) NOT NULL,
    oid_value character varying(10) NOT NULL,
    alert_lvl numeric(1,0) NOT NULL,
    alert_class numeric(1,0) NOT NULL,
    date timestamp(6) without time zone NOT NULL,
    bug_code_id numeric(10,0) NOT NULL
);


--
-- TOC entry 192 (class 1259 OID 32895)
-- Name: device_mibInfo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "device_mibInfo" (
    device_mibinfo_id numeric(10,0) NOT NULL,
    device_model_id numeric(10,0) NOT NULL,
    oid_name character varying(200) NOT NULL,
    oid character varying(20) NOT NULL,
    coeff money,
    remark character varying(255)
);


--
-- TOC entry 183 (class 1259 OID 32839)
-- Name: device_model; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE device_model (
    device_model_id numeric(10,0) NOT NULL,
    name character varying(50) NOT NULL,
    device_type_id numeric(10,0) NOT NULL,
    get_cssommunity character varying(20) NOT NULL,
    set_community character varying(20) NOT NULL,
    module_num character varying(1),
    factory_id numeric(10,0) NOT NULL,
    is_frontend boolean,
    software_ver character varying(20),
    hardware_ver character varying(20)
);


--
-- TOC entry 198 (class 1259 OID 32919)
-- Name: device_module; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE device_module (
    device_module_id numeric(10,0) NOT NULL,
    name character varying(50) NOT NULL,
    device_id numeric(10,0) NOT NULL,
    device_model_id numeric(10,0) NOT NULL,
    position_num numeric(10,0) NOT NULL,
    created_by numeric(10,0),
    modified_by numeric(10,0),
    date_created timestamp(6) without time zone NOT NULL,
    date_modified timestamp(6) without time zone
);


--
-- TOC entry 196 (class 1259 OID 32912)
-- Name: device_parathreshold; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE device_parathreshold (
    device_parathreshold_id numeric(10,0) NOT NULL,
    device_id numeric(10,0) NOT NULL,
    mib_id numeric(10,0) NOT NULL,
    lowlow character varying(20) NOT NULL,
    low character varying(20) NOT NULL,
    hi character varying(20) NOT NULL,
    hihi character varying(20) NOT NULL,
    created_by numeric(10,0),
    modified_by numeric(10,0),
    date_created timestamp(6) without time zone NOT NULL,
    date_modified timestamp(6) without time zone
);


--
-- TOC entry 200 (class 1259 OID 32926)
-- Name: device_physicallink; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE device_physicallink (
    device_physicallink_id numeric(10,0) NOT NULL,
    device_id numeric(10,0) NOT NULL,
    parent_id numeric(10,0) NOT NULL,
    created_by numeric(10,0),
    modified_by numeric(10,0),
    date_created timestamp(6) without time zone NOT NULL,
    date_modified timestamp(6) without time zone
);


--
-- TOC entry 202 (class 1259 OID 32933)
-- Name: device_pollInfo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "device_pollInfo" (
    device_pollinfo_id numeric(10,0) NOT NULL,
    device_id numeric(10,0) NOT NULL,
    para_name character varying(50) NOT NULL,
    para_value character varying(20) NOT NULL
);


--
-- TOC entry 194 (class 1259 OID 32905)
-- Name: device_poll_strategy; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE device_poll_strategy (
    poll_strategy_id numeric(10,0) NOT NULL,
    device_id numeric(10,0) NOT NULL,
    poll_cycle interval(6) NOT NULL,
    poll_oid character varying(50) NOT NULL,
    created_by numeric(10,0),
    modified_by numeric(10,0),
    date_created timestamp(6) without time zone NOT NULL,
    date_modified timestamp(6) without time zone
);


--
-- TOC entry 182 (class 1259 OID 32834)
-- Name: device_type; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE device_type (
    device_type_id numeric(10,0) NOT NULL,
    type_name character varying(50) NOT NULL,
    created_by numeric(10,0),
    modified_by numeric(10,0),
    date_created timestamp(6) without time zone NOT NULL,
    date_modified timestamp(6) without time zone,
    remark character varying(255)
);


--
-- TOC entry 206 (class 1259 OID 33042)
-- Name: pro_user_info; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pro_user_info (
    userid integer NOT NULL,
    password character varying(50),
    username character varying(50)
);


--
-- TOC entry 205 (class 1259 OID 33040)
-- Name: pro_user_info_userid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pro_user_info_userid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2116 (class 0 OID 0)
-- Dependencies: 205
-- Name: pro_user_info_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pro_user_info_userid_seq OWNED BY pro_user_info.userid;


--
-- TOC entry 189 (class 1259 OID 32882)
-- Name: s_bug_code_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE s_bug_code_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2117 (class 0 OID 0)
-- Dependencies: 189
-- Name: s_bug_code_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE s_bug_code_id OWNED BY bug_code.bug_code_id;


--
-- TOC entry 191 (class 1259 OID 32892)
-- Name: s_bug_solution_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE s_bug_solution_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2118 (class 0 OID 0)
-- Dependencies: 191
-- Name: s_bug_solution_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE s_bug_solution_id OWNED BY bug_solution.bug_solution_id;


--
-- TOC entry 187 (class 1259 OID 32857)
-- Name: s_device_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE s_device_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2119 (class 0 OID 0)
-- Dependencies: 187
-- Name: s_device_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE s_device_id OWNED BY device.device_id;


--
-- TOC entry 185 (class 1259 OID 32846)
-- Name: s_device_model_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE s_device_model_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2120 (class 0 OID 0)
-- Dependencies: 185
-- Name: s_device_model_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE s_device_model_id OWNED BY device_model.device_model_id;


--
-- TOC entry 199 (class 1259 OID 32924)
-- Name: s_device_module_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE s_device_module_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2121 (class 0 OID 0)
-- Dependencies: 199
-- Name: s_device_module_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE s_device_module_id OWNED BY device_module.device_module_id;


--
-- TOC entry 197 (class 1259 OID 32917)
-- Name: s_device_parathreshold_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE s_device_parathreshold_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2122 (class 0 OID 0)
-- Dependencies: 197
-- Name: s_device_parathreshold_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE s_device_parathreshold_id OWNED BY device_parathreshold.device_parathreshold_id;


--
-- TOC entry 201 (class 1259 OID 32931)
-- Name: s_device_physicalink; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE s_device_physicalink
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2123 (class 0 OID 0)
-- Dependencies: 201
-- Name: s_device_physicalink; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE s_device_physicalink OWNED BY device_physicallink.device_physicallink_id;


--
-- TOC entry 203 (class 1259 OID 32938)
-- Name: s_device_pollinfo_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE s_device_pollinfo_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2124 (class 0 OID 0)
-- Dependencies: 203
-- Name: s_device_pollinfo_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE s_device_pollinfo_id OWNED BY "device_pollInfo".device_pollinfo_id;


--
-- TOC entry 184 (class 1259 OID 32844)
-- Name: s_device_type_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE s_device_type_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2125 (class 0 OID 0)
-- Dependencies: 184
-- Name: s_device_type_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE s_device_type_id OWNED BY device_type.device_type_id;


--
-- TOC entry 172 (class 1259 OID 32786)
-- Name: sys_function; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sys_function (
    sys_function_id numeric(10,0) NOT NULL,
    name character varying(60) NOT NULL,
    memo character varying(150),
    auth_flag numeric(1,0) NOT NULL,
    fun_func_id numeric(10,0),
    level_id numeric(2,0),
    method_name character varying(50),
    is_auth numeric(1,0),
    date_created timestamp(6) without time zone,
    created_by numeric(10,0)
);


--
-- TOC entry 173 (class 1259 OID 32791)
-- Name: s_func_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE s_func_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2126 (class 0 OID 0)
-- Dependencies: 173
-- Name: s_func_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE s_func_id OWNED BY sys_function.sys_function_id;


--
-- TOC entry 174 (class 1259 OID 32793)
-- Name: sys_operator; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sys_operator (
    sys_operator_id numeric(10,0) NOT NULL,
    login_name character varying(10),
    gender numeric(1,0),
    delete_flag numeric(2,0),
    name character varying(60),
    password character varying(100) NOT NULL,
    id_card character varying(30),
    status numeric(2,0) NOT NULL,
    tel_no character varying(21),
    email character varying(50),
    created_by numeric(10,0),
    modified_by numeric(10,0),
    date_created timestamp(6) without time zone NOT NULL,
    date_modified timestamp(6) without time zone
);


--
-- TOC entry 175 (class 1259 OID 32798)
-- Name: s_oper_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE s_oper_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2127 (class 0 OID 0)
-- Dependencies: 175
-- Name: s_oper_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE s_oper_id OWNED BY sys_operator.sys_operator_id;


--
-- TOC entry 176 (class 1259 OID 32800)
-- Name: sys_operate_log; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sys_operate_log (
    sys_operate_log_id numeric(20,0) NOT NULL,
    priority numeric(2,0),
    module_id numeric(4,0),
    operate_info character varying(255),
    detail_info character varying(255),
    created_by numeric(4,0),
    date_created timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 177 (class 1259 OID 32808)
-- Name: s_operate_log_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE s_operate_log_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2128 (class 0 OID 0)
-- Dependencies: 177
-- Name: s_operate_log_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE s_operate_log_id OWNED BY sys_operate_log.sys_operate_log_id;


--
-- TOC entry 195 (class 1259 OID 32910)
-- Name: s_poll_strategy_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE s_poll_strategy_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2129 (class 0 OID 0)
-- Dependencies: 195
-- Name: s_poll_strategy_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE s_poll_strategy_id OWNED BY device_poll_strategy.poll_strategy_id;


--
-- TOC entry 178 (class 1259 OID 32810)
-- Name: sys_role; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sys_role (
    sys_role_id numeric(10,0) NOT NULL,
    name character varying(60) NOT NULL,
    delete_flag numeric(1,0),
    created_by numeric(10,0),
    modified_by numeric(10,0),
    date_created timestamp(6) without time zone,
    date_modified timestamp(6) without time zone
);


--
-- TOC entry 179 (class 1259 OID 32815)
-- Name: s_role_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE s_role_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2130 (class 0 OID 0)
-- Dependencies: 179
-- Name: s_role_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE s_role_id OWNED BY sys_role.sys_role_id;


--
-- TOC entry 170 (class 1259 OID 32771)
-- Name: sys_dict; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sys_dict (
    sys_dict_id numeric(10,0) NOT NULL,
    is_boolean numeric(1,0) NOT NULL,
    main_id numeric(16,0) NOT NULL,
    sub_id numeric(16,0) NOT NULL,
    main_desc character varying(160) NOT NULL,
    sub_desc character varying(160) NOT NULL,
    created_by numeric(10,0),
    modified_by numeric(10,0),
    date_created timestamp(6) without time zone NOT NULL,
    date_modified timestamp(6) without time zone
);


--
-- TOC entry 2131 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN sys_dict.created_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN sys_dict.created_by IS '用户id';


--
-- TOC entry 171 (class 1259 OID 32776)
-- Name: s_sys_dict_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE s_sys_dict_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2132 (class 0 OID 0)
-- Dependencies: 171
-- Name: s_sys_dict_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE s_sys_dict_id OWNED BY sys_dict.sys_dict_id;


--
-- TOC entry 180 (class 1259 OID 32817)
-- Name: sys_role_function; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sys_role_function (
    sys_role_id numeric(10,0) NOT NULL,
    sys_function_id numeric(10,0) NOT NULL
);


--
-- TOC entry 181 (class 1259 OID 32820)
-- Name: sys_role_operator; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sys_role_operator (
    sys_role_id numeric(10,0) NOT NULL,
    sys_operator_id numeric(10,0) NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 33030)
-- Name: sys_supplier; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sys_supplier (
    sys_supplier_id numeric(10,0) NOT NULL,
    name character varying(50) NOT NULL,
    linkman character varying(20),
    linkphone character varying(20),
    address character varying(255),
    created_by numeric(10,0),
    modified_by numeric(10,0),
    date_created timestamp(6) without time zone NOT NULL,
    date_modified timestamp(6) without time zone
);


--
-- TOC entry 1941 (class 2604 OID 33045)
-- Name: userid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pro_user_info ALTER COLUMN userid SET DEFAULT nextval('pro_user_info_userid_seq'::regclass);


--
-- TOC entry 1957 (class 2606 OID 32838)
-- Name: Device_Type_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY device_type
    ADD CONSTRAINT "Device_Type_pkey" PRIMARY KEY (device_type_id);


--
-- TOC entry 1963 (class 2606 OID 32874)
-- Name: bug_code_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bug_code
    ADD CONSTRAINT bug_code_pkey PRIMARY KEY (bug_code_id);


--
-- TOC entry 1965 (class 2606 OID 32888)
-- Name: bug_solution_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bug_solution
    ADD CONSTRAINT bug_solution_pkey PRIMARY KEY (bug_solution_id);


--
-- TOC entry 1961 (class 2606 OID 32852)
-- Name: devcie_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY device
    ADD CONSTRAINT devcie_pkey PRIMARY KEY (device_id);


--
-- TOC entry 1969 (class 2606 OID 32904)
-- Name: device_alarmInfo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "device_alarmInfo"
    ADD CONSTRAINT "device_alarmInfo_pkey" PRIMARY KEY (device_alarminfo_id);


--
-- TOC entry 1967 (class 2606 OID 32899)
-- Name: device_mibInfo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "device_mibInfo"
    ADD CONSTRAINT "device_mibInfo_pkey" PRIMARY KEY (device_mibinfo_id);


--
-- TOC entry 1959 (class 2606 OID 32843)
-- Name: device_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY device_model
    ADD CONSTRAINT device_model_pkey PRIMARY KEY (device_model_id);


--
-- TOC entry 1975 (class 2606 OID 32923)
-- Name: device_module_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY device_module
    ADD CONSTRAINT device_module_pkey PRIMARY KEY (device_module_id);


--
-- TOC entry 1973 (class 2606 OID 32916)
-- Name: device_parathreshold_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY device_parathreshold
    ADD CONSTRAINT device_parathreshold_pkey PRIMARY KEY (device_parathreshold_id);


--
-- TOC entry 1977 (class 2606 OID 32930)
-- Name: device_physicallink_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY device_physicallink
    ADD CONSTRAINT device_physicallink_pkey PRIMARY KEY (device_physicallink_id);


--
-- TOC entry 1979 (class 2606 OID 32937)
-- Name: device_pollInfo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "device_pollInfo"
    ADD CONSTRAINT "device_pollInfo_pkey" PRIMARY KEY (device_pollinfo_id);


--
-- TOC entry 1971 (class 2606 OID 32909)
-- Name: device_poll_strategy_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY device_poll_strategy
    ADD CONSTRAINT device_poll_strategy_pkey PRIMARY KEY (poll_strategy_id);


--
-- TOC entry 1983 (class 2606 OID 33047)
-- Name: pro_user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pro_user_info
    ADD CONSTRAINT pro_user_info_pkey PRIMARY KEY (userid);


--
-- TOC entry 1943 (class 2606 OID 32775)
-- Name: sys_dict_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sys_dict
    ADD CONSTRAINT sys_dict_pkey PRIMARY KEY (sys_dict_id);


--
-- TOC entry 1945 (class 2606 OID 32790)
-- Name: sys_function_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sys_function
    ADD CONSTRAINT sys_function_pkey PRIMARY KEY (sys_function_id);


--
-- TOC entry 1949 (class 2606 OID 32804)
-- Name: sys_operate_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sys_operate_log
    ADD CONSTRAINT sys_operate_log_pkey PRIMARY KEY (sys_operate_log_id);


--
-- TOC entry 1947 (class 2606 OID 32797)
-- Name: sys_operator_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sys_operator
    ADD CONSTRAINT sys_operator_pkey PRIMARY KEY (sys_operator_id);


--
-- TOC entry 1953 (class 2606 OID 32833)
-- Name: sys_role_function_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sys_role_function
    ADD CONSTRAINT sys_role_function_pkey PRIMARY KEY (sys_role_id, sys_function_id);


--
-- TOC entry 1955 (class 2606 OID 32826)
-- Name: sys_role_operator_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sys_role_operator
    ADD CONSTRAINT sys_role_operator_pkey PRIMARY KEY (sys_role_id, sys_operator_id);


--
-- TOC entry 1951 (class 2606 OID 32831)
-- Name: sys_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sys_role
    ADD CONSTRAINT sys_role_pkey PRIMARY KEY (sys_role_id);


--
-- TOC entry 1981 (class 2606 OID 33034)
-- Name: sys_supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sys_supplier
    ADD CONSTRAINT sys_supplier_pkey PRIMARY KEY (sys_supplier_id);


--
-- TOC entry 1993 (class 2606 OID 32990)
-- Name: bug_code_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "device_alarmInfo"
    ADD CONSTRAINT bug_code_id FOREIGN KEY (bug_code_id) REFERENCES bug_code(bug_code_id);


--
-- TOC entry 1991 (class 2606 OID 32945)
-- Name: bug_code_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bug_solution
    ADD CONSTRAINT bug_code_id_fkey FOREIGN KEY (bug_code_id) REFERENCES bug_code(bug_code_id);


--
-- TOC entry 1992 (class 2606 OID 32955)
-- Name: device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "device_alarmInfo"
    ADD CONSTRAINT device_id_fkey FOREIGN KEY (device_id) REFERENCES device(device_id);


--
-- TOC entry 1997 (class 2606 OID 32970)
-- Name: device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY device_module
    ADD CONSTRAINT device_id_fkey FOREIGN KEY (device_id) REFERENCES device(device_id);


--
-- TOC entry 1995 (class 2606 OID 32980)
-- Name: device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY device_parathreshold
    ADD CONSTRAINT device_id_fkey FOREIGN KEY (device_id) REFERENCES device(device_id);


--
-- TOC entry 1999 (class 2606 OID 32995)
-- Name: device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY device_physicallink
    ADD CONSTRAINT device_id_fkey FOREIGN KEY (device_id) REFERENCES device(device_id);


--
-- TOC entry 1994 (class 2606 OID 33000)
-- Name: device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY device_poll_strategy
    ADD CONSTRAINT device_id_fkey FOREIGN KEY (device_id) REFERENCES device(device_id);


--
-- TOC entry 2000 (class 2606 OID 33005)
-- Name: device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "device_pollInfo"
    ADD CONSTRAINT device_id_fkey FOREIGN KEY (device_id) REFERENCES device(device_id);


--
-- TOC entry 1990 (class 2606 OID 32950)
-- Name: device_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY device
    ADD CONSTRAINT device_model_id_fkey FOREIGN KEY (device_model_id) REFERENCES device_model(device_model_id);


--
-- TOC entry 1998 (class 2606 OID 32975)
-- Name: device_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY device_module
    ADD CONSTRAINT device_model_id_fkey FOREIGN KEY (device_model_id) REFERENCES device_model(device_model_id);


--
-- TOC entry 1988 (class 2606 OID 32960)
-- Name: device_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY device_model
    ADD CONSTRAINT device_type_id FOREIGN KEY (device_type_id) REFERENCES device_type(device_type_id);


--
-- TOC entry 1989 (class 2606 OID 33035)
-- Name: factory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY device_model
    ADD CONSTRAINT factory_id_fkey FOREIGN KEY (factory_id) REFERENCES sys_supplier(sys_supplier_id);


--
-- TOC entry 1996 (class 2606 OID 32985)
-- Name: mib_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY device_parathreshold
    ADD CONSTRAINT mib_id_fkey FOREIGN KEY (mib_id) REFERENCES "device_mibInfo"(device_mibinfo_id);


--
-- TOC entry 1987 (class 2606 OID 33025)
-- Name: oper_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sys_role_operator
    ADD CONSTRAINT oper_id_fkey FOREIGN KEY (sys_operator_id) REFERENCES sys_operator(sys_operator_id);


--
-- TOC entry 1986 (class 2606 OID 33020)
-- Name: role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sys_role_operator
    ADD CONSTRAINT role_id_fkey FOREIGN KEY (sys_role_id) REFERENCES sys_role(sys_role_id);


--
-- TOC entry 1985 (class 2606 OID 33010)
-- Name: sys_function_func_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sys_role_function
    ADD CONSTRAINT sys_function_func_id_fkey FOREIGN KEY (sys_function_id) REFERENCES sys_function(sys_function_id);


--
-- TOC entry 1984 (class 2606 OID 32940)
-- Name: sys_role_function_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sys_role_function
    ADD CONSTRAINT sys_role_function_fkey FOREIGN KEY (sys_role_id) REFERENCES sys_role(sys_role_id);


--
-- TOC entry 2114 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-07-16 09:06:57 CST

--
-- PostgreSQL database dump complete
--

