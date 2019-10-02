--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Ubuntu 11.5-1.pgdg16.04+1)
-- Dumped by pg_dump version 11.4

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

SET default_with_oids = false;

--
-- Name: sucursales; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.sucursales (
    direccion character varying,
    nombre character varying,
    id integer NOT NULL
);


ALTER TABLE public.sucursales ;

--
-- Name: carrito_id_seq; Type: SEQUENCE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE SEQUENCE public.carrito_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carrito_id_seq ;

--
-- Name: carrito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: udgaybsavmmsdn
--

ALTER SEQUENCE public.carrito_id_seq OWNED BY public.sucursales.id;


--
-- Name: categoria; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.categoria (
    nombre character varying,
    descripcion character varying,
    submenu boolean,
    id integer NOT NULL
);


ALTER TABLE public.categoria ;

--
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE SEQUENCE public.categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_id_seq ;

--
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: udgaybsavmmsdn
--

ALTER SEQUENCE public.categoria_id_seq OWNED BY public.categoria.id;


--
-- Name: categoria_insumos; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.categoria_insumos (
    id integer NOT NULL,
    categ_desc character varying
);


ALTER TABLE public.categoria_insumos ;

--
-- Name: categoria_insumos_id_seq; Type: SEQUENCE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE SEQUENCE public.categoria_insumos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_insumos_id_seq ;

--
-- Name: categoria_insumos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: udgaybsavmmsdn
--

ALTER SEQUENCE public.categoria_insumos_id_seq OWNED BY public.categoria_insumos.id;


--
-- Name: combos; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.combos (
    id_combo integer NOT NULL,
    nombre character varying,
    descripcion character varying,
    precio double precision
);


ALTER TABLE public.combos ;

--
-- Name: combos_id_combo_seq; Type: SEQUENCE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE SEQUENCE public.combos_id_combo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.combos_id_combo_seq ;

--
-- Name: combos_id_combo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: udgaybsavmmsdn
--

ALTER SEQUENCE public.combos_id_combo_seq OWNED BY public.combos.id_combo;


--
-- Name: control_movimientos; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.control_movimientos (
    cantidad double precision,
    tipo_mov character varying,
    id_inventario integer,
    ubicacion character varying,
    id_sucursal integer,
    fecha character varying,
    id_usuario integer,
    id_control integer NOT NULL,
    observaciones character varying
);


ALTER TABLE public.control_movimientos ;

--
-- Name: control_movimientos_id_control_seq; Type: SEQUENCE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE SEQUENCE public.control_movimientos_id_control_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.control_movimientos_id_control_seq ;

--
-- Name: control_movimientos_id_control_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: udgaybsavmmsdn
--

ALTER SEQUENCE public.control_movimientos_id_control_seq OWNED BY public.control_movimientos.id_control;


--
-- Name: correos; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.correos (
    id integer NOT NULL,
    correo character varying
);


ALTER TABLE public.correos ;

--
-- Name: correos_id_seq; Type: SEQUENCE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE SEQUENCE public.correos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.correos_id_seq ;

--
-- Name: correos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: udgaybsavmmsdn
--

ALTER SEQUENCE public.correos_id_seq OWNED BY public.correos.id;


--
-- Name: corte_caja; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.corte_caja (
    id integer NOT NULL,
    fecha date,
    total double precision,
    id_sucursal integer,
    efectivo_apertura double precision,
    cerrada boolean,
    id_cortecaja integer,
    hora time with time zone
);


ALTER TABLE public.corte_caja ;

--
-- Name: corte_caja_id_seq; Type: SEQUENCE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE SEQUENCE public.corte_caja_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.corte_caja_id_seq ;

--
-- Name: corte_caja_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: udgaybsavmmsdn
--

ALTER SEQUENCE public.corte_caja_id_seq OWNED BY public.corte_caja.id;


--
-- Name: detalle_combos; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.detalle_combos (
    id_combo integer,
    id_productos integer,
    cantidad integer
);


ALTER TABLE public.detalle_combos ;

--
-- Name: detalle_promociones; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.detalle_promociones (
    id_promocion integer,
    id_productos integer,
    cantidad integer
);


ALTER TABLE public.detalle_promociones ;

--
-- Name: detalle_ticket; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.detalle_ticket (
    id_ticket integer,
    id_producto integer,
    cantidad integer,
    servido boolean,
    observaciones character varying,
    id integer NOT NULL,
    tipo_producto integer,
    fecharegistro timestamp without time zone,
    cancelado boolean,
    cortesia integer,
    efectivo_porcentaje double precision
);


ALTER TABLE public.detalle_ticket ;

--
-- Name: detalle_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE SEQUENCE public.detalle_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detalle_ticket_id_seq ;

--
-- Name: detalle_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: udgaybsavmmsdn
--

ALTER SEQUENCE public.detalle_ticket_id_seq OWNED BY public.detalle_ticket.id;


--
-- Name: entradas; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.entradas (
    total double precision,
    id_sucursal integer,
    id_usuario integer,
    nombre character varying,
    id_cortecaja integer
);


ALTER TABLE public.entradas ;

--
-- Name: gastos; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.gastos (
    total double precision,
    id_sucursal integer,
    id_usuario integer,
    nombre character varying,
    id_cortecaja integer
);


ALTER TABLE public.gastos ;

--
-- Name: historico_detalletickets; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.historico_detalletickets (
    id_ticket integer,
    id_producto integer,
    cantidad integer,
    observaciones character varying,
    cancelado boolean,
    total double precision,
    cortesia integer,
    efectivo_porcentaje double precision
);


ALTER TABLE public.historico_detalletickets ;

--
-- Name: historico_promocion_productos; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.historico_promocion_productos (
    id_ticket integer NOT NULL,
    id_promocion integer NOT NULL,
    id_producto integer NOT NULL,
    nombre character varying,
    cantidad integer,
    total double precision
);


ALTER TABLE public.historico_promocion_productos ;

--
-- Name: historico_promocion_ticket; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.historico_promocion_ticket (
    id_ticket integer NOT NULL,
    id_promocion integer NOT NULL,
    nombre character varying,
    cantidad integer,
    total double precision
);


ALTER TABLE public.historico_promocion_ticket ;

--
-- Name: historico_tickets; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.historico_tickets (
    id_ticket integer,
    id_user integer,
    fecha date,
    id_folio integer,
    id_sucursal integer,
    hora character varying,
    id_mesa integer,
    total double precision,
    cancelado boolean,
    tipo_pago character varying,
    nombre character varying,
    id_cortecaja integer,
    cortesia integer,
    efectivo_porcentaje double precision
);


ALTER TABLE public.historico_tickets ;

--
-- Name: insumos; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.insumos (
    id_inventario integer,
    cantidad integer,
    id_producto integer,
    id integer NOT NULL
);


ALTER TABLE public.insumos ;

--
-- Name: insumos_id_seq; Type: SEQUENCE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE SEQUENCE public.insumos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insumos_id_seq ;

--
-- Name: insumos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: udgaybsavmmsdn
--

ALTER SEQUENCE public.insumos_id_seq OWNED BY public.insumos.id;


--
-- Name: inventario; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.inventario (
    cantidad double precision,
    unidad_medida character varying,
    descripcion character varying,
    proveedor character varying,
    marca character varying,
    ubicacion character varying,
    id_sucursal integer,
    id_inventario integer NOT NULL,
    categoria character varying,
    minimo double precision
);


ALTER TABLE public.inventario ;

--
-- Name: inventario_id_inventario_seq; Type: SEQUENCE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE SEQUENCE public.inventario_id_inventario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventario_id_inventario_seq ;

--
-- Name: inventario_id_inventario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: udgaybsavmmsdn
--

ALTER SEQUENCE public.inventario_id_inventario_seq OWNED BY public.inventario.id_inventario;


--
-- Name: productos; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.productos (
    id_producto integer NOT NULL,
    nombre character varying,
    descripcion character varying,
    precio double precision,
    id_categoria integer,
    id_video character varying,
    nombre_video character varying,
    notificacion integer,
    ruta_imagen character varying,
    subcategoria character varying
);


ALTER TABLE public.productos ;

--
-- Name: inventario_porinsumos; Type: VIEW; Schema: public; Owner: udgaybsavmmsdn
--

CREATE VIEW public.inventario_porinsumos AS
 SELECT ht.fecha,
    ht.id_sucursal,
    sum(hdt.cantidad) AS cantidad_producto,
    iinv.id_inventario,
    iinv.descripcion,
    iis.cantidad AS cantidad_insumo,
    (sum(hdt.cantidad) * iis.cantidad) AS cantidad_vendida
   FROM ((((public.historico_tickets ht
     JOIN public.historico_detalletickets hdt ON ((ht.id_ticket = hdt.id_ticket)))
     JOIN public.productos ppro ON ((hdt.id_producto = ppro.id_producto)))
     JOIN public.insumos iis ON ((iis.id_producto = hdt.id_producto)))
     JOIN public.inventario iinv ON ((iinv.id_inventario = iis.id_inventario)))
  WHERE ((hdt.cancelado = false) AND (ht.cancelado = false))
  GROUP BY ht.fecha, iis.cantidad, iinv.descripcion, iinv.id_inventario, ht.id_sucursal
  ORDER BY iinv.id_inventario;


ALTER TABLE public.inventario_porinsumos ;

--
-- Name: key; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.key (
    password character varying,
    id_sucursal integer,
    serial integer NOT NULL
);


ALTER TABLE public.key ;

--
-- Name: key_serial_seq; Type: SEQUENCE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE SEQUENCE public.key_serial_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.key_serial_seq ;

--
-- Name: key_serial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: udgaybsavmmsdn
--

ALTER SEQUENCE public.key_serial_seq OWNED BY public.key.serial;


--
-- Name: mesas; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.mesas (
    id_mesa integer NOT NULL,
    id_tipo integer,
    id_sucursal integer NOT NULL,
    ocupada boolean,
    mesafusionada integer
);


ALTER TABLE public.mesas ;

--
-- Name: productos_id_producto_seq; Type: SEQUENCE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE SEQUENCE public.productos_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productos_id_producto_seq ;

--
-- Name: productos_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: udgaybsavmmsdn
--

ALTER SEQUENCE public.productos_id_producto_seq OWNED BY public.productos.id_producto;


--
-- Name: tickets; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.tickets (
    id_ticket integer NOT NULL,
    id_user integer,
    fecha date,
    id_folio integer,
    id_sucursal integer,
    hora character varying,
    id_mesa integer,
    nombre character varying,
    cortesia integer,
    efectivo_porcentaje double precision
);


ALTER TABLE public.tickets ;

--
-- Name: productosview; Type: VIEW; Schema: public; Owner: udgaybsavmmsdn
--

CREATE VIEW public.productosview AS
 SELECT d.id_ticket,
    t.id_folio,
    t.cortesia AS cortesia_ticket,
    t.efectivo_porcentaje AS descontar_ticket,
    d.id_producto,
    d.cantidad,
        CASE
            WHEN (d.cortesia IS NULL) THEN (p.precio * (d.cantidad)::double precision)
            WHEN (d.cortesia = 1) THEN ((p.precio * (d.cantidad)::double precision) - d.efectivo_porcentaje)
            WHEN (d.cortesia = 2) THEN ((p.precio * (d.cantidad)::double precision) - (((p.precio * (d.cantidad)::double precision) * d.efectivo_porcentaje) / (100)::double precision))
            WHEN (d.cortesia = 3) THEN (0)::double precision
            ELSE NULL::double precision
        END AS precio_total,
    p.nombre,
    p.precio AS unitario,
    d.cortesia
   FROM ((public.detalle_ticket d
     JOIN public.productos p ON ((p.id_producto = d.id_producto)))
     JOIN public.tickets t ON ((t.id_ticket = d.id_ticket)))
  WHERE ((d.cancelado = false) AND ((d.cortesia <> 3) OR (d.cortesia IS NULL)));


ALTER TABLE public.productosview ;

--
-- Name: promociones; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.promociones (
    id integer NOT NULL,
    nombre character varying,
    descripcion character varying,
    inicia character varying,
    termina character varying,
    precio double precision,
    dias character varying,
    productos character varying,
    productoscodificado character varying
);


ALTER TABLE public.promociones ;

--
-- Name: promociones_id_seq; Type: SEQUENCE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE SEQUENCE public.promociones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promociones_id_seq ;

--
-- Name: promociones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: udgaybsavmmsdn
--

ALTER SEQUENCE public.promociones_id_seq OWNED BY public.promociones.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.roles (
    rol character varying NOT NULL,
    descripcion character varying,
    id integer NOT NULL
);


ALTER TABLE public.roles ;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq ;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: udgaybsavmmsdn
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: subcategoria; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.subcategoria (
    nombre character varying,
    submenu_enlazado integer,
    id integer NOT NULL,
    id_categoria integer,
    id_subcategoria integer
);


ALTER TABLE public.subcategoria ;

--
-- Name: subcategoria_id_seq; Type: SEQUENCE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE SEQUENCE public.subcategoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subcategoria_id_seq ;

--
-- Name: subcategoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: udgaybsavmmsdn
--

ALTER SEQUENCE public.subcategoria_id_seq OWNED BY public.subcategoria.id;


--
-- Name: tickets_id_ticket_seq; Type: SEQUENCE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE SEQUENCE public.tickets_id_ticket_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tickets_id_ticket_seq ;

--
-- Name: tickets_id_ticket_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: udgaybsavmmsdn
--

ALTER SEQUENCE public.tickets_id_ticket_seq OWNED BY public.tickets.id_ticket;


--
-- Name: tipo_producto; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.tipo_producto (
    nombre character varying,
    descripcion character varying,
    id_tipoproducto integer NOT NULL
);


ALTER TABLE public.tipo_producto ;

--
-- Name: tipo_producto_id_tipoproducto_seq; Type: SEQUENCE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE SEQUENCE public.tipo_producto_id_tipoproducto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_producto_id_tipoproducto_seq ;

--
-- Name: tipo_producto_id_tipoproducto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: udgaybsavmmsdn
--

ALTER SEQUENCE public.tipo_producto_id_tipoproducto_seq OWNED BY public.tipo_producto.id_tipoproducto;


--
-- Name: users; Type: TABLE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE TABLE public.users (
    login character varying NOT NULL,
    nombre character varying,
    id_rol integer,
    password character varying,
    id_sucursal integer,
    menu boolean,
    catalogos boolean,
    bar boolean,
    cocina boolean,
    cuentas boolean,
    transacciones boolean,
    id integer NOT NULL,
    inicio boolean,
    gestion_usuarios boolean,
    sucursales boolean,
    mesas boolean,
    caja boolean,
    productos boolean,
    historial_cuentas boolean,
    reportes boolean,
    autorizar boolean,
    inventario boolean,
    configuraciones boolean,
    iniciar_en integer
);


ALTER TABLE public.users ;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: udgaybsavmmsdn
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq ;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: udgaybsavmmsdn
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: categoria id; Type: DEFAULT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id SET DEFAULT nextval('public.categoria_id_seq'::regclass);


--
-- Name: categoria_insumos id; Type: DEFAULT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.categoria_insumos ALTER COLUMN id SET DEFAULT nextval('public.categoria_insumos_id_seq'::regclass);


--
-- Name: combos id_combo; Type: DEFAULT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.combos ALTER COLUMN id_combo SET DEFAULT nextval('public.combos_id_combo_seq'::regclass);


--
-- Name: control_movimientos id_control; Type: DEFAULT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.control_movimientos ALTER COLUMN id_control SET DEFAULT nextval('public.control_movimientos_id_control_seq'::regclass);


--
-- Name: correos id; Type: DEFAULT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.correos ALTER COLUMN id SET DEFAULT nextval('public.correos_id_seq'::regclass);


--
-- Name: corte_caja id; Type: DEFAULT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.corte_caja ALTER COLUMN id SET DEFAULT nextval('public.corte_caja_id_seq'::regclass);


--
-- Name: detalle_ticket id; Type: DEFAULT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.detalle_ticket ALTER COLUMN id SET DEFAULT nextval('public.detalle_ticket_id_seq'::regclass);


--
-- Name: insumos id; Type: DEFAULT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.insumos ALTER COLUMN id SET DEFAULT nextval('public.insumos_id_seq'::regclass);


--
-- Name: inventario id_inventario; Type: DEFAULT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.inventario ALTER COLUMN id_inventario SET DEFAULT nextval('public.inventario_id_inventario_seq'::regclass);


--
-- Name: key serial; Type: DEFAULT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.key ALTER COLUMN serial SET DEFAULT nextval('public.key_serial_seq'::regclass);


--
-- Name: productos id_producto; Type: DEFAULT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.productos ALTER COLUMN id_producto SET DEFAULT nextval('public.productos_id_producto_seq'::regclass);


--
-- Name: promociones id; Type: DEFAULT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.promociones ALTER COLUMN id SET DEFAULT nextval('public.promociones_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: subcategoria id; Type: DEFAULT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.subcategoria ALTER COLUMN id SET DEFAULT nextval('public.subcategoria_id_seq'::regclass);


--
-- Name: sucursales id; Type: DEFAULT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.sucursales ALTER COLUMN id SET DEFAULT nextval('public.carrito_id_seq'::regclass);


--
-- Name: tickets id_ticket; Type: DEFAULT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.tickets ALTER COLUMN id_ticket SET DEFAULT nextval('public.tickets_id_ticket_seq'::regclass);


--
-- Name: tipo_producto id_tipoproducto; Type: DEFAULT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.tipo_producto ALTER COLUMN id_tipoproducto SET DEFAULT nextval('public.tipo_producto_id_tipoproducto_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.categoria (nombre, descripcion, submenu, id) FROM stdin;
GENERAL	GENERAL	t	124
DESAYUNOS	DESAYUNOS	t	125
DESAYUNOS DOMINICALES	DESAYUNOS DOMINICALES	t	126
PANADERÍA 	Pan recién horneado 	f	127
PASTELES	POSTRES	t	114
PROMOCIONES 	Promos del mes	t	130
EXTRAS	PROTEÍNAS 	f	131
EVENTOS	Eventos	f	132
SUGERENCIAS	Menú	f	134
\.


--
-- Data for Name: categoria_insumos; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.categoria_insumos (id, categ_desc) FROM stdin;
\.


--
-- Data for Name: combos; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.combos (id_combo, nombre, descripcion, precio) FROM stdin;
16	COMBO AMIGO	ES UN COMBO DE AMIGO	300
15	COMBO1	COBMO DESCRIPCION	324
18	SAMV	DSOF	0
\.


--
-- Data for Name: control_movimientos; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.control_movimientos (cantidad, tipo_mov, id_inventario, ubicacion, id_sucursal, fecha, id_usuario, id_control, observaciones) FROM stdin;
40	+	2	COCINA	3	2019-07-31 23:38:46.636239+00	1	1	\N
10	+	3	COCINA	3	2019-08-02 21:15:35.156152+00	1	2	\N
35	-	2	COCINA	3	2019-08-02 21:16:46.528803+00	1	3	\N
10	+	2	COCINA	3	2019-08-02 21:27:49.658466+00	1	4	\N
50	+	5	COCINA	3	2019-08-03 18:02:46.916099+00	1	5	\N
3294	#	6	COCINA	3	2019-08-06 12:55:46.574442	0	6	\N
100000	#	7	COCINA	3	2019-08-06 12:57:13.076856	0	7	\N
20000	#	8	COCINA	3	2019-08-06 12:57:56.133049	0	8	\N
1000	+	2	COCINA	3	2019-08-06 16:09:33.129587	1	9	\N
100	+	2	COCINA	3	2019-08-07 18:33:13.541108	1	10	\N
1	#	9	COCINA	3	2019-09-02 08:03:44.254175	0	11	\N
1	#	10	COCINA	3	2019-09-02 08:04:41.322215	0	12	\N
1	#	11	COCINA	3	2019-09-02 08:05:10.083798	0	13	\N
1	#	12	COCINA	3	2019-09-02 08:06:05.267772	0	14	\N
1	#	13	COCINA	3	2019-09-02 08:06:48.659601	0	15	\N
1	#	14	COCINA	3	2019-09-02 08:07:32.389457	0	16	\N
1	#	15	COCINA	3	2019-09-02 08:08:07.540919	0	17	\N
1	#	16	COCINA	3	2019-09-02 08:08:41.347926	0	18	\N
1	#	17	COCINA	3	2019-09-02 08:09:06.632789	0	19	\N
1	#	18	COCINA	3	2019-09-02 08:09:31.950773	0	20	\N
4	+	17	COCINA	3	2019-09-02 08:15:38.120789	1	21	\N
10	+	17	COCINA	3	2019-09-02 08:18:35.751395	1	22	\N
13	+	18	COCINA	3	2019-09-02 08:18:57.428681	1	23	\N
5	+	12	COCINA	3	2019-09-02 08:19:38.356104	1	24	\N
4	+	13	COCINA	3	2019-09-02 08:20:01.353902	1	25	\N
5	+	10	COCINA	3	2019-09-02 08:20:25.29715	1	26	\N
4	+	11	COCINA	3	2019-09-02 08:20:47.725404	1	27	\N
5	+	16	COCINA	3	2019-09-02 08:21:12.686486	1	28	\N
14	#	19	COCINA	3	2019-09-02 08:22:04.834804	0	29	\N
1	#	20	COCINA	3	2019-09-02 09:03:46.331112	0	30	\N
1	#	21	COCINA	3	2019-09-02 09:04:21.189319	0	31	\N
1	#	22	COCINA	3	2019-09-02 09:04:59.636537	0	32	\N
1	#	23	COCINA	3	2019-09-02 09:05:54.708833	0	33	\N
1	#	24	COCINA	3	2019-09-02 09:06:53.230467	0	34	\N
1	#	25	COCINA	3	2019-09-02 09:07:53.552994	0	35	\N
1	#	26	COCINA	3	2019-09-02 09:08:40.343627	0	36	\N
1	#	27	COCINA	3	2019-09-02 09:09:28.407334	0	37	\N
1	#	28	COCINA	3	2019-09-02 09:10:42.312979	0	38	\N
1	#	29	COCINA	3	2019-09-02 09:12:49.830552	0	39	\N
1	#	30	COCINA	3	2019-09-02 09:13:34.791513	0	40	\N
1	#	31	COCINA	3	2019-09-02 09:14:17.548971	0	41	\N
1	#	32	COCINA	3	2019-09-02 09:15:05.28944	0	42	\N
6	+	28	COCINA	3	2019-09-02 09:21:54.426426	1	43	\N
5	+	22	COCINA	3	2019-09-02 09:27:55.525799	1	44	\N
11	+	20	COCINA	3	2019-09-02 09:28:32.57593	1	45	\N
21	+	31	COCINA	3	2019-09-02 09:30:07.955355	1	46	\N
2	#	33	COCINA	3	2019-09-02 09:45:51.374356	0	47	\N
5	+	23	COCINA	3	2019-09-02 09:46:38.816243	1	48	\N
7	+	25	COCINA	3	2019-09-02 09:50:31.427685	1	49	\N
288	#	34	COCINA	3	2019-09-02 10:04:53.852447	0	50	\N
35	#	35	COCINA	3	2019-09-02 10:05:34.885773	0	51	\N
0	#	36	COCINA	3	2019-09-02 10:06:28.88751	0	52	\N
32	#	37	COCINA	3	2019-09-02 10:07:17.677541	0	53	\N
29	#	38	COCINA	3	2019-09-02 10:08:15.416877	0	54	\N
9	#	39	COCINA	3	2019-09-02 10:08:56.587124	0	55	\N
5	#	40	COCINA	3	2019-09-02 10:10:01.480256	0	56	\N
45	#	41	COCINA	3	2019-09-02 10:34:35.471219	0	57	\N
1	#	42	COCINA	3	2019-09-02 10:37:22.610763	0	58	\N
1	#	43	COCINA	3	2019-09-02 10:42:02.433128	0	59	\N
1	#	44	COCINA	3	2019-09-02 10:43:20.837132	0	60	\N
19	#	45	COCINA	3	2019-09-02 10:44:46.512439	0	61	\N
8	#	46	COCINA	3	2019-09-02 10:47:01.966594	0	62	\N
6	#	47	COCINA	3	2019-09-02 10:48:56.958982	0	63	\N
8	#	48	COCINA	3	2019-09-02 12:26:00.135564	0	64	\N
12	#	49	COCINA	3	2019-09-02 12:26:34.862103	0	65	\N
50	#	50	COCINA	3	2019-09-02 13:07:15.104244	0	66	\N
38	+	42	COCINA	3	2019-09-02 15:43:07.169984	1	67	\N
12	+	40	BODEGA	3	2019-09-02 22:06:00.847966	10	68	\N
12	+	39	BODEGA	3	2019-09-02 22:06:42.600883	10	69	\N
6	+	43	COCINA	3	2019-09-02 22:07:42.75736	10	70	\N
3	+	44	COCINA	3	2019-09-02 22:09:06.758236	10	71	\N
10	+	46	COCINA	3	2019-09-02 22:09:53.671494	10	72	\N
6	-	28	COCINA	3	2019-09-03 08:08:37.273087	10	73	\N
\.


--
-- Data for Name: correos; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.correos (id, correo) FROM stdin;
\.


--
-- Data for Name: corte_caja; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.corte_caja (id, fecha, total, id_sucursal, efectivo_apertura, cerrada, id_cortecaja, hora) FROM stdin;
1	2019-09-04	0	3	700	t	\N	06:46:00.736413+00
2	2019-09-04	0	3	850	t	\N	08:39:33.662377+00
3	2019-09-05	0	3	286	t	\N	08:35:24.601932+00
4	2019-09-06	0	3	293.5	t	\N	08:34:17.417461+00
5	2019-09-06	0	3	250	t	\N	16:28:52.324873+00
6	2019-09-06	0	3	450	t	\N	16:29:33.490675+00
7	2019-09-09	0	3	165.5	t	\N	10:47:24.686131+00
8	2019-09-09	0	3	1604.5	t	\N	16:06:11.189774+00
9	2019-09-10	0	3	60.5	t	\N	08:04:21.509766+00
10	2019-09-10	0	3	2515.5	t	\N	15:33:16.742662+00
11	2019-09-11	0	3	280.5	t	\N	09:30:09.123319+00
12	2019-09-11	0	3	1045.5	t	\N	15:22:38.517507+00
13	2019-09-12	0	3	280.5	t	\N	08:01:03.817633+00
14	2019-09-12	0	3	1564.5	t	\N	15:16:54.310847+00
15	2019-09-13	0	3	280.5	t	\N	08:03:38.930287+00
16	2019-09-13	0	3	3463.5	t	\N	15:42:13.218945+00
17	2019-09-14	0	3	280.5	t	\N	07:09:44.548929+00
18	2019-09-14	0	3	1229.5	t	\N	15:29:06.693903+00
19	2019-09-15	0	3	280.5	t	\N	09:59:25.108187+00
20	2019-09-16	0	3	175.5	t	\N	07:22:53.802939+00
21	2019-09-17	0	3	225.5	t	\N	07:48:41.039697+00
22	2019-09-17	0	3	1021.5	t	\N	15:59:22.682472+00
23	2019-09-18	0	3	225.5	t	\N	08:07:36.681464+00
24	2019-09-18	0	3	956.5	t	\N	15:26:08.650375+00
25	2019-09-19	0	3	173.5	t	\N	08:40:46.214831+00
26	2019-09-19	0	3	2085.5	t	\N	15:46:48.261781+00
27	2019-09-20	0	3	223	t	\N	11:46:46.530218+00
28	2019-09-20	0	3	2305.5	t	\N	15:58:17.917517+00
29	2019-09-21	0	3	223.5	t	\N	08:11:29.759817+00
30	2019-09-21	0	3	1548.5	t	\N	15:37:39.891538+00
31	2019-09-22	0	3	223	t	\N	23:06:30.778252+00
32	2019-09-23	0	3	223	t	\N	07:11:06.350859+00
33	2019-09-23	0	3	0	t	\N	15:59:59.679615+00
34	2019-09-24	0	3	323	t	\N	07:06:35.988931+00
35	2019-09-24	0	3	1866	t	\N	15:08:50.549006+00
36	2019-09-25	0	3	336	t	\N	11:10:35.769131+00
37	2019-09-25	0	3	2630	t	\N	15:29:07.13687+00
38	2019-09-26	0	3	323	t	\N	08:12:39.099875+00
39	2019-09-26	0	3	672	t	\N	15:36:47.181028+00
40	2019-09-27	0	3	341	t	\N	07:09:23.168756+00
41	2019-09-27	0	3	2650	t	\N	15:18:56.664721+00
42	2019-09-28	0	3	327	t	\N	07:08:51.477703+00
43	2019-09-28	0	3	327	t	\N	23:43:43.84741+00
44	2019-09-29	0	3	229	t	\N	13:37:39.084257+00
45	2019-09-29	0	3	229	t	\N	22:32:46.347824+00
46	2019-09-30	0	3	228.5	t	\N	07:16:31.967281+00
47	2019-09-30	0	3	2946.5	t	\N	15:34:09.708958+00
48	2019-10-01	0	3	533.5	t	\N	14:32:52.964052+00
49	2019-10-01	0	3	279.5	t	\N	15:41:11.763482+00
50	2019-10-02	0	3	376	f	\N	07:02:17.476425+00
\.


--
-- Data for Name: detalle_combos; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.detalle_combos (id_combo, id_productos, cantidad) FROM stdin;
16	18	2
16	23	1
15	18	1
15	23	2
23	18	1
23	22	1
23	19	5
\.


--
-- Data for Name: detalle_promociones; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.detalle_promociones (id_promocion, id_productos, cantidad) FROM stdin;
23	1	8
\.


--
-- Data for Name: detalle_ticket; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.detalle_ticket (id_ticket, id_producto, cantidad, servido, observaciones, id, tipo_producto, fecharegistro, cancelado, cortesia, efectivo_porcentaje) FROM stdin;
\.


--
-- Data for Name: entradas; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.entradas (total, id_sucursal, id_usuario, nombre, id_cortecaja) FROM stdin;
500	3	1	EFECTIVO GUILLERMO	4
50	3	1	Faltante	6
600	3	9	Agua, lechuga y Coca-Cola	7
935	3	9	Pastigel	7
40	3	11	Cambio	8
370	3	9	Coca-Cola	9
108	3	9	Cambio	9
600	3	9	Todo para la Limpieza	11
1400	3	9	Pepsi y cafe	13
100	3	9	Cambio	13
1400	3	9	Lyncott	15
1400	3	9	Pastigel	15
40	3	11	Cambio	16
600	3	9	Gas	17
900	3	9	Lyncott	17
500	3	9	Lyncott	17
127	3	9	Cambio	17
200	3	9	Cambio	20
540	3	9	Boing	23
200	3	11	Cambio	24
700	3	9	Pepsi	25
700	3	10	Gas	29
200	3	10	Gas	29
1000	3	9	Gastos generales	32
490	3	11	Salud y sabor	33
1500	3	9	Desechables	34
500	3	9	Pepsi	34
500	3	9	Agua 	34
600	3	11	Boing	35
1900	3	9	Gastos generales	36
700	3	12	Pago viernes	37
50	3	12	Cambio	37
1500	3	9	Gastos generales	38
1486	3	11	Lyncot	39
500	3	9	General	46
350	3	9	Pepsi	48
50	3	9	Pepsi	48
\.


--
-- Data for Name: gastos; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.gastos (total, id_sucursal, id_usuario, nombre, id_cortecaja) FROM stdin;
8	3	9	Tortilla	13
778	3	9	Pepsi	13
10	3	9	Telera	13
780	3	9	Cafe	13
670	3	9	Sandy	13
15	3	9	Teleras	1
1200	3	9	Lincont	1
580	3	9	Pepsi	1
1500	3	9	Salud y sabor	1
519	3	9	Todo para la limpieza	1
8	3	9	Tortilla verytan	1
2000	3	9	Coca	1
800	3	9	Sandy	1
15	3	9	Teleras	1
1200	3	9	Lincont	1
580	3	9	Pepsi	1
1500	3	9	Salud y sabor	1
519	3	9	Todo para la limpieza	1
8	3	9	Tortilla verytan	1
2000	3	9	Coca	1
800	3	9	Sandy	1
1500	3	9	Cafe	1
700	3	9	Gas	1
34	3	9	Agua	1
10	3	9	Telera(Ray)	3
248.5	3	9	Farmacias Guelaguetza	3
117	3	9	Tomate	3
102	3	9	Lechuga	3
25	3	1	Pago mario	4
10	3	9	Telera	15
68	3	9	Agua	15
51	3	9	Hielo	7
10	3	9	Telera	7
8	3	9	Tortillas	7
69	3	9	Pastigel	7
1546	3	9	Pastigel	7
371	3	9	Coca-Cola	7
34	3	9	Hielo	15
0	3	11		8
102	3	11	Agua	8
8	3	9	Tortilla	9
10	3	9	Telera	9
176	3	9	Lechuga	9
290	3	9	Coca-Cola	9
710	3	9	Boing	11
130	3	9	Tomate	11
10	3	9	Telera	11
111	3	9	Lechuga	15
82.5	3	11	Crema para batir	16
1584	3	11	Salud y sabor	16
1468	3	11	Pasthigel	16
1809	3	9	Lyncott	17
702	3	9	Gas	17
8	3	9	Tortilla	21
10	3	9	Telera	21
200	3	9	Pago herrero	21
10	3	9	Telera	23
710	3	9	Boing	23
34	3	9	Hielo	23
8	3	9	Tortilla	25
10	3	9	Telera	25
856	3	9	Pepsi	25
68	3	9	Agua	25
1477	3	11	Lyncott	28
600	3	11	Agua	28
894	3	10	Gss	29
8	3	9	Tortilla	32
10	3	9	Telera	32
446.5	3	9	Gas	32
661.5	3	9	Sandy	32
102	3	9	Agua	32
10	3	9	Telera	34
1780	3	9	Desechables	34
1471	3	11	Salud y sabor 	35
550	3	11	Boing	35
8	3	9	Tortilla	36
10	3	9	Telera	36
1097	3	9	Florida	36
93	3	9	Levadura	36
34	3	9	Hielo	36
8	3	9	Tortilla	38
10	3	9	Telera	38
960	3	9	Pepsi	38
1064	3	9	Pastigel	38
51	3	9	Agua	38
584	3	9	Sandi	38
1486	3	11	Lyncot	39
10	3	9	Telera	40
185	3	9	Lechuga	40
1591	3	12	Salud y sabor	41
8	3	9	Tortilla	46
10	3	9	Telera	46
34	3	9	Hielo	46
28	3	9	La soledad	46
1616	3	11	Boing	47
2000	3	11	Memo	47
1500	3	11	Memo	47
\.


--
-- Data for Name: historico_detalletickets; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.historico_detalletickets (id_ticket, id_producto, cantidad, observaciones, cancelado, total, cortesia, efectivo_porcentaje) FROM stdin;
547	768	1		f	15	\N	\N
547	768	1		f	15	\N	\N
547	768	2		t	0	\N	\N
547	795	1		f	25	\N	\N
547	799	1		f	32	\N	\N
557	487	1		f	60	\N	\N
557	683	1		f	18	\N	\N
557	683	1		f	18	\N	\N
557	488	1		f	60	\N	\N
557	704	1		f	38	\N	\N
559	634	1		f	70	\N	\N
559	636	1		f	80	\N	\N
559	487	1		f	60	\N	\N
559	683	1		f	18	\N	\N
559	769	2	Pan yema	f	50	\N	\N
559	686	1	Deslactosado	f	28	\N	\N
559	689	1		f	32	\N	\N
559	715	1	Marroqui	f	35	\N	\N
559	720	2		f	130	\N	\N
559	778	1		f	28	\N	\N
566	485	1		f	65	\N	\N
566	612	1	Masa gruesa	f	120	\N	\N
568	730	1		f	110	\N	\N
568	731	1		f	115	\N	\N
571	493	1		f	60	\N	\N
571	672	1		f	125	\N	\N
571	683	1		f	18	\N	\N
571	768	1		f	15	\N	\N
571	769	2		f	50	\N	\N
571	687	1		f	25	\N	\N
571	687	4		f	100	\N	\N
571	711	3		f	144	\N	\N
571	711	1		f	48	\N	\N
571	797	1		f	35	\N	\N
571	723	1		f	80	\N	\N
571	821	1		f	35	\N	\N
570	683	2		f	36	\N	\N
570	770	1		f	25	\N	\N
570	771	1		f	25	\N	\N
570	728	1		f	95	\N	\N
572	635	2		f	120	\N	\N
572	770	2		f	50	\N	\N
584	487	1		f	60	\N	\N
584	768	1		f	15	\N	\N
584	703	1		f	35	\N	\N
584	778	1		f	28	\N	\N
574	683	3		f	54	\N	\N
574	775	1		f	25	\N	\N
574	717	1		f	20	\N	\N
574	718	1		f	25	\N	\N
597	662	1		f	95	\N	\N
597	683	3		f	54	\N	\N
597	797	1		f	35	\N	\N
598	767	1		f	15	\N	\N
598	768	1		f	15	\N	\N
598	769	1		f	25	\N	\N
598	718	1		f	25	\N	\N
605	483	4		f	260	\N	\N
605	633	3		f	210	\N	\N
605	674	3		f	435	\N	\N
605	762	3		f	30	\N	\N
605	764	3		f	105	\N	\N
605	816	1		f	35	\N	\N
605	716	4		f	240	\N	\N
606	770	2		f	50	\N	\N
606	620	2		f	420	\N	\N
603	468	2		f	800	\N	\N
615	641	5		f	300	\N	\N
615	799	1		f	32	\N	\N
615	801	4		f	168	\N	\N
616	733	1		f	110	\N	\N
617	730	1		f	110	\N	\N
617	732	1		f	110	\N	\N
617	733	1		f	110	\N	\N
618	679	1		f	75	\N	\N
618	683	1		f	18	\N	\N
618	795	1		f	25	\N	\N
619	643	2		f	156	\N	\N
619	799	2		f	64	\N	\N
619	724	1		f	90	\N	\N
626	485	1		f	65	\N	\N
631	715	1	Marroqui	f	35	\N	\N
631	822	1		f	45	\N	\N
635	768	1	Cuernito	f	15	\N	\N
635	769	2	Rol	f	50	\N	\N
635	715	1	Fantasía 	f	35	\N	\N
635	716	2	Marroquí, fantasía 	f	120	\N	\N
643	730	1		f	110	\N	\N
643	732	1		f	110	\N	\N
643	734	1		f	115	\N	\N
643	683	1		f	18	\N	\N
649	643	1		f	78	\N	\N
649	731	1		f	115	\N	\N
649	795	1		f	25	\N	\N
644	730	1		f	110	\N	\N
646	731	4		f	460	\N	\N
646	769	1		f	25	\N	\N
656	467	1		f	330	\N	\N
664	683	1		f	18	\N	\N
659	783	1		f	55	\N	\N
659	484	1		f	65	\N	\N
659	814	1		f	50	\N	\N
659	777	1		f	28	\N	\N
663	671	1		f	140	\N	\N
663	679	1		f	75	\N	\N
663	687	1		f	25	\N	\N
667	683	1		f	18	\N	\N
667	683	1		f	18	\N	\N
667	683	1		f	18	\N	\N
667	826	1		f	60	\N	\N
674	769	1	Mango	f	25	\N	\N
683	630	1		f	80	\N	\N
689	730	1		f	110	\N	\N
689	731	1		f	115	\N	\N
689	734	1		f	115	\N	\N
689	683	3		f	54	\N	\N
689	683	1		f	18	\N	\N
689	795	1		f	25	\N	\N
690	643	1		f	78	\N	\N
690	683	1		f	18	\N	\N
690	687	1		f	25	\N	\N
690	687	1		f	25	\N	\N
690	694	1		f	28	\N	\N
690	694	4		f	112	\N	\N
690	694	1		f	28	\N	\N
690	795	1		f	25	\N	\N
690	797	1		f	35	\N	\N
690	822	1		f	45	\N	\N
697	696	1		f	35	\N	\N
698	643	1		f	78	\N	\N
699	487	1		f	60	\N	\N
702	482	1		f	60	\N	\N
703	483	1		f	65	\N	\N
710	663	1		f	80	\N	\N
710	776	1		f	28	\N	\N
710	821	1		f	35	\N	\N
714	731	1	Solo claras	f	115	\N	\N
714	816	1		f	35	\N	\N
723	663	2	Fetuchini	f	160	\N	\N
723	669	1	Fusilli	f	80	\N	\N
723	820	1		f	120	\N	\N
725	493	1		f	60	\N	\N
732	718	1		f	25	\N	\N
733	766	16		f	320	\N	\N
740	683	1		f	18	\N	\N
740	694	2		f	56	\N	\N
740	694	1		f	28	\N	\N
740	694	1		f	28	\N	\N
740	694	1		f	28	\N	\N
740	696	2		f	70	\N	\N
740	795	2		f	50	\N	\N
740	797	2		f	70	\N	\N
740	833	1		f	40	\N	\N
740	833	2		f	80	\N	\N
558	705	2		f	76	\N	\N
565	672	1	Feruchini	f	125	\N	\N
565	695	1		f	38	\N	\N
565	715	1		f	35	\N	\N
565	614	1		f	120	\N	\N
567	730	2		f	220	\N	\N
567	770	1		f	25	\N	\N
569	733	1		f	110	\N	\N
573	629	1	Con Philadelphia	f	60	\N	\N
583	631	1		f	78	\N	\N
583	673	1		f	145	\N	\N
583	695	1		f	38	\N	\N
583	718	1		f	25	\N	\N
591	732	1		f	110	\N	\N
599	662	1		f	95	\N	\N
599	662	3		f	285	\N	\N
621	779	2		f	56	\N	\N
621	614	1		f	120	\N	\N
610	683	1		f	18	\N	\N
610	795	2		f	50	\N	\N
622	683	3		f	54	\N	\N
622	694	1		f	28	\N	\N
622	694	3		f	84	\N	\N
622	694	5		f	140	\N	\N
622	696	2		f	70	\N	\N
622	716	1	Marroqui	f	60	\N	\N
622	801	1		f	42	\N	\N
629	484	1		f	65	\N	\N
641	768	1	Cuernito	f	15	\N	\N
641	769	4	2Conchas.1pan mango.1pan llema	f	100	\N	\N
645	683	2		f	36	\N	\N
645	795	3		f	75	\N	\N
647	643	2		f	156	\N	\N
647	655	1		f	78	\N	\N
647	732	1		f	110	\N	\N
647	683	1		f	18	\N	\N
647	687	1		f	25	\N	\N
647	687	1		f	25	\N	\N
657	493	2		f	120	\N	\N
662	668	1	Fettuccini	f	140	\N	\N
662	493	2		f	120	\N	\N
662	694	1	Descafeinado 	f	28	\N	\N
662	706	1		f	38	\N	\N
668	731	2		f	230	\N	\N
668	683	2		f	36	\N	\N
675	767	1	Flor	f	15	\N	\N
679	485	1		f	65	\N	\N
679	493	1		f	60	\N	\N
679	696	1		f	35	\N	\N
679	698	1		f	38	\N	\N
684	483	1		f	65	\N	\N
684	493	1		f	60	\N	\N
684	763	1		f	35	\N	\N
684	765	1		f	35	\N	\N
681	488	1		f	60	\N	\N
681	715	1	Marroqui	f	35	\N	\N
681	717	1		f	20	\N	\N
681	618	1	Con aceitunas negras, 1/2 peperoni	f	210	\N	\N
691	643	1		f	78	\N	\N
691	733	1		f	110	\N	\N
691	799	2		f	64	\N	\N
692	695	1		f	38	\N	\N
692	797	1		f	35	\N	\N
700	615	1		f	120	\N	\N
701	703	3		f	105	\N	\N
701	709	2		f	90	\N	\N
704	483	1		f	65	\N	\N
704	694	1		f	28	\N	\N
704	695	1	Deslactosado	f	38	\N	\N
712	683	2		f	36	\N	\N
712	770	1		f	25	\N	\N
712	771	1		f	25	\N	\N
711	637	1		f	78	\N	\N
711	683	1		f	18	\N	\N
711	715	1	Moras	f	35	\N	\N
713	683	2		f	36	\N	\N
713	795	1		f	25	\N	\N
717	683	1		f	18	\N	\N
717	683	2		f	36	\N	\N
717	795	1		f	25	\N	\N
717	797	1		f	35	\N	\N
717	797	4		f	140	\N	\N
717	799	1		f	32	\N	\N
717	801	1		f	42	\N	\N
718	627	1		f	70	\N	\N
727	482	1		f	60	\N	\N
727	488	1		f	60	\N	\N
727	710	1		f	48	\N	\N
727	711	1		f	48	\N	\N
724	486	2		f	100	\N	\N
724	778	2		f	56	\N	\N
734	733	1		f	110	\N	\N
741	472	1		f	300	\N	\N
741	482	1		f	60	\N	\N
745	487	1		f	60	\N	\N
745	490	1	Dos platos	f	55	\N	\N
745	490	1		f	55	\N	\N
745	491	1		f	65	\N	\N
745	493	1		f	60	\N	\N
745	683	1		f	18	\N	\N
745	687	1		f	25	\N	\N
745	708	1		f	45	\N	\N
745	710	1		f	48	\N	\N
745	776	1		f	28	\N	\N
745	714	1		f	55	\N	\N
745	715	1	Manzanilla	f	35	\N	\N
745	722	2		f	130	\N	\N
747	493	1		f	60	\N	\N
747	768	1		f	15	\N	\N
747	687	1		f	25	\N	\N
747	709	1		f	45	\N	\N
747	615	1		f	120	\N	\N
748	478	1		f	360	\N	\N
753	769	2		f	50	\N	\N
752	732	1		f	110	\N	\N
752	749	1	1/2 orden de yogurt con berries	f	120	\N	\N
752	840	1		f	60	\N	\N
751	730	1	Sin crema, sin sebolla	f	110	\N	\N
751	733	1		f	110	\N	\N
751	683	1		f	18	\N	\N
751	816	2		f	70	\N	\N
757	667	1	Fusilli	f	115	\N	\N
757	619	1		f	210	\N	\N
756	624	1		f	90	\N	\N
756	841	1		f	55	\N	\N
765	658	1		f	70	\N	\N
765	656	1		f	55	\N	\N
765	483	1		f	65	\N	\N
765	696	2		f	70	\N	\N
764	483	1		f	65	\N	\N
764	493	1		f	60	\N	\N
764	688	1		f	32	\N	\N
764	716	1	Bora bora	f	60	\N	\N
764	716	1	Moras	f	60	\N	\N
764	720	1		f	65	\N	\N
764	831	1		f	23	\N	\N
764	831	1		f	23	\N	\N
773	629	1	Sin melon	f	60	\N	\N
773	705	1		f	38	\N	\N
774	843	2		f	100	\N	\N
775	683	2		f	36	\N	\N
775	770	1		f	25	\N	\N
775	771	1		f	25	\N	\N
775	837	1		f	250	\N	\N
775	842	1		f	65	\N	\N
777	482	1		f	60	\N	\N
777	710	1		f	48	\N	\N
777	711	1		f	48	\N	\N
777	842	1		f	65	\N	\N
781	629	1		f	60	\N	\N
781	676	1		f	85	\N	\N
562	705	1		f	38	\N	\N
563	683	1		f	18	\N	\N
556	487	1		f	60	\N	\N
556	683	2		f	36	\N	\N
556	686	1		f	28	\N	\N
556	775	1		f	25	\N	\N
556	718	1		f	25	\N	\N
575	629	1	Con Philadelphia	f	60	\N	\N
576	763	1		f	35	\N	\N
585	485	1		f	65	\N	\N
585	487	1		f	60	\N	\N
585	821	2		f	70	\N	\N
592	652	1		f	70	\N	\N
592	683	1		f	18	\N	\N
592	769	1		f	25	\N	\N
592	816	1		f	35	\N	\N
592	795	1		f	25	\N	\N
592	726	1		f	90	\N	\N
600	483	1		f	65	\N	\N
620	643	1		f	78	\N	\N
620	715	1	Marroqui	f	35	\N	\N
630	633	1		f	70	\N	\N
630	676	1		f	85	\N	\N
630	683	1		f	18	\N	\N
630	763	1		f	35	\N	\N
630	467	1		f	330	\N	\N
630	761	1		f	35	\N	\N
637	683	2		f	36	\N	\N
637	740	1		f	80	\N	\N
637	771	1		f	25	\N	\N
637	696	1		f	35	\N	\N
637	696	1		f	35	\N	\N
637	613	1		f	120	\N	\N
637	821	1		f	35	\N	\N
648	683	1		f	18	\N	\N
648	795	3		f	75	\N	\N
658	663	1		f	80	\N	\N
658	666	1		f	80	\N	\N
658	720	2		f	130	\N	\N
666	651	2		f	140	\N	\N
666	687	1		f	25	\N	\N
666	695	1		f	38	\N	\N
666	696	1		f	35	\N	\N
666	826	1		f	60	\N	\N
669	683	1		f	18	\N	\N
669	769	1		f	25	\N	\N
669	694	1		f	28	\N	\N
669	698	3		f	114	\N	\N
669	711	1		f	48	\N	\N
669	711	1		f	48	\N	\N
669	797	4		f	140	\N	\N
669	797	1		f	35	\N	\N
669	801	1		f	42	\N	\N
670	709	1		f	45	\N	\N
671	716	1	Fantasía tropical	f	60	\N	\N
677	471	1		f	250	\N	\N
677	479	1		f	360	\N	\N
677	813	3		f	150	\N	\N
676	764	1		f	35	\N	\N
676	763	1		f	35	\N	\N
676	766	1		f	20	1	15
680	683	3		f	54	\N	\N
680	683	3		f	54	\N	\N
680	769	1	Mango	f	25	\N	\N
680	770	1		f	25	\N	\N
680	771	1		f	25	\N	\N
685	703	2		f	70	\N	\N
693	654	1		f	80	\N	\N
693	730	1		f	110	\N	\N
693	683	1		f	18	\N	\N
696	482	3		f	180	\N	\N
705	483	1		f	65	\N	\N
705	683	2		f	36	\N	\N
705	488	1		f	60	\N	\N
716	625	1		f	200	\N	\N
716	630	1		f	80	\N	\N
716	631	1		f	78	\N	\N
716	634	1		f	70	\N	\N
716	714	1		f	55	\N	\N
716	714	2		f	110	\N	\N
715	683	2		f	36	\N	\N
715	683	1		f	18	\N	\N
715	718	1		f	25	\N	\N
715	777	1		f	28	\N	\N
715	777	1		f	28	\N	\N
721	627	2		t	0	\N	\N
721	627	2		f	140	\N	\N
721	639	1		t	0	\N	\N
721	639	1		f	70	\N	\N
721	482	1		f	60	\N	\N
721	485	1		f	65	\N	\N
721	493	1		f	60	\N	\N
721	664	1	Fettuccini	t	0	\N	\N
721	664	1	Fettuccini	f	115	\N	\N
721	680	1		t	0	\N	\N
721	680	1		f	100	\N	\N
721	683	2		f	36	\N	\N
721	770	1		t	0	\N	\N
721	770	1		f	25	\N	\N
721	770	1		f	25	\N	\N
721	773	2		t	0	\N	\N
721	773	2		f	50	\N	\N
721	694	1		f	28	\N	\N
735	767	5		f	75	\N	\N
736	631	1		f	78	\N	\N
736	716	2		f	120	\N	\N
737	766	2		f	40	\N	\N
744	683	1		f	18	\N	\N
744	769	1		f	25	\N	\N
744	687	1		f	25	\N	\N
744	794	1		f	5	\N	\N
743	764	1		f	35	\N	\N
743	716	2	Moras	f	120	\N	\N
743	778	1		f	28	\N	\N
743	621	1	Masa delgada	f	210	\N	\N
749	694	1		f	28	\N	\N
749	694	1		f	28	\N	\N
749	696	1		f	35	\N	\N
749	780	1		f	35	\N	\N
749	612	1	1/2jamon s	f	120	\N	\N
749	618	1	1/2jamon serrano	f	210	\N	\N
742	482	1		f	60	\N	\N
742	683	2		f	36	\N	\N
742	769	1	Concha	f	25	\N	\N
742	770	1		f	25	\N	\N
742	771	1		f	25	\N	\N
742	718	2		f	50	\N	\N
754	481	1		f	360	\N	\N
754	491	2		f	130	\N	\N
754	733	1		f	110	\N	\N
754	683	1		f	18	\N	\N
754	771	1		f	25	\N	\N
760	711	3		f	144	\N	\N
758	649	1		f	78	\N	\N
758	665	1	Fetuccini	f	140	\N	\N
758	483	1		f	65	\N	\N
758	673	2	Fetuccini	f	290	\N	\N
758	715	2	Moras	f	70	\N	\N
758	780	1		f	35	\N	\N
758	778	1		f	28	\N	\N
761	471	1		f	250	\N	\N
761	482	1		f	60	\N	\N
761	794	1		f	5	\N	\N
761	832	2		f	60	\N	\N
766	717	1		f	20	\N	\N
767	486	1		f	50	\N	\N
767	768	1		f	15	\N	\N
767	842	1		f	65	\N	\N
769	729	1	Sin crema	t	0	\N	\N
769	732	1		f	110	\N	\N
769	816	1		f	35	\N	\N
771	471	1		f	250	\N	\N
772	657	1		f	70	\N	\N
552	643	3		f	234	\N	\N
552	683	2		f	36	\N	\N
552	683	2		f	36	\N	\N
552	769	1		f	25	\N	\N
552	694	1		f	28	\N	\N
552	704	1		f	38	\N	\N
552	795	1		f	25	\N	\N
552	797	4		f	140	\N	\N
561	786	1		f	55	\N	\N
561	683	1		f	18	\N	\N
561	687	1		f	25	\N	\N
578	715	1	Marroquí	f	35	\N	\N
578	778	1		f	28	\N	\N
577	663	2		f	160	\N	\N
577	715	1	Moras. Frio	f	35	\N	\N
577	780	1		f	35	\N	\N
588	717	1		f	20	\N	\N
589	639	1		f	70	\N	\N
587	704	2		f	76	\N	\N
587	716	1	Borabora	f	60	\N	\N
587	778	1		f	28	\N	\N
579	709	1		f	45	\N	\N
579	780	1		f	35	\N	\N
590	762	2		f	20	\N	\N
594	731	1		f	115	\N	\N
593	733	2		f	220	\N	\N
593	770	1		f	25	\N	\N
601	467	1		f	330	\N	\N
602	726	1		f	90	\N	\N
604	673	2		f	290	\N	\N
604	683	3		f	54	\N	\N
623	683	2		f	36	\N	\N
632	490	1		f	55	\N	\N
632	686	1		f	28	\N	\N
632	691	1		f	55	\N	\N
628	694	1		f	28	\N	\N
628	694	2		f	56	\N	\N
634	694	1		f	28	\N	\N
633	667	1		f	115	\N	\N
633	672	1		f	125	\N	\N
633	761	1		f	35	\N	\N
633	770	1		f	25	\N	\N
633	773	1		f	25	\N	\N
650	683	2		f	36	\N	\N
650	728	1		f	95	\N	\N
651	715	1	Manzanilla	f	35	\N	\N
651	728	1		f	95	\N	\N
652	683	1		f	18	\N	\N
652	770	1		f	25	\N	\N
652	728	1		f	95	\N	\N
653	716	1		f	60	\N	\N
654	630	1		f	80	\N	\N
654	715	1		f	35	\N	\N
655	484	1		f	65	\N	\N
655	716	1		f	60	\N	\N
660	683	1		f	18	\N	\N
665	687	1		f	25	\N	\N
665	720	2		f	130	\N	\N
665	616	1		f	145	\N	\N
672	627	1		f	70	\N	\N
672	686	1		f	28	\N	\N
672	710	1		f	48	\N	\N
678	683	1		f	18	\N	\N
678	769	1	Rol	f	25	\N	\N
686	679	1		f	75	\N	\N
686	695	1		f	38	\N	\N
686	720	1		f	65	\N	\N
695	662	1		f	95	\N	\N
695	715	1	Moras de la selva frio	f	35	\N	\N
707	683	1		f	18	\N	\N
707	775	1		f	25	\N	\N
708	486	1		f	50	\N	\N
708	487	1		f	60	\N	\N
708	703	1		f	35	\N	\N
708	778	1		f	28	\N	\N
706	627	1		f	70	\N	\N
706	482	1		f	60	\N	\N
706	482	1		f	60	\N	\N
706	771	1		f	25	\N	\N
706	689	1		f	32	\N	\N
706	694	1		f	28	\N	\N
719	683	1		f	18	\N	\N
719	768	1	Carterita	f	15	\N	\N
728	777	2		f	56	\N	\N
722	629	2		f	120	\N	\N
722	653	1		f	60	\N	\N
722	679	1		f	75	\N	\N
722	687	1		f	25	\N	\N
722	771	1		f	25	\N	\N
722	694	1		f	28	\N	\N
722	703	1		f	35	\N	\N
722	713	1		f	55	\N	\N
738	639	1		f	70	\N	\N
738	483	1		f	65	\N	\N
738	761	1		f	35	\N	\N
738	703	1		f	35	\N	\N
738	795	1		f	25	\N	\N
738	799	1		f	32	\N	\N
738	716	1	Frío marroquí	f	60	\N	\N
739	493	1		f	60	\N	\N
739	814	2		f	100	\N	\N
746	769	1	Yema	f	25	\N	\N
746	695	1	Frio	f	38	\N	\N
746	707	1		f	45	\N	\N
750	490	1		f	55	\N	\N
750	694	1		f	28	\N	\N
750	694	2		f	56	\N	\N
755	649	1		f	78	\N	\N
755	651	1		f	70	\N	\N
755	485	1		f	65	\N	\N
755	486	1		f	50	\N	\N
755	776	1		f	28	\N	\N
755	778	1		f	28	\N	\N
762	666	1	Fetuccini	f	80	\N	\N
762	721	1		f	250	\N	\N
762	613	1	Delgada	f	120	\N	\N
763	683	1		f	18	\N	\N
763	683	1		f	18	\N	\N
763	769	1		f	25	\N	\N
759	718	1		f	25	\N	\N
768	485	1		f	65	\N	\N
768	695	1		f	38	\N	\N
768	696	1		f	35	\N	\N
768	842	1		f	65	\N	\N
770	729	1		f	100	\N	\N
770	733	1		f	110	\N	\N
770	687	1		f	25	\N	\N
772	672	1	Fetuccini sin cebolla	f	125	\N	\N
772	680	1		f	100	\N	\N
772	839	3		f	165	\N	\N
780	482	1		f	60	\N	\N
780	491	1		f	65	\N	\N
780	769	2	Mango	f	50	\N	\N
780	842	1		f	65	\N	\N
779	689	1		f	32	\N	\N
779	716	1	Marroqui	f	60	\N	\N
778	482	2		f	120	\N	\N
778	672	1	Fusilli	f	125	\N	\N
778	775	1		f	25	\N	\N
778	696	1		f	35	\N	\N
778	705	1		f	38	\N	\N
778	715	1		f	35	\N	\N
781	714	2	Tmarindo	f	110	\N	\N
776	486	1		f	50	\N	\N
776	648	1		f	80	\N	\N
776	703	1		f	35	\N	\N
776	710	1		f	48	\N	\N
776	717	1		f	20	\N	\N
782	720	2		f	130	\N	\N
782	623	1		f	230	\N	\N
786	651	1		f	70	\N	\N
786	814	2		f	100	\N	\N
785	675	1		f	50	\N	\N
549	768	4		f	60	\N	\N
549	795	1		f	25	\N	\N
549	778	1		f	28	\N	\N
553	731	1		f	115	\N	\N
553	680	1		f	100	\N	\N
553	776	1		f	28	\N	\N
553	728	1		f	95	\N	\N
553	777	1		f	28	\N	\N
554	703	1		f	35	\N	\N
554	709	1		f	45	\N	\N
554	713	1		f	55	\N	\N
554	822	2		f	90	\N	\N
555	769	1	Mango /queso crema	f	25	\N	\N
560	493	1		f	60	\N	\N
560	768	1	Banderilla	f	15	\N	\N
560	715	1	Manzanilla	f	35	\N	\N
560	778	1		f	28	\N	\N
580	687	1		f	25	\N	\N
586	672	1	Fusilli	f	125	\N	\N
586	698	1		f	38	\N	\N
586	697	1		f	38	\N	\N
586	710	1		f	48	\N	\N
596	643	1		f	78	\N	\N
596	493	1		f	60	\N	\N
596	769	4		f	100	\N	\N
596	687	2		f	50	\N	\N
596	694	1		f	28	\N	\N
596	694	1		f	28	\N	\N
596	695	1		f	38	\N	\N
596	696	1		f	35	\N	\N
596	709	1		f	45	\N	\N
596	795	2		f	50	\N	\N
596	797	3		f	105	\N	\N
624	493	1		f	60	\N	\N
624	493	1		f	60	\N	\N
483	683	1		f	18	\N	\N
487	694	1		f	28	\N	\N
488	683	1		f	18	\N	\N
488	768	1		f	15	\N	\N
488	769	1		f	25	\N	\N
488	694	1		f	28	\N	\N
486	641	1		f	60	\N	\N
486	732	1		f	110	\N	\N
486	735	1		f	25	\N	\N
491	683	2		f	36	\N	\N
491	694	2		f	56	\N	\N
490	731	1		f	115	\N	\N
490	732	1		f	110	\N	\N
492	683	1		f	18	\N	\N
492	694	3		f	84	\N	\N
492	778	1		f	28	\N	\N
489	683	3		f	54	\N	\N
489	683	1		f	18	\N	\N
489	683	3		f	54	\N	\N
493	482	1		f	60	\N	\N
495	694	1		f	28	\N	\N
497	711	1		f	48	\N	\N
500	642	1		f	80	\N	\N
499	635	1		f	60	\N	\N
499	730	1		f	110	\N	\N
499	704	1		f	38	\N	\N
499	704	1		f	38	\N	\N
498	725	1		f	95	\N	\N
498	780	1		f	35	\N	\N
485	641	1		f	60	\N	\N
485	735	1		f	25	\N	\N
485	735	1		f	25	\N	\N
485	683	1		f	18	\N	\N
485	683	1		f	18	\N	\N
485	771	1		f	25	\N	\N
501	654	2		f	160	\N	\N
503	715	1	Moras de la selva	f	35	\N	\N
504	664	1	Fetuccini	f	115	\N	\N
504	675	1		f	50	\N	\N
504	813	2		f	100	\N	\N
506	628	1		f	70	\N	\N
506	647	1		f	60	\N	\N
506	814	1		f	50	\N	\N
506	771	1		f	25	\N	\N
505	482	1		f	60	\N	\N
505	484	1		f	60	\N	\N
505	485	1		f	65	\N	\N
505	704	1		f	38	\N	\N
505	713	1		f	55	\N	\N
507	762	2		f	20	\N	\N
507	764	1		f	35	\N	\N
507	763	1		f	35	\N	\N
508	810	1		f	65	\N	\N
509	482	1		f	60	\N	\N
509	687	1		f	25	\N	\N
509	711	1		f	48	\N	\N
510	485	1		f	65	\N	\N
510	683	2		f	36	\N	\N
511	651	1		f	70	\N	\N
511	480	1		f	60	\N	\N
511	485	1		f	65	\N	\N
511	710	1		f	48	\N	\N
511	711	1		f	48	\N	\N
511	715	1	Bora bora	f	35	\N	\N
512	484	1		f	60	\N	\N
512	490	1		f	55	\N	\N
512	716	1	Fantasía tropical	f	60	\N	\N
512	716	1	Lavanda manzanilla	f	60	\N	\N
513	632	1		f	55	\N	\N
513	682	1	Con queso gouda	f	60	\N	\N
513	683	1		f	18	\N	\N
513	771	1		f	25	\N	\N
513	777	1		f	28	\N	\N
502	768	1		f	0	3	\N
502	771	1		f	0	3	\N
515	661	2		f	156	\N	\N
515	683	1		f	18	\N	\N
515	795	1		f	25	\N	\N
516	730	1		f	110	\N	\N
516	733	1		f	110	\N	\N
516	815	1		f	35	\N	\N
516	816	1		f	35	\N	\N
517	732	1		f	110	\N	\N
517	815	1		f	35	\N	\N
517	778	1		f	28	\N	\N
518	735	1		f	25	\N	\N
518	771	1		f	25	\N	\N
518	718	1		f	25	\N	\N
518	727	1		f	90	\N	\N
514	734	1		f	115	\N	\N
514	734	1		f	115	\N	\N
514	683	2		f	36	\N	\N
514	683	2		f	36	\N	\N
514	683	1		f	18	\N	\N
514	743	3		f	240	\N	\N
514	746	1		f	140	\N	\N
514	751	1		f	120	\N	\N
514	816	1		f	35	\N	\N
514	687	1		f	25	\N	\N
514	687	1		f	25	\N	\N
514	770	1		f	25	\N	\N
514	770	1		f	25	\N	\N
514	795	2		f	50	\N	\N
514	799	1		f	32	\N	\N
514	715	1		f	35	\N	\N
514	724	1		f	90	\N	\N
514	724	2		f	180	\N	\N
514	804	1		f	42	\N	\N
514	804	1		f	42	\N	\N
514	804	1		f	42	\N	\N
524	484	1		f	65	\N	\N
525	467	1		f	330	\N	\N
526	493	1		f	60	\N	\N
526	683	1		f	18	\N	\N
526	683	2		f	36	\N	\N
526	769	1		f	25	\N	\N
526	696	3		f	105	\N	\N
624	764	1		f	35	\N	\N
624	765	1		f	35	\N	\N
526	797	4		f	140	\N	\N
526	716	1		f	60	\N	\N
527	683	1		f	18	\N	\N
527	718	1		f	25	\N	\N
528	636	1		f	80	\N	\N
528	637	1		f	78	\N	\N
528	643	1		f	78	\N	\N
528	771	1		f	25	\N	\N
528	775	1		f	25	\N	\N
528	717	1		f	20	\N	\N
529	493	1		f	60	\N	\N
529	626	1		f	55	\N	\N
529	781	1		f	55	\N	\N
530	493	1		f	60	\N	\N
532	490	4		f	220	\N	\N
532	683	7		f	126	\N	\N
531	819	1	Té limón	f	90	\N	\N
533	493	1		f	60	\N	\N
533	683	2		f	36	\N	\N
533	683	1		f	18	\N	\N
533	683	1		f	18	\N	\N
533	687	1		f	25	\N	\N
533	771	1		f	25	\N	\N
533	715	1	Moras	f	35	\N	\N
533	716	1	Manzanilla	f	60	\N	\N
533	718	1		f	25	\N	\N
533	778	1		f	28	\N	\N
536	703	1		f	35	\N	\N
536	718	1		f	25	\N	\N
536	720	2		f	130	\N	\N
536	614	1		f	120	\N	\N
536	615	1		f	120	\N	\N
536	821	1		f	35	\N	\N
534	683	2		f	36	\N	\N
534	771	1		f	25	\N	\N
534	779	1		f	28	\N	\N
534	802	1	Huevo	f	120	\N	\N
537	679	1		f	75	\N	\N
537	716	1	Fantasía	f	60	\N	\N
537	716	1	Fantasía	f	60	\N	\N
537	778	1		f	28	\N	\N
538	488	1		f	60	\N	\N
538	716	1	Bora bora	f	60	\N	\N
538	718	1		f	25	\N	\N
539	683	2	Des	f	36	\N	\N
539	770	1		f	25	\N	\N
540	651	1		f	70	\N	\N
540	778	2		f	56	\N	\N
541	493	1		f	60	\N	\N
541	626	1		f	55	\N	\N
541	784	1		f	55	\N	\N
542	769	1	Nutella	f	25	\N	\N
542	488	1		f	60	\N	\N
542	770	1		f	25	\N	\N
542	689	1		f	32	\N	\N
542	704	1		f	38	\N	\N
542	779	1		f	28	\N	\N
542	802	1	Hawaiana	f	120	\N	\N
542	617	1		f	145	\N	\N
543	480	1		f	60	\N	\N
543	781	1		f	55	\N	\N
543	761	1		f	35	\N	\N
543	687	1		f	25	\N	\N
544	769	1	Nutella	f	25	\N	\N
545	493	1		f	60	\N	\N
545	676	1		f	85	\N	\N
545	683	1		f	18	\N	\N
545	760	1		f	35	\N	\N
545	687	1		f	25	\N	\N
545	770	1		f	25	\N	\N
545	770	1		f	25	\N	\N
545	690	1		f	55	\N	\N
545	715	1	Bora bora	f	35	\N	\N
545	723	1		f	80	\N	\N
545	617	1		f	145	\N	\N
535	487	2		f	120	\N	\N
535	785	1		f	55	\N	\N
549	768	4		f	60	\N	\N
549	795	1		f	25	\N	\N
549	778	1		f	28	\N	\N
564	470	1		f	400	\N	\N
564	769	3	Nutella,rol,pan mango	f	75	\N	\N
581	769	1	Concha	f	25	\N	\N
582	710	1		f	48	\N	\N
595	643	2		f	156	\N	\N
595	664	1		f	115	\N	\N
595	683	1		f	18	\N	\N
595	683	2		t	0	\N	\N
595	816	1		f	35	\N	\N
595	795	1		f	25	\N	\N
625	687	1		f	25	\N	\N
627	683	1		f	18	\N	\N
638	630	1		f	80	\N	\N
638	694	1		f	28	\N	\N
638	698	1		f	38	\N	\N
636	484	1		f	65	\N	\N
636	694	1		f	28	\N	\N
636	716	1	Marroqui	f	60	\N	\N
640	483	1		f	65	\N	\N
639	483	1		f	65	\N	\N
639	485	1		f	65	\N	\N
639	689	1		f	32	\N	\N
639	690	1		f	55	\N	\N
642	683	2		f	36	\N	\N
642	769	3		f	75	\N	\N
642	769	3		f	75	\N	\N
642	687	1		f	25	\N	\N
642	687	1		f	25	\N	\N
642	687	1		f	25	\N	\N
642	696	2		f	70	\N	\N
661	479	1		f	360	\N	\N
661	762	2		f	20	\N	\N
673	683	1		f	18	\N	\N
673	768	1		f	15	\N	\N
673	775	1		f	25	\N	\N
682	683	1		f	18	\N	\N
682	687	2		f	50	\N	\N
688	624	1		f	90	\N	\N
688	777	1		f	28	\N	\N
687	683	2		f	36	\N	\N
687	683	2		f	36	\N	\N
687	771	1		f	25	\N	\N
687	826	1		f	60	\N	\N
694	660	1		f	80	\N	\N
694	683	1		f	18	\N	\N
694	795	1		f	25	\N	\N
694	715	1	Manzanilla	f	35	\N	\N
709	486	1		f	50	\N	\N
709	664	1		f	115	\N	\N
709	687	1		f	25	\N	\N
709	709	1		f	45	\N	\N
720	636	1		f	80	\N	\N
720	649	1		f	78	\N	\N
720	781	1		f	55	\N	\N
720	683	1		f	18	\N	\N
720	769	1	Mango	f	25	\N	\N
720	779	1		f	28	\N	\N
720	778	1		f	28	\N	\N
726	683	2		f	36	\N	\N
730	661	1		f	78	\N	\N
730	493	1		f	60	\N	\N
730	715	1	Marroqui	f	35	\N	\N
730	716	1	Marroqui	f	60	\N	\N
729	641	1		f	60	\N	\N
729	683	1		f	18	\N	\N
729	769	2	Mango/nutella	f	50	\N	\N
729	694	1		f	28	\N	\N
729	713	1		f	55	\N	\N
731	486	1		f	50	\N	\N
731	491	1		f	65	\N	\N
731	709	2		f	90	\N	\N
731	839	1		t	0	\N	\N
731	839	1		f	55	\N	\N
785	690	1		f	55	\N	\N
785	694	1		f	28	\N	\N
785	694	1		f	28	\N	\N
783	703	2		f	70	\N	\N
784	689	1		f	32	\N	\N
784	694	1		f	28	\N	\N
784	694	1		f	28	\N	\N
784	698	1		f	38	\N	\N
784	838	1		f	250	\N	\N
787	483	1		f	65	\N	\N
787	485	1		f	65	\N	\N
787	695	1		f	38	\N	\N
787	715	1		f	35	\N	\N
788	642	1		f	80	\N	\N
789	654	1		f	80	\N	\N
789	731	1		f	115	\N	\N
789	683	1		f	18	\N	\N
790	653	1		f	60	\N	\N
790	795	1		f	25	\N	\N
792	629	1	Sin queso de cabra	f	60	\N	\N
791	683	1		f	18	\N	\N
791	799	1		f	32	\N	\N
793	776	2		f	56	\N	\N
795	683	2		f	36	\N	\N
795	694	2		f	56	\N	\N
795	694	1		f	28	\N	\N
795	795	1		f	25	\N	\N
795	797	4		f	140	\N	\N
795	834	1		f	40	\N	\N
794	487	1		f	60	\N	\N
794	493	1		f	60	\N	\N
794	687	1		f	25	\N	\N
799	493	1		f	60	\N	\N
800	485	1		f	65	\N	\N
800	493	1		f	60	\N	\N
798	486	1		f	50	\N	\N
798	493	1		f	60	\N	\N
798	704	1		f	38	\N	\N
798	707	1		f	45	\N	\N
801	661	1		f	78	\N	\N
801	673	1		f	145	\N	\N
801	776	1		f	28	\N	\N
801	779	1		f	28	\N	\N
797	683	1		f	18	\N	\N
797	683	1		f	18	\N	\N
797	770	1		f	25	\N	\N
797	770	1		f	25	\N	\N
797	771	1		f	25	\N	\N
802	716	2	Moras	f	120	\N	\N
802	615	1		f	120	\N	\N
796	486	1		f	50	\N	\N
796	683	2		f	36	\N	\N
796	683	1		f	18	\N	\N
796	767	1		f	15	\N	\N
796	768	1		f	15	\N	\N
796	768	2		f	30	\N	\N
796	771	1		f	25	\N	\N
803	732	2		f	220	\N	\N
804	694	1		f	28	\N	\N
804	698	1		f	38	\N	\N
804	697	1		f	38	\N	\N
804	723	2		f	160	\N	\N
805	641	1		f	60	\N	\N
805	653	1		f	60	\N	\N
806	732	2		f	220	\N	\N
806	768	1		f	15	\N	\N
807	627	1		f	70	\N	\N
808	628	1		f	70	\N	\N
808	634	1		f	70	\N	\N
808	768	1		f	15	\N	\N
808	769	1		f	25	\N	\N
808	716	1	Marroquí caliente	f	60	\N	\N
809	482	1		f	60	\N	\N
810	687	1		f	25	\N	\N
810	687	3		f	75	\N	\N
810	694	1		f	28	\N	\N
810	694	2		f	56	\N	\N
810	709	1		f	45	\N	\N
810	797	1		f	35	\N	\N
810	822	1		f	45	\N	\N
810	831	4		f	92	\N	\N
812	646	1		t	0	\N	\N
812	646	1		f	70	\N	\N
812	673	1		t	0	\N	\N
812	673	1		f	145	\N	\N
812	674	1	Fettuccini	t	0	\N	\N
812	674	1	Fettuccini	f	145	\N	\N
812	773	1		t	0	\N	\N
812	773	1		f	25	\N	\N
812	777	1		t	0	\N	\N
812	777	1		f	28	\N	\N
813	629	1		f	60	\N	\N
813	490	1		f	55	\N	\N
813	710	1		f	48	\N	\N
813	711	1		f	48	\N	\N
813	839	1		f	55	\N	\N
817	683	1		f	18	\N	\N
817	769	1	Mango	f	25	\N	\N
817	703	1		f	35	\N	\N
816	687	2	Deslqctosados	f	50	\N	\N
816	612	1		f	120	\N	\N
814	493	1		f	60	\N	\N
814	683	1		f	18	\N	\N
814	683	2		f	36	\N	\N
814	718	1		f	25	\N	\N
815	493	1		f	60	\N	\N
815	683	3		f	54	\N	\N
815	683	2		f	36	\N	\N
815	683	2		f	36	\N	\N
815	770	1		f	25	\N	\N
811	683	2		f	36	\N	\N
811	767	1		f	15	\N	\N
811	768	1		f	15	\N	\N
811	718	1		f	25	\N	\N
819	733	1		f	110	\N	\N
820	795	2	Descafeinado	f	50	\N	\N
820	727	1		f	90	\N	\N
821	683	1		f	18	\N	\N
821	683	1		f	18	\N	\N
821	683	1		f	18	\N	\N
821	715	1	Caliente marroquí	f	35	\N	\N
822	643	2		f	156	\N	\N
822	683	1	Descafeinado	f	18	\N	\N
822	687	1		f	25	\N	\N
823	770	1		f	25	\N	\N
823	771	1		f	25	\N	\N
823	795	2		f	50	\N	\N
823	724	1		f	90	\N	\N
824	743	1	Pan de huevo	f	80	\N	\N
824	715	1		f	35	\N	\N
824	724	1	Con huevos	f	90	\N	\N
828	667	1		f	115	\N	\N
828	493	1		f	60	\N	\N
828	673	1		f	145	\N	\N
828	674	1		f	145	\N	\N
828	776	1		f	28	\N	\N
828	795	3		f	75	\N	\N
828	780	1		f	35	\N	\N
828	780	1		f	35	\N	\N
826	637	1		f	78	\N	\N
826	664	1	Fetuccini	f	115	\N	\N
826	769	1		f	25	\N	\N
826	780	2		f	70	\N	\N
827	653	1		f	60	\N	\N
827	679	1		f	75	\N	\N
827	683	1		f	18	\N	\N
827	683	1		f	18	\N	\N
827	696	1		f	35	\N	\N
825	629	1		f	60	\N	\N
825	486	1		f	50	\N	\N
825	683	1		f	18	\N	\N
825	683	1		f	18	\N	\N
825	683	1		f	18	\N	\N
825	768	1		f	15	\N	\N
825	694	1		f	28	\N	\N
825	694	1		f	28	\N	\N
825	696	1		f	35	\N	\N
825	797	1		f	35	\N	\N
825	827	1		f	35	\N	\N
825	827	1		f	35	\N	\N
825	847	2		f	40	\N	\N
829	764	1		f	35	\N	\N
829	765	1		f	35	\N	\N
832	476	1		f	330	\N	\N
831	679	1		f	75	\N	\N
831	717	1		f	20	\N	\N
834	662	1		f	95	\N	\N
834	676	1		f	85	\N	\N
834	770	1		f	25	\N	\N
834	778	2		f	56	\N	\N
830	490	2		f	110	\N	\N
830	770	1		f	25	\N	\N
830	770	1		f	25	\N	\N
830	771	1		f	25	\N	\N
830	720	1		f	65	\N	\N
830	720	1		f	65	\N	\N
830	777	1		f	28	\N	\N
830	838	1		f	250	\N	\N
837	687	1		f	25	\N	\N
837	705	1		f	38	\N	\N
838	687	1		f	25	\N	\N
838	695	1		f	38	\N	\N
836	641	1		f	60	\N	\N
836	641	1		f	60	\N	\N
836	683	1		f	18	\N	\N
836	683	1		f	18	\N	\N
836	769	1	Yema	f	25	\N	\N
836	686	1		f	28	\N	\N
836	687	1		f	25	\N	\N
836	715	1	Moras	f	35	\N	\N
836	778	3		f	84	\N	\N
836	827	2		f	70	\N	\N
839	630	1		f	80	\N	\N
839	686	1		f	28	\N	\N
839	689	1		f	32	\N	\N
839	698	1		f	38	\N	\N
841	631	1		f	78	\N	\N
841	676	1		f	85	\N	\N
841	695	1		f	38	\N	\N
841	841	1		f	55	\N	\N
840	490	1		f	55	\N	\N
840	683	2		f	36	\N	\N
840	826	1		f	60	\N	\N
842	638	1		f	55	\N	\N
842	680	1		f	100	\N	\N
842	696	1		f	35	\N	\N
842	717	1		f	20	\N	\N
842	718	1		f	25	\N	\N
843	486	1		f	50	\N	\N
843	494	1		f	60	\N	\N
843	720	1		f	65	\N	\N
843	778	1		f	28	\N	\N
844	665	1	Fetuccini en 2 platos	f	140	\N	\N
844	683	1		f	18	\N	\N
844	694	1		f	28	\N	\N
844	720	2		f	130	\N	\N
844	838	1		f	250	\N	\N
835	491	1		f	65	\N	\N
835	683	3		f	54	\N	\N
835	683	1		f	18	\N	\N
835	683	2		f	36	\N	\N
835	687	1		f	25	\N	\N
835	770	1		f	25	\N	\N
835	771	2		f	50	\N	\N
835	779	1		f	28	\N	\N
835	715	1	Manzanilla	f	35	\N	\N
835	720	1		f	65	\N	\N
835	777	3		f	84	\N	\N
835	778	1		f	28	\N	\N
835	826	1		f	60	\N	\N
845	641	3		f	180	\N	\N
845	696	4		t	140	\N	\N
849	769	1		f	25	\N	\N
849	694	1		f	28	\N	\N
849	797	1		f	35	\N	\N
850	797	4		f	140	\N	\N
851	769	4		f	100	\N	\N
852	683	2		f	36	\N	\N
852	694	1		f	28	\N	\N
847	655	1		f	78	\N	\N
847	733	1		f	110	\N	\N
847	795	1		f	25	\N	\N
854	631	1		f	78	\N	\N
854	649	1		f	78	\N	\N
854	694	1		f	28	\N	\N
848	738	1		f	25	\N	\N
848	730	1		f	110	\N	\N
848	683	1		f	18	\N	\N
846	641	3		f	180	\N	\N
846	643	1		f	78	\N	\N
846	696	1		f	35	\N	\N
846	801	3		f	126	\N	\N
853	734	1		f	115	\N	\N
855	683	3		f	54	\N	\N
855	769	3		f	75	\N	\N
857	636	1		f	80	\N	\N
857	683	1		f	18	\N	\N
859	683	2		f	36	\N	\N
859	769	2		f	50	\N	\N
860	654	2		f	160	\N	\N
858	683	2		f	36	\N	\N
858	836	1		f	200	\N	\N
861	673	2		f	290	\N	\N
861	779	1		f	28	\N	\N
861	780	1		f	35	\N	\N
856	683	1		f	18	\N	\N
856	720	2		f	130	\N	\N
863	493	1		f	60	\N	\N
863	771	1		f	25	\N	\N
864	664	2		f	230	\N	\N
864	770	2		f	50	\N	\N
865	493	2		f	120	\N	\N
865	821	1		f	35	\N	\N
865	822	1		f	45	\N	\N
862	621	1	1/2 chorizo	f	210	\N	\N
862	841	2		f	110	\N	\N
862	841	2		f	110	\N	\N
868	654	1		f	80	\N	\N
867	651	1		f	70	\N	\N
867	485	1		f	65	\N	\N
867	493	2		f	120	\N	\N
867	686	1		f	28	\N	\N
867	687	3		f	75	\N	\N
867	775	1		f	25	\N	\N
867	696	1		f	35	\N	\N
867	826	1		f	60	\N	\N
867	827	1		f	35	\N	\N
870	491	1		f	65	\N	\N
870	687	1		f	25	\N	\N
866	779	1		f	28	\N	\N
866	716	1	Moras	f	60	\N	\N
866	717	1		f	20	\N	\N
871	493	1		f	60	\N	\N
871	684	1		f	18	\N	\N
871	715	1		f	35	\N	\N
872	482	1		f	60	\N	\N
872	832	1		f	30	\N	\N
873	683	5		f	90	\N	\N
873	694	4		f	112	\N	\N
869	663	1	Fusilli	f	80	\N	\N
869	493	1		f	60	\N	\N
869	679	1		f	75	\N	\N
869	683	1		f	18	\N	\N
869	770	1		f	25	\N	\N
869	771	1		f	25	\N	\N
869	694	1		f	28	\N	\N
869	715	1	Bora bora	f	35	\N	\N
874	683	1		f	18	\N	\N
874	849	1		f	45	\N	\N
875	683	1		f	18	\N	\N
875	769	1		f	25	\N	\N
876	683	3		f	54	\N	\N
876	795	1		f	25	\N	\N
877	483	1		f	65	\N	\N
877	696	1		f	35	\N	\N
878	694	1		f	28	\N	\N
878	702	1		f	5	\N	\N
879	851	1		f	200	\N	\N
880	711	1		f	48	\N	\N
880	797	1		f	35	\N	\N
881	795	1		f	25	\N	\N
881	799	1		f	32	\N	\N
882	479	1		f	360	\N	\N
882	474	1		f	360	\N	\N
883	648	1		f	80	\N	\N
884	768	1		f	15	\N	\N
884	771	1		f	25	\N	\N
884	718	1		f	25	\N	\N
884	614	1		f	120	\N	\N
885	485	1		f	65	\N	\N
885	491	1		f	65	\N	\N
885	493	1		f	60	\N	\N
885	777	1		f	28	\N	\N
885	838	1		f	250	\N	\N
886	770	2		f	50	\N	\N
887	620	1	1/2 prosciutto	f	210	\N	\N
888	491	2		f	130	\N	\N
888	780	2		f	70	\N	\N
888	777	3		f	84	\N	\N
888	618	2		f	420	\N	\N
891	471	1		f	250	\N	\N
890	485	1		f	65	\N	\N
890	612	1		f	120	\N	\N
892	717	1		f	20	\N	\N
893	485	1		f	65	\N	\N
896	683	1		f	18	\N	\N
897	703	1		f	35	\N	\N
897	703	1		f	35	\N	\N
894	709	1		f	45	\N	\N
894	841	1		f	55	\N	\N
898	484	1		f	65	\N	\N
898	695	1		f	38	\N	\N
898	709	2		f	90	\N	\N
901	703	1		f	35	\N	\N
904	476	1		f	330	\N	\N
903	630	1		f	80	\N	\N
903	483	1		f	65	\N	\N
903	648	1		f	80	\N	\N
903	484	1		f	65	\N	\N
903	844	1		f	65	\N	\N
903	845	1		f	20	\N	\N
895	482	2		f	120	\N	\N
895	675	1		f	50	\N	\N
895	484	1		f	65	\N	\N
895	771	2		f	50	\N	\N
895	711	1		f	48	\N	\N
895	715	1	Bora Bora 	f	35	\N	\N
895	715	2	Moras	f	70	\N	\N
895	826	1		f	60	\N	\N
899	651	2		f	140	\N	\N
899	768	1	Cuerno	f	15	\N	\N
899	784	1		f	55	\N	\N
899	686	1		f	28	\N	\N
899	770	1		f	25	\N	\N
899	770	1		f	25	\N	\N
899	694	1		f	28	\N	\N
902	645	1		f	70	\N	\N
902	657	1		f	70	\N	\N
902	633	1		f	70	\N	\N
902	706	1		f	38	\N	\N
902	717	1		f	20	\N	\N
902	780	1		t	0	\N	\N
900	661	1		f	78	\N	\N
900	687	1		f	25	\N	\N
900	704	1		f	38	\N	\N
900	711	1		f	48	\N	\N
906	689	1		f	32	\N	\N
906	703	1		f	35	\N	\N
906	623	1	1/2 hawaiana	f	230	\N	\N
906	839	1		f	55	\N	\N
889	683	2		f	36	\N	\N
889	683	2		f	36	\N	\N
889	771	1		f	25	\N	\N
905	484	1		f	65	\N	\N
905	696	1		f	35	\N	\N
905	711	1		f	48	\N	\N
905	826	1		f	60	\N	\N
908	715	1	Moras	f	35	\N	\N
909	852	12		f	540	\N	\N
907	483	1		f	65	\N	\N
907	769	1		f	25	\N	\N
907	698	1		f	38	\N	\N
907	699	1		f	65	\N	\N
911	732	1		f	110	\N	\N
911	734	1		f	115	\N	\N
911	815	1		f	35	\N	\N
911	815	1		f	35	\N	\N
911	816	1		f	35	\N	\N
911	723	1		f	80	\N	\N
912	485	1		f	65	\N	\N
912	733	1		f	110	\N	\N
912	734	1		f	115	\N	\N
912	768	2		f	30	\N	\N
912	769	2		f	50	\N	\N
912	816	6		f	210	\N	\N
912	687	1		f	25	\N	\N
912	709	1		f	45	\N	\N
912	717	1		f	20	\N	\N
912	727	4		f	360	\N	\N
913	482	1		f	60	\N	\N
913	679	1		f	75	\N	\N
913	777	1		f	28	\N	\N
913	777	1		f	28	\N	\N
913	778	1		f	28	\N	\N
913	613	1	Delgada	f	120	\N	\N
913	614	1	Delgada	f	120	\N	\N
914	482	1		f	60	\N	\N
910	852	16		f	720	\N	\N
915	852	20		f	900	\N	\N
916	711	1		f	48	\N	\N
917	490	1		f	55	\N	\N
917	484	1		f	65	\N	\N
918	490	1		f	55	\N	\N
918	709	1		f	45	\N	\N
918	778	1		f	28	\N	\N
920	483	1		f	65	\N	\N
920	776	1		f	28	\N	\N
920	777	1		f	28	\N	\N
920	826	1		f	60	\N	\N
919	491	1		f	65	\N	\N
919	664	1		f	115	\N	\N
919	673	1		f	145	\N	\N
919	816	1		f	35	\N	\N
919	770	1		f	25	\N	\N
923	679	1		f	75	\N	\N
923	680	1		f	100	\N	\N
921	730	1		f	110	\N	\N
922	730	1		f	110	\N	\N
922	768	1		f	15	\N	\N
922	685	1		f	28	\N	\N
922	795	1		t	0	\N	\N
922	715	1		f	35	\N	\N
924	799	1		f	32	\N	\N
925	749	1	1/2 orden pan francés	f	120	\N	\N
926	683	3		f	54	\N	\N
926	683	1		f	18	\N	\N
926	683	1		f	18	\N	\N
926	694	2		f	56	\N	\N
926	694	1		f	28	\N	\N
926	795	1		f	25	\N	\N
926	799	1		f	32	\N	\N
926	801	1		f	42	\N	\N
927	640	1		f	70	\N	\N
927	646	1		f	70	\N	\N
927	652	1		f	70	\N	\N
927	658	1		f	70	\N	\N
927	632	2		f	110	\N	\N
927	626	1		f	55	\N	\N
927	626	1		f	55	\N	\N
927	770	2		f	50	\N	\N
927	773	2		f	50	\N	\N
927	774	2		f	50	\N	\N
927	775	2		f	50	\N	\N
929	781	1		f	55	\N	\N
931	703	1		f	35	\N	\N
931	709	1		f	45	\N	\N
930	781	1		f	55	\N	\N
930	781	2		f	110	\N	\N
930	770	1		f	25	\N	\N
930	771	1		f	25	\N	\N
933	493	1		f	60	\N	\N
933	686	1		f	28	\N	\N
933	695	2		f	76	\N	\N
934	485	1		f	65	\N	\N
935	782	1		f	55	\N	\N
936	624	1		f	90	\N	\N
936	683	1		f	18	\N	\N
936	694	1		f	28	\N	\N
936	715	1	Marroquí	f	35	\N	\N
932	683	1		f	18	\N	\N
932	683	2		f	36	\N	\N
932	683	1		f	18	\N	\N
932	771	1		f	25	\N	\N
932	779	1		f	28	\N	\N
928	485	1		f	65	\N	\N
928	490	2		f	110	\N	\N
928	493	1		f	60	\N	\N
928	683	1		f	18	\N	\N
928	683	1		f	18	\N	\N
928	683	1		f	18	\N	\N
928	683	3		f	54	\N	\N
928	768	1		f	15	\N	\N
928	770	1		f	25	\N	\N
928	779	1		f	28	\N	\N
928	715	1	Manzanilla	f	35	\N	\N
937	768	1		f	15	\N	\N
937	769	1		f	25	\N	\N
937	687	1		t	0	\N	\N
937	689	1		f	32	\N	\N
937	799	1		f	32	\N	\N
937	799	1		f	32	\N	\N
938	730	1		f	110	\N	\N
938	731	1		f	115	\N	\N
939	654	1		f	80	\N	\N
939	683	1		f	18	\N	\N
939	687	1		f	25	\N	\N
939	703	1		f	35	\N	\N
939	724	2		f	180	\N	\N
940	723	1		f	80	\N	\N
941	647	1		f	60	\N	\N
941	683	3		f	54	\N	\N
941	767	1		f	15	\N	\N
941	769	1		f	25	\N	\N
941	696	1		f	35	\N	\N
941	779	1		f	28	\N	\N
941	797	4		f	140	\N	\N
941	797	1		f	35	\N	\N
942	630	1		f	80	\N	\N
942	769	1		f	25	\N	\N
942	773	1		f	25	\N	\N
944	493	1		f	60	\N	\N
943	647	1		f	60	\N	\N
943	493	1		f	60	\N	\N
943	626	1		f	55	\N	\N
943	679	1		f	75	\N	\N
943	779	1		f	28	\N	\N
943	780	1		f	35	\N	\N
943	831	2		f	46	\N	\N
947	471	1		f	250	\N	\N
947	846	1		f	30	\N	\N
945	493	1		f	60	\N	\N
945	488	1		f	60	\N	\N
945	777	2		f	56	\N	\N
946	485	1		f	65	\N	\N
946	683	1		f	18	\N	\N
946	718	1		f	25	\N	\N
948	694	1		f	28	\N	\N
949	624	1		f	90	\N	\N
949	641	1		f	60	\N	\N
949	687	3		f	75	\N	\N
952	493	1		f	60	\N	\N
951	639	1		f	70	\N	\N
951	690	1		f	55	\N	\N
951	697	1		f	38	\N	\N
953	485	1		f	65	\N	\N
953	493	1		f	60	\N	\N
950	490	1		f	55	\N	\N
950	696	2		f	70	\N	\N
954	781	1		f	55	\N	\N
954	778	1		f	28	\N	\N
956	663	1		f	80	\N	\N
956	683	1		f	18	\N	\N
956	770	1		f	25	\N	\N
956	771	1		f	25	\N	\N
956	718	1		f	25	\N	\N
955	493	1		f	60	\N	\N
955	696	1		f	35	\N	\N
955	722	1		f	65	\N	\N
957	643	1		f	78	\N	\N
957	653	1		f	60	\N	\N
957	795	2		f	50	\N	\N
959	730	2		f	220	\N	\N
959	770	1		f	25	\N	\N
960	694	1		f	28	\N	\N
958	730	2		f	220	\N	\N
958	683	1		f	18	\N	\N
958	770	1		f	25	\N	\N
962	667	1	Fusilli	f	115	\N	\N
962	674	1	Fetuccini	f	145	\N	\N
962	788	1		f	60	\N	\N
963	743	1		f	80	\N	\N
963	743	1		f	80	\N	\N
963	743	1		f	80	\N	\N
963	749	1		t	0	\N	\N
963	768	2		f	30	\N	\N
963	756	1		f	40	\N	\N
963	795	1		f	25	\N	\N
963	715	1		f	35	\N	\N
963	777	1		f	28	\N	\N
963	778	2		f	56	\N	\N
963	854	2		f	20	\N	\N
961	467	1		f	360	\N	\N
961	836	1		f	200	\N	\N
964	853	6		f	150	\N	\N
965	484	1		f	65	\N	\N
965	687	1		f	25	\N	\N
965	694	2		f	56	\N	\N
966	683	1		f	18	\N	\N
967	484	1		t	0	\N	\N
967	484	1		f	65	\N	\N
968	654	1		f	80	\N	\N
971	467	1		f	360	\N	\N
972	663	1		f	80	\N	\N
972	490	1		f	55	\N	\N
972	778	1		f	28	\N	\N
969	770	1		f	25	\N	\N
969	771	1		f	25	\N	\N
969	853	2		f	50	\N	\N
973	494	1		f	60	\N	\N
973	699	1		f	65	\N	\N
977	839	1		f	55	\N	\N
977	848	1		f	65	\N	\N
975	683	1		f	18	\N	\N
975	683	1		f	18	\N	\N
975	683	3		f	54	\N	\N
975	484	1		f	65	\N	\N
978	629	1		f	60	\N	\N
978	629	1		f	60	\N	\N
978	631	2		f	156	\N	\N
978	635	1		f	60	\N	\N
978	663	1		f	80	\N	\N
978	626	1		f	55	\N	\N
978	770	1		f	25	\N	\N
978	775	1		f	25	\N	\N
978	694	1		f	28	\N	\N
978	698	1		f	38	\N	\N
978	697	1		f	38	\N	\N
978	488	1		f	65	\N	\N
974	637	1		f	78	\N	\N
974	484	1		f	65	\N	\N
974	704	1		f	38	\N	\N
974	713	1		f	55	\N	\N
974	718	1		f	25	\N	\N
974	720	1		f	65	\N	\N
981	487	1		f	60	\N	\N
981	679	1		f	75	\N	\N
981	814	2		f	100	\N	\N
979	624	1		f	90	\N	\N
979	487	1		f	60	\N	\N
979	694	1		f	28	\N	\N
979	694	2		f	56	\N	\N
979	715	1		f	35	\N	\N
979	616	1		f	145	\N	\N
970	683	2		f	36	\N	\N
970	683	1		f	18	\N	\N
970	773	1		f	25	\N	\N
970	853	1		f	25	\N	\N
976	683	1		f	18	\N	\N
976	683	1		f	18	\N	\N
976	683	2		f	36	\N	\N
976	683	2		f	36	\N	\N
976	771	1		f	25	\N	\N
976	771	1		f	25	\N	\N
976	836	1		f	200	\N	\N
980	667	1		f	115	\N	\N
980	485	1		f	65	\N	\N
980	487	1		f	60	\N	\N
980	673	1		f	145	\N	\N
980	683	1		f	18	\N	\N
980	683	1		f	18	\N	\N
980	484	1		f	65	\N	\N
980	770	1		f	25	\N	\N
980	771	2		f	50	\N	\N
980	775	1		f	25	\N	\N
980	775	1		f	25	\N	\N
980	694	1		f	28	\N	\N
980	720	1		f	65	\N	\N
980	620	1		f	210	\N	\N
980	827	1		f	35	\N	\N
980	488	1		f	65	\N	\N
982	679	1		f	75	\N	\N
982	683	2		f	36	\N	\N
982	613	1		f	120	\N	\N
983	845	1		f	20	\N	\N
983	853	4		f	100	\N	\N
983	488	1		f	65	\N	\N
984	683	1		f	18	\N	\N
984	768	2		f	30	\N	\N
984	795	1		f	25	\N	\N
984	715	1		f	35	\N	\N
985	648	1	Jamón serrano, y queso cabra, sin aderezos	f	80	\N	\N
985	683	1		f	18	\N	\N
985	816	1		f	35	\N	\N
985	789	1		f	35	\N	\N
985	795	1		f	25	\N	\N
985	715	1	Moras Caliente	f	35	\N	\N
985	725	1		f	95	\N	\N
986	732	1		t	0	\N	\N
986	732	1		f	110	\N	\N
986	771	1		t	0	\N	\N
986	727	1		f	90	\N	\N
986	804	1		f	42	\N	\N
986	804	1		f	42	\N	\N
987	749	1	1/2 orden yogurt con berries	f	120	\N	\N
987	770	2		f	50	\N	\N
988	493	1		f	60	\N	\N
988	683	1		f	18	\N	\N
988	683	2		f	36	\N	\N
988	771	1		f	25	\N	\N
988	726	2		f	180	\N	\N
989	627	1		f	70	\N	\N
989	770	2		f	50	\N	\N
990	683	1		f	18	\N	\N
990	715	1		f	35	\N	\N
991	482	1		f	60	\N	\N
991	485	1		f	65	\N	\N
991	687	1		f	25	\N	\N
991	822	1		f	45	\N	\N
993	768	3		f	45	\N	\N
993	769	1		f	25	\N	\N
993	687	1		f	25	\N	\N
993	709	1		f	45	\N	\N
993	795	2		f	50	\N	\N
993	797	4		f	140	\N	\N
994	683	1		f	18	\N	\N
996	482	1		f	60	\N	\N
996	484	1		f	65	\N	\N
996	695	1		f	38	\N	\N
996	709	1		f	45	\N	\N
995	621	1	1/2jamon serrano	f	210	\N	\N
995	820	1		f	120	\N	\N
997	639	1		f	70	\N	\N
997	484	1		f	65	\N	\N
997	716	1	Fantasia	f	60	\N	\N
997	488	1		f	65	\N	\N
992	638	1		f	55	\N	\N
992	769	1	Nutella	f	25	\N	\N
992	704	1		f	38	\N	\N
992	804	1		f	42	\N	\N
998	630	1		f	80	\N	\N
998	779	1		f	28	\N	\N
998	778	1		f	28	\N	\N
1000	483	1		f	65	\N	\N
1000	493	1		f	60	\N	\N
1000	711	1		f	48	\N	\N
1000	712	1		f	48	\N	\N
1003	483	1		f	65	\N	\N
1003	709	1		f	45	\N	\N
999	482	1		f	60	\N	\N
999	769	1		f	25	\N	\N
999	696	1		f	35	\N	\N
999	698	1		f	38	\N	\N
1006	482	1		f	60	\N	\N
1006	485	1		f	65	\N	\N
1006	674	1		f	145	\N	\N
1006	688	1		f	32	\N	\N
1006	698	1		f	38	\N	\N
1006	699	1		f	65	\N	\N
1006	701	1		f	65	\N	\N
1006	705	1		f	38	\N	\N
1006	709	1		f	45	\N	\N
1006	620	1		f	210	\N	\N
1004	483	1		f	65	\N	\N
1004	694	1		f	28	\N	\N
1004	777	1		f	28	\N	\N
1002	485	1		f	65	\N	\N
1002	493	1		f	60	\N	\N
1002	687	1		f	25	\N	\N
1002	716	1	Marroqui	f	60	\N	\N
1001	483	1		f	65	\N	\N
1001	683	1		f	18	\N	\N
1001	715	1	Manzanilla 	f	35	\N	\N
1001	717	1		f	20	\N	\N
1008	485	1		f	65	\N	\N
1008	683	2		f	36	\N	\N
1007	679	1		f	75	\N	\N
1007	716	2		f	120	\N	\N
1007	826	1		f	60	\N	\N
1009	683	3		f	54	\N	\N
1009	687	1		f	25	\N	\N
1009	771	1		f	25	\N	\N
1009	836	1		f	200	\N	\N
1005	630	1		f	80	\N	\N
1005	679	1		f	75	\N	\N
1005	770	1		f	25	\N	\N
1005	771	1		f	25	\N	\N
1005	716	1		f	60	\N	\N
1005	716	1	Bora bora	f	60	\N	\N
1005	717	1		f	20	\N	\N
1005	853	1		f	25	\N	\N
1012	479	2		f	720	\N	\N
1011	730	1		f	110	\N	\N
1011	731	1		f	115	\N	\N
1010	730	1		f	110	\N	\N
1010	731	1		f	115	\N	\N
1010	683	1		f	18	\N	\N
1010	771	1		f	25	\N	\N
1014	627	1		f	70	\N	\N
1014	724	1		f	90	\N	\N
1013	654	1		f	80	\N	\N
1013	683	1		f	18	\N	\N
1013	749	1		f	120	\N	\N
1013	748	1		t	0	\N	\N
1013	856	1		f	120	\N	\N
1015	863	50		f	275	\N	\N
1017	651	1		f	70	\N	\N
1017	672	1	Fetuccini	f	125	\N	\N
1017	775	2		f	50	\N	\N
1018	662	1		f	95	\N	\N
1018	768	2		f	30	\N	\N
1018	769	1		f	25	\N	\N
1018	687	1		f	25	\N	\N
1018	694	2		f	56	\N	\N
1018	694	1		f	28	\N	\N
1018	694	1		f	28	\N	\N
1018	696	1		f	35	\N	\N
1018	797	1		f	35	\N	\N
1018	713	1		f	55	\N	\N
1018	801	4		f	168	\N	\N
1018	822	1		f	45	\N	\N
1018	853	1		f	25	\N	\N
1016	797	2		f	70	\N	\N
1020	482	3		f	180	\N	\N
1023	718	1		f	25	\N	\N
1022	627	1		f	70	\N	\N
1022	631	1		f	78	\N	\N
1021	645	1		f	70	\N	\N
1021	671	1		f	140	\N	\N
1021	721	1		f	250	\N	\N
1026	485	1		f	65	\N	\N
1026	493	1		f	60	\N	\N
1026	687	1		f	25	\N	\N
1026	694	1		f	28	\N	\N
1028	683	1		f	18	\N	\N
1028	826	1		f	60	\N	\N
1024	666	2		f	160	\N	\N
1024	491	1		f	0	3	\N
1024	672	1		f	125	\N	\N
1024	813	1		f	50	\N	\N
1024	687	1		f	25	\N	\N
1024	770	2		f	50	\N	\N
1024	720	1		f	65	\N	\N
1024	621	1		f	210	\N	\N
1025	786	1		f	55	\N	\N
1025	778	1		f	28	\N	\N
1030	669	2		f	160	\N	\N
1030	814	2		f	100	\N	\N
1030	613	1		f	120	\N	\N
1030	828	1		f	120	\N	\N
1027	483	1		f	65	\N	\N
1027	483	1		f	65	\N	\N
1027	493	1		f	60	\N	\N
1027	687	1	Deslac	f	25	\N	\N
1027	694	1		f	28	\N	\N
1027	716	1		f	60	\N	\N
1027	716	1		f	60	\N	\N
1027	716	1		f	60	\N	\N
1027	826	1		f	60	\N	\N
1029	629	1		f	60	\N	\N
1029	637	1		f	78	\N	\N
1029	663	1		f	80	\N	\N
1029	663	1		f	80	\N	\N
1029	663	1		f	80	\N	\N
1029	666	3		f	240	\N	\N
1029	666	1		f	80	\N	\N
1029	673	1		f	145	\N	\N
1029	679	1		f	75	\N	\N
1029	683	1		f	18	\N	\N
1029	683	3		f	54	\N	\N
1029	683	2		f	36	\N	\N
1029	683	1		f	18	\N	\N
1029	769	1	Concha	f	25	\N	\N
1029	813	4		f	200	\N	\N
1029	813	2		f	100	\N	\N
1029	687	1		f	25	\N	\N
1029	771	1		f	25	\N	\N
1029	774	1		f	25	\N	\N
1029	774	1		f	25	\N	\N
1029	775	1		f	25	\N	\N
1029	775	1		f	25	\N	\N
1029	720	1		f	65	\N	\N
1029	780	2		f	70	\N	\N
1029	780	1		f	35	\N	\N
1029	612	1		f	120	\N	\N
1029	618	1		f	210	\N	\N
1029	828	1		f	120	\N	\N
1029	836	1		f	200	\N	\N
1029	839	2		f	110	\N	\N
1029	839	1		f	55	\N	\N
1029	839	1		f	55	\N	\N
1029	757	1		f	75	\N	\N
1031	483	1		f	65	\N	\N
1031	664	1		f	115	\N	\N
1031	694	1		f	28	\N	\N
1031	695	2		f	76	\N	\N
1031	780	1		f	35	\N	\N
1031	612	1		f	120	\N	\N
1032	491	1		f	65	\N	\N
1032	832	2		f	60	\N	\N
1033	629	2		f	120	\N	\N
1033	629	1		f	60	\N	\N
1033	471	1		f	250	\N	\N
1033	626	1		f	55	\N	\N
1033	703	1		f	35	\N	\N
1033	705	1		f	38	\N	\N
1033	795	1		f	25	\N	\N
1033	799	1		f	32	\N	\N
1033	780	1		f	35	\N	\N
1033	807	1		f	42	\N	\N
1034	629	1		f	60	\N	\N
1034	649	1		f	78	\N	\N
1037	622	1		f	230	\N	\N
1037	845	1		f	20	\N	\N
1038	479	1		f	360	\N	\N
1038	485	1		f	65	\N	\N
1040	627	2		f	140	\N	\N
1036	685	1		f	28	\N	\N
1036	687	1		f	25	\N	\N
1036	615	1		f	120	\N	\N
1036	841	1		f	55	\N	\N
1035	639	1	En dos	f	70	\N	\N
1035	780	1		f	35	\N	\N
1041	662	1		f	95	\N	\N
1039	813	1		f	50	\N	\N
1039	615	1		f	120	\N	\N
1039	828	1		f	120	\N	\N
1043	493	1		f	60	\N	\N
1044	482	2		f	120	\N	\N
1044	715	2	Moras	f	70	\N	\N
1042	697	1		f	38	\N	\N
1045	683	1		f	18	\N	\N
1045	821	1		f	35	\N	\N
1047	482	1		f	60	\N	\N
1047	485	1		f	65	\N	\N
1047	696	1		f	35	\N	\N
1048	663	1	Fusilli	f	80	\N	\N
1048	485	1		f	65	\N	\N
1048	715	1	Moras	f	35	\N	\N
1048	615	1	Delgada	f	120	\N	\N
1048	821	1		f	35	\N	\N
1049	665	1	Fetuccini	f	140	\N	\N
1049	632	1		f	55	\N	\N
1049	485	1		f	65	\N	\N
1049	687	1		f	25	\N	\N
1049	696	1		f	35	\N	\N
1049	718	1		f	25	\N	\N
1050	667	1	Fetuccini	f	115	\N	\N
1050	673	1		f	145	\N	\N
1050	769	1		f	25	\N	\N
1050	769	1		f	25	\N	\N
1050	779	1		t	0	\N	\N
1050	822	1	Deslactosado	f	45	\N	\N
1050	822	1		f	45	\N	\N
1052	769	1		f	25	\N	\N
1052	779	1		f	28	\N	\N
1054	493	1		f	60	\N	\N
1046	666	1		f	80	\N	\N
1046	683	2		f	36	\N	\N
1046	770	1		f	25	\N	\N
1046	853	1		f	25	\N	\N
1051	639	1		f	70	\N	\N
1051	692	1		f	55	\N	\N
1051	703	1		f	35	\N	\N
1051	703	1		f	35	\N	\N
1051	864	1		f	35	\N	\N
1051	864	1		f	35	\N	\N
1053	482	1		f	60	\N	\N
1053	493	1		f	60	\N	\N
1053	683	1		f	18	\N	\N
1053	814	1		f	50	\N	\N
1053	690	2		f	110	\N	\N
1055	643	1		f	78	\N	\N
1055	715	1		f	35	\N	\N
1056	467	1		f	360	\N	\N
1057	491	1		f	65	\N	\N
1057	783	1		f	55	\N	\N
1057	679	1		f	75	\N	\N
1057	769	1		f	25	\N	\N
1057	698	1		f	38	\N	\N
1057	697	1		f	38	\N	\N
1059	485	1		f	65	\N	\N
1059	689	1		f	32	\N	\N
1059	694	1		f	28	\N	\N
1059	826	1		f	60	\N	\N
1058	651	1		f	70	\N	\N
1058	660	1		f	80	\N	\N
1058	483	1		f	65	\N	\N
1058	485	1		f	65	\N	\N
1058	489	1		f	60	\N	\N
1058	493	1		f	60	\N	\N
1058	679	2		f	150	\N	\N
1058	770	1		f	25	\N	\N
1058	770	1		f	25	\N	\N
1058	771	1		f	25	\N	\N
1058	771	1		f	25	\N	\N
1058	771	1		f	25	\N	\N
1058	692	1		f	55	\N	\N
1058	699	1		f	65	\N	\N
1058	716	1	Moras de la selva	f	60	\N	\N
1058	716	1	Fantasía tropical	f	60	\N	\N
1058	620	1		f	210	\N	\N
1058	826	1		f	60	\N	\N
1060	491	1		f	65	\N	\N
1060	810	1		f	65	\N	\N
1062	671	1	Fetuccini	f	140	\N	\N
1062	491	1		f	65	\N	\N
1062	680	1		f	100	\N	\N
1064	482	1		f	60	\N	\N
1064	490	1		f	55	\N	\N
1064	493	1		f	60	\N	\N
1061	641	1		f	60	\N	\N
1061	482	1		f	60	\N	\N
1061	687	2		f	50	\N	\N
1061	694	1		f	28	\N	\N
1063	485	2		f	130	\N	\N
1063	673	1		f	145	\N	\N
1063	615	1		f	120	\N	\N
1063	846	1		f	30	\N	\N
1066	482	1		f	60	\N	\N
1066	664	1		f	115	\N	\N
1066	698	1		f	38	\N	\N
1066	697	1		f	38	\N	\N
1065	686	1		f	28	\N	\N
1065	690	1		f	55	\N	\N
1065	695	1		f	38	\N	\N
1065	698	1		f	38	\N	\N
1065	622	1	Delgada prociuto	f	230	\N	\N
1067	655	1		f	78	\N	\N
1067	638	1		f	55	\N	\N
1069	730	1		f	110	\N	\N
1068	641	3		f	180	\N	\N
1068	643	1		f	78	\N	\N
1068	769	1		f	25	\N	\N
1068	696	1		f	35	\N	\N
1068	716	1	Bora bora	f	60	\N	\N
1068	801	1		t	0	\N	\N
1068	801	1		f	42	\N	\N
1068	801	1		f	42	\N	\N
1070	683	1		f	18	\N	\N
1070	795	1		f	25	\N	\N
1070	795	1		f	25	\N	\N
1070	717	1		f	20	\N	\N
1070	804	1		f	42	\N	\N
1071	494	1		f	60	\N	\N
1071	686	1		f	28	\N	\N
1071	696	1		f	35	\N	\N
1071	696	1		f	35	\N	\N
1071	717	1		f	20	\N	\N
1071	849	1		f	45	\N	\N
1072	689	1		f	32	\N	\N
1072	716	1	Bora Bora caliente	f	60	\N	\N
1073	632	2		f	110	\N	\N
1073	769	2		f	50	\N	\N
1073	776	1		f	28	\N	\N
1073	778	1		f	28	\N	\N
1074	643	3		f	234	\N	\N
1074	662	1		f	95	\N	\N
1074	683	1		f	18	\N	\N
1074	769	1		f	25	\N	\N
1074	769	1		f	25	\N	\N
1074	769	1		f	25	\N	\N
1074	694	4		f	112	\N	\N
1074	696	1		f	35	\N	\N
1074	696	1		f	35	\N	\N
1074	711	1		f	48	\N	\N
1074	795	1		f	25	\N	\N
1074	797	1		f	35	\N	\N
1074	797	4		f	140	\N	\N
1074	797	2		f	70	\N	\N
1074	713	1		f	55	\N	\N
1074	715	1		f	35	\N	\N
1074	853	2		f	50	\N	\N
1075	647	1		f	60	\N	\N
1076	778	2		t	0	\N	\N
1076	778	2		f	56	\N	\N
1077	651	1		f	70	\N	\N
1077	721	1		f	250	\N	\N
1078	769	1		f	25	\N	\N
1079	653	1		f	0	3	\N
1079	708	1		f	45	\N	\N
1079	778	2		f	56	\N	\N
1080	671	1		f	140	\N	\N
1080	671	1		f	140	\N	\N
1080	493	1		f	60	\N	\N
1080	683	1		f	18	\N	\N
1080	683	1		f	18	\N	\N
1080	683	1		f	18	\N	\N
1080	686	1		f	28	\N	\N
1080	694	1		f	28	\N	\N
1080	694	1		f	28	\N	\N
1080	695	1		f	38	\N	\N
1080	716	1	Fantasia	f	60	\N	\N
1080	722	1		f	65	\N	\N
1080	777	1		f	28	\N	\N
1080	488	1		f	65	\N	\N
1083	684	1		f	18	\N	\N
1083	711	1		f	48	\N	\N
1083	776	1		f	28	\N	\N
1083	779	1		f	28	\N	\N
1083	777	1		f	28	\N	\N
1083	617	1		f	145	\N	\N
1081	778	1		f	28	\N	\N
1084	648	1		f	80	\N	\N
1084	689	1		f	32	\N	\N
1084	715	1		f	35	\N	\N
1085	641	1		f	60	\N	\N
1085	494	1		f	60	\N	\N
1085	768	1		f	15	\N	\N
1085	694	2		f	56	\N	\N
1085	717	1		f	20	\N	\N
1087	683	1		f	18	\N	\N
1087	705	1		f	38	\N	\N
1087	717	1		f	20	\N	\N
1087	488	1		f	65	\N	\N
1082	768	1		f	15	\N	\N
1082	769	1		f	25	\N	\N
1082	687	1		f	25	\N	\N
1082	699	2		f	130	\N	\N
1082	776	1		t	0	\N	\N
1082	715	1		f	35	\N	\N
1082	780	1		t	0	\N	\N
1086	635	1		f	60	\N	\N
1086	667	1		f	115	\N	\N
1086	776	1		f	28	\N	\N
1086	776	1		f	28	\N	\N
1086	780	1		f	35	\N	\N
1086	780	1		f	35	\N	\N
1088	653	1		f	60	\N	\N
1088	720	2		f	130	\N	\N
1089	679	1		f	75	\N	\N
1089	694	1		f	28	\N	\N
1089	716	1		f	60	\N	\N
1090	683	3		f	54	\N	\N
1090	769	1		f	25	\N	\N
1090	720	1		f	65	\N	\N
1090	722	1		f	65	\N	\N
1090	802	1		f	120	\N	\N
1090	836	3		f	600	\N	\N
1090	853	1		f	25	\N	\N
1091	732	2		f	220	\N	\N
1091	732	1		f	110	\N	\N
1093	471	1		f	250	\N	\N
1093	845	1		f	20	\N	\N
1092	683	2		f	36	\N	\N
1092	795	2		f	50	\N	\N
1095	471	1		f	250	\N	\N
1095	716	1		f	60	\N	\N
1094	476	1		f	330	\N	\N
1096	647	2		f	120	\N	\N
1097	683	1		f	18	\N	\N
1097	683	2		f	36	\N	\N
1097	694	2		f	56	\N	\N
1097	694	1		f	28	\N	\N
1100	705	1		t	0	\N	\N
1100	705	1		f	38	\N	\N
1101	831	2		f	46	\N	\N
1099	663	1		f	80	\N	\N
1099	490	1		f	55	\N	\N
1099	682	1		f	60	\N	\N
1099	683	1		f	18	\N	\N
1099	694	1		f	28	\N	\N
1099	614	1		f	120	\N	\N
1102	484	1		f	65	\N	\N
1102	687	1		f	25	\N	\N
1098	639	1		f	70	\N	\N
1098	651	1		f	70	\N	\N
1098	814	1		f	50	\N	\N
1098	711	1		f	48	\N	\N
1098	779	1		f	28	\N	\N
1098	717	1		f	20	\N	\N
1098	778	1		f	28	\N	\N
1098	623	1		f	230	\N	\N
1107	764	1		f	35	\N	\N
1104	779	1		f	28	\N	\N
1104	778	1		f	28	\N	\N
1105	493	1		f	60	\N	\N
1105	683	2		f	36	\N	\N
1105	683	2		f	36	\N	\N
1108	624	1		f	90	\N	\N
1108	694	1		f	28	\N	\N
1108	715	1		f	35	\N	\N
1108	821	1		f	35	\N	\N
1103	683	2		f	36	\N	\N
1103	683	1		f	18	\N	\N
1103	683	1		f	18	\N	\N
1103	484	1		f	65	\N	\N
1103	770	1		f	25	\N	\N
1103	771	1		f	25	\N	\N
1103	689	1		f	32	\N	\N
1103	718	1		f	25	\N	\N
1103	853	1		f	25	\N	\N
1111	634	1		f	70	\N	\N
1111	652	1		f	70	\N	\N
1111	493	1		f	60	\N	\N
1111	494	1		f	60	\N	\N
1111	777	1		f	28	\N	\N
1111	778	2		f	56	\N	\N
1109	683	1		f	18	\N	\N
1109	683	1		f	18	\N	\N
1109	687	1		f	25	\N	\N
1109	689	1		f	32	\N	\N
1109	694	1		f	28	\N	\N
1109	695	1		f	38	\N	\N
1109	718	1		f	25	\N	\N
1109	622	1		f	230	\N	\N
1110	687	1		f	25	\N	\N
1110	706	1		f	38	\N	\N
1110	488	1		f	65	\N	\N
1106	683	2		f	36	\N	\N
1106	683	2		f	36	\N	\N
1106	853	1		f	25	\N	\N
1106	853	1		f	25	\N	\N
1112	653	1		f	60	\N	\N
1112	650	1		f	55	\N	\N
1112	768	1		f	15	\N	\N
1112	795	1		f	25	\N	\N
1112	795	1		f	25	\N	\N
1112	795	1		f	25	\N	\N
1113	733	1		f	110	\N	\N
1115	723	1		f	80	\N	\N
1114	683	1		f	18	\N	\N
1114	779	1		f	28	\N	\N
1117	683	1		f	18	\N	\N
1117	769	1		f	25	\N	\N
1117	853	2		f	50	\N	\N
1116	751	1		f	120	\N	\N
1119	627	1		f	70	\N	\N
1118	485	1		f	65	\N	\N
1118	683	1		f	18	\N	\N
1118	484	1		f	65	\N	\N
\.


--
-- Data for Name: historico_promocion_productos; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.historico_promocion_productos (id_ticket, id_promocion, id_producto, nombre, cantidad, total) FROM stdin;
547	22	768	PAN CHICO 	0	0
\.


--
-- Data for Name: historico_promocion_ticket; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.historico_promocion_ticket (id_ticket, id_promocion, nombre, cantidad, total) FROM stdin;
547	22	CAFÉ AME + PAN	0	0
\.


--
-- Data for Name: historico_tickets; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.historico_tickets (id_ticket, id_user, fecha, id_folio, id_sucursal, hora, id_mesa, total, cancelado, tipo_pago, nombre, id_cortecaja, cortesia, efectivo_porcentaje) FROM stdin;
574	11	2019-09-05	218	3	08:35:24.652685	10	0	t	\N	Mesa 10	4	\N	\N
596	9	2019-09-06	240	3	11:20:33.593196	11	617	f	E	Mesa 11	4	0	0
631	12	2019-09-09	271	3	21:40:18.243888	4	80	f	E	Mesa 4	8	0	0
635	11	2019-09-09	275	3	21:46:43.018854	3	220	f	T	Mesa 3	8	0	0
547	9	2019-09-04	194	3	10:25:04.179081	9	87	f	E	Mesa 9	2	\N	\N
549	9	2019-09-04	195	3	17:09:11.168942	3	113	f	E	Mesa 3	2	0	0
553	9	2019-09-04	197	3	17:09:33.014963	8	366	f	E	Mesa 8	2	0	0
554	9	2019-09-04	198	3	17:09:44.766276	11	225	f	E	Mesa 11	2	0	0
555	11	2019-09-04	199	3	17:12:15.732432	11	25	f	E	Mesa 11	2	0	0
562	11	2019-09-04	206	3	19:48:24.129069	11	38	f	E	Mesa 11	2	0	0
563	11	2019-09-04	207	3	19:56:30.469166	11	18	f	E	Mesa 11	2	0	0
559	11	2019-09-04	203	3	21:49:22.029498	5	531	f	E	Mesa 5	2	0	0
566	11	2019-09-04	210	3	22:00:26.53716	11	185	f	E	Mesa 11	2	0	0
624	11	2019-09-09	264	3	16:25:54.896152	11	190	f	E	Mesa 11	8	0	0
630	12	2019-09-09	270	3	18:42:24.01067	11	458.399999999999977	f	E	Mesa 11	8	2	20
689	9	2019-09-12	329	3	09:37:37.493135	5	437	f	E	Mesa 5	13	0	0
568	9	2019-09-05	212	3	11:46:06.938466	9	225	f	E	Mesa 9	3	0	0
571	9	2019-09-05	215	3	14:42:32.843368	11	735	f	E	Mesa 11	3	0	0
570	9	2019-09-05	214	3	14:42:54.817602	10	181	f	E	Mesa 10	3	0	0
572	9	2019-09-05	216	3	14:44:04.76049	3	170	f	E	Mesa 3	3	0	0
580	11	2019-09-05	224	3	19:24:38.432715	11	25	f	E	Mesa 11	3	0	0
585	11	2019-09-05	229	3	21:40:50.27411	8	195	f	E	Mesa 8	3	0	0
694	9	2019-09-12	334	3	13:32:55.893408	9	158	f	E	Mesa 9	13	0	0
740	9	2019-09-14	380	3	14:30:27.396569	11	468	f	E	Mesa 11	17	0	0
643	9	2019-09-10	283	3	14:11:32.759796	2	353	f	E	Mesa 2	9	0	0
615	9	2019-09-09	255	3	13:57:27.973386	8	500	f	E	Mesa 8	7	0	0
616	9	2019-09-09	256	3	14:02:12.963562	9	110	f	E	Mesa 9	7	0	0
617	9	2019-09-09	257	3	14:02:22.826478	6	330	f	E	Mesa 6	7	0	0
618	9	2019-09-09	258	3	14:02:32.581695	3	118	f	E	Mesa 3	7	0	0
619	9	2019-09-09	259	3	14:04:32.085729	9	310	f	E	Mesa 9	7	0	0
733	10	2019-09-14	373	3	08:26:30.923796	11	272	f	E	Mesa 11	17	2	15
649	9	2019-09-10	289	3	14:19:18.918072	4	218	f	T	Mesa 4	9	0	0
644	9	2019-09-10	284	3	14:19:28.472963	9	110	f	E	Mesa 9	9	0	0
646	9	2019-09-10	286	3	14:20:50.711955	5	485	f	E	Mesa 5	9	0	0
642	9	2019-09-10	282	3	15:00:30.800617	11	331	f	E	Mesa 11	9	0	0
660	11	2019-09-10	300	3	18:14:07.760078	11	18	f	E	Mesa 11	10	0	0
666	11	2019-09-10	306	3	22:40:14.758478	2	298	f	T	Mesa 2	10	0	0
667	11	2019-09-10	307	3	09:29:44.624857	10	0	t	\N	Mesa 10	11	\N	\N
673	9	2019-09-11	313	3	15:13:40.97867	10	0	t	\N	Mesa 10	11	\N	\N
702	12	2019-09-12	342	3	18:23:07.43697	11	60	f	T	Mesa 11	14	0	0
703	11	2019-09-12	343	3	18:31:32.260467	11	65	f	E	Mesa 11	14	0	0
709	12	2019-09-12	349	3	21:49:21.095859	4	235	f	T	Mesa 4	14	0	0
678	11	2019-09-11	318	3	18:58:09.510563	11	43	f	E	Mesa 11	12	0	0
684	12	2019-09-11	324	3	20:35:54.313211	11	195	f	E	Mesa 11	12	0	0
681	11	2019-09-11	321	3	20:49:05.790094	6	325	f	T	Mesa 6	12	0	0
714	9	2019-09-13	354	3	09:13:08.803052	6	150	f	E	Mesa 6	15	0	0
720	12	2019-09-13	360	3	16:34:46.358729	9	312	f	T	Mesa 9	16	0	0
728	11	2019-09-13	368	3	20:25:34.53373	6	56	f	E	Mesa 6	16	0	0
722	12	2019-09-13	362	3	20:26:05.633502	9	423	f	T	Mesa 9	16	0	0
745	12	2019-09-14	385	3	21:49:10.575201	5	679	f	T	Mesa 5	18	0	0
747	12	2019-09-14	387	3	21:52:49.573869	4	265	f	T	Mesa 4	18	0	0
748	12	2019-09-14	388	3	21:57:44.072044	11	360	f	T	Mesa 11	18	0	0
754	9	2019-09-15	394	3	16:07:45.808359	10	643	f	E	Mesa 10	19	0	0
763	10	2019-09-15	403	3	20:41:55.829775	7	61	f	E	Mesa 7	20	0	0
759	10	2019-09-15	399	3	22:12:03.783784	10	25	f	E	Mesa 10	20	0	0
768	10	2019-09-15	408	3	22:12:19.211227	8	203	f	E	Mesa 8	20	0	0
762	10	2019-09-15	402	3	20:34:29.719987	8	450	f	E	Mesa 8	20	0	0
769	9	2019-09-16	409	3	09:31:21.26005	6	145	f	E	Mesa 6	20	0	0
771	9	2019-09-16	411	3	12:14:09.713668	11	250	f	E	Mesa 11	20	0	0
766	10	2019-09-15	406	3	21:36:01.814782	11	20	f	E	Mesa 11	20	0	0
767	10	2019-09-15	407	3	21:36:55.943585	1	130	f	E	Mesa 1	20	0	0
772	11	2019-09-16	412	3	17:28:16.150061	8	460	f	T	Mesa 8	21	0	0
741	12	2019-09-14	381	3	16:05:19.558784	11	360	f	E	Mesa 11	18	0	0
591	9	2019-09-06	235	3	09:49:28.14065	6	110	f	E	Mesa 6	4	0	0
595	9	2019-09-06	239	3	11:48:01.533542	5	349	f	T	Mesa 5	4	0	0
549	9	2019-09-04	195	3	17:09:11.178276	3	113	f	E	Mesa 3	2	0	0
561	11	2019-09-04	205	3	20:06:55.81325	9	98	f	E	Mesa 9	2	0	0
565	11	2019-09-04	209	3	23:01:37.845119	8	318	f	E	Mesa 8	2	0	0
556	11	2019-09-04	200	3	23:08:09.595979	10	174	f	E	Mesa 10	2	0	0
641	12	2019-09-09	281	3	22:08:08.111465	11	115	f	E	Mesa 11	8	0	0
625	11	2019-09-09	265	3	17:05:13.95324	11	25	f	E	Mesa 11	8	0	0
627	11	2019-09-09	267	3	17:13:50.167773	11	18	f	E	Mesa 11	8	0	0
632	12	2019-09-09	272	3	19:14:37.397374	6	138	f	E	Mesa 6	8	0	0
628	11	2019-09-09	268	3	19:16:08.17287	9	84	f	E	Mesa 9	8	0	0
634	11	2019-09-09	274	3	19:20:59.055248	11	28	f	E	Mesa 11	8	0	0
567	9	2019-09-05	211	3	12:13:47.212802	8	245	f	E	Mesa 8	3	0	0
569	9	2019-09-05	213	3	12:14:44.566258	9	110	f	E	Mesa 9	3	0	0
573	11	2019-09-05	217	3	15:32:34.207434	11	60	f	E	Mesa 11	3	0	0
581	11	2019-09-05	225	3	20:28:11.433513	11	25	f	E	Mesa 11	3	0	0
582	11	2019-09-05	226	3	20:29:12.496714	5	48	f	E	Mesa 5	3	0	0
588	11	2019-09-05	232	3	21:56:42.153854	11	20	f	E	Mesa 11	3	0	0
589	11	2019-09-05	233	3	21:57:44.748767	11	70	f	E	Mesa 11	3	0	0
587	11	2019-09-05	231	3	21:57:59.118049	2	164	f	E	Mesa 2	3	0	0
579	11	2019-09-05	223	3	21:58:21.726579	7	80	f	E	Mesa 7	3	0	0
590	11	2019-09-05	234	3	22:06:24.825622	11	20	f	E	Mesa 11	3	0	0
645	9	2019-09-10	285	3	14:20:37.458666	8	111	f	E	Mesa 8	9	0	0
647	9	2019-09-10	287	3	14:21:09.424378	1	412	f	E	Mesa 1	9	0	0
621	9	2019-09-09	261	3	14:51:28.945614	11	0	t	\N	Mesa 11	7	\N	\N
610	9	2019-09-09	254	3	14:52:13.657075	10	68	f	E	Mesa 10	7	0	0
622	9	2019-09-09	262	3	15:03:21.41603	11	478	f	E	Mesa 11	7	0	0
749	12	2019-09-14	389	3	23:21:10.026796	9	456	f	E	Mesa 9	18	0	0
690	9	2019-09-12	330	3	14:32:00.049119	11	419	f	E	Mesa 11	13	0	0
697	9	2019-09-12	337	3	14:45:30.94763	11	35	f	E	Mesa 11	13	0	0
698	9	2019-09-12	338	3	14:54:40.325375	11	78	f	E	Mesa 11	13	0	0
699	9	2019-09-12	339	3	14:57:05.094426	11	60	f	E	Mesa 11	13	0	0
656	12	2019-09-10	296	3	15:35:45.459546	11	330	f	T	Mesa 11	10	0	0
661	11	2019-09-10	301	3	19:18:04.886623	11	380	f	E	Mesa 11	10	0	0
665	11	2019-09-10	305	3	23:23:39.74158	6	300	f	E	Mesa 6	10	0	0
691	9	2019-09-12	331	3	10:17:40.615451	2	252	f	E	Mesa 2	13	0	0
668	9	2019-09-11	308	3	11:02:34.675366	9	266	f	E	Mesa 9	11	0	0
692	9	2019-09-12	332	3	10:18:13.771464	10	73	f	E	Mesa 10	13	0	0
742	12	2019-09-14	382	3	23:21:26.646312	10	221	f	E	Mesa 10	18	0	0
674	11	2019-09-11	314	3	16:15:13.602121	11	25	f	E	Mesa 11	12	0	0
682	12	2019-09-11	322	3	19:54:27.526119	11	68	f	E	Mesa 11	12	0	0
680	11	2019-09-11	320	3	22:10:57.895519	9	183	f	T	Mesa 9	12	0	0
685	12	2019-09-11	325	3	22:22:01.779232	4	70	f	E	Mesa 4	12	0	0
723	11	2019-09-13	363	3	18:36:42.399835	6	360	f	E	Mesa 6	16	0	0
704	12	2019-09-12	344	3	19:55:10.121826	6	131	f	T	Mesa 6	14	0	0
710	11	2019-09-12	350	3	22:31:32.254499	7	143	f	E	Mesa 7	14	0	0
725	11	2019-09-13	365	3	18:37:28.560725	11	60	f	E	Mesa 11	16	0	0
726	11	2019-09-13	366	3	22:02:41.916681	3	36	f	E	Mesa 3	16	0	0
730	11	2019-09-13	370	3	22:02:52.444146	7	233	f	E	Mesa 7	16	0	0
713	9	2019-09-13	353	3	14:53:28.78705	10	61	f	E	Mesa 10	15	0	0
717	9	2019-09-13	357	3	14:57:43.359281	11	328	f	E	Mesa 11	15	0	0
718	9	2019-09-13	358	3	14:58:35.004136	11	70	f	E	Mesa 11	15	0	0
734	9	2019-09-14	374	3	11:27:23.920197	9	110	f	E	Mesa 9	17	0	0
770	9	2019-09-16	410	3	13:51:00.808754	4	235	f	E	Mesa 4	20	0	0
765	10	2019-09-15	405	3	21:02:26.380906	3	260	f	E	Mesa 3	20	0	0
764	10	2019-09-15	404	3	22:21:19.48065	6	388	f	E	Mesa 6	20	0	0
755	9	2019-09-15	395	3	17:02:53.373667	8	319	f	E	Mesa 8	19	0	0
780	11	2019-09-16	420	3	18:58:48.193622	11	240	f	E	Mesa 11	21	0	0
779	11	2019-09-16	419	3	19:18:35.932489	8	92	f	E	Mesa 8	21	0	0
479	9	2019-09-02	132	3	\N	2	0	t	\N	Mesa 2	1	\N	\N
481	9	2019-09-02	134	3	\N	2	0	t	\N	Mesa 2	1	\N	\N
482	9	2019-09-02	135	3	\N	10	0	t	\N	Mesa 10	1	\N	\N
480	1	2019-09-02	133	3	\N	1	0	t	\N	Mesa 1	1	\N	\N
483	1	2019-09-02	136	3	\N	10	0	t	\N	Mesa 10	1	\N	\N
484	9	2019-09-02	137	3	\N	10	0	t	\N	Mesa 10	1	\N	\N
487	9	2019-09-02	140	3	\N	9	28	f	E	Mesa 9	1	\N	\N
488	9	2019-09-02	141	3	\N	9	86	f	E	Mesa 9	1	\N	\N
486	9	2019-09-02	139	3	\N	3	195	f	E	Mesa 3	1	\N	\N
491	9	2019-09-02	144	3	\N	1	92	f	E	Mesa 1	1	\N	\N
490	9	2019-09-02	143	3	\N	8	225	f	E	Mesa 8	1	\N	\N
492	9	2019-09-02	145	3	\N	1	130	f	E	Mesa 1	1	\N	\N
489	9	2019-09-02	142	3	\N	6	126	f	E	Mesa 6	1	\N	\N
493	9	2019-09-02	146	3	\N	1	60	f	E	Mesa 1	1	\N	\N
494	9	2019-09-02	147	3	\N	11	0	t	\N	Mesa 11	1	\N	\N
495	9	2019-09-02	148	3	\N	11	28	f	E	Mesa 11	1	\N	\N
497	9	2019-09-02	150	3	\N	11	48	f	E	Mesa 11	1	\N	\N
500	9	2019-09-02	153	3	\N	11	80	f	E	Mesa 11	1	\N	\N
499	9	2019-09-02	152	3	\N	9	246	f	E	Mesa 9	1	\N	\N
498	9	2019-09-02	151	3	\N	4	0	t	\N	Mesa 4	1	\N	\N
496	1	2019-09-02	149	3	\N	1	0	t	\N	Mesa 1	1	\N	\N
485	9	2019-09-02	138	3	\N	10	171	f	E	Mesa 10	1	\N	\N
501	11	2019-09-02	154	3	\N	11	160	f	E	Mesa 11	1	\N	\N
503	11	2019-09-02	156	3	\N	9	35	f	E	Mesa 9	1	\N	\N
504	11	2019-09-02	157	3	\N	7	265	f	E	Mesa 7	1	\N	\N
506	11	2019-09-02	159	3	\N	8	205	f	E	Mesa 8	1	\N	\N
505	11	2019-09-02	158	3	\N	9	278	f	E	Mesa 9	1	\N	\N
507	11	2019-09-02	160	3	\N	11	90	f	E	Mesa 11	1	\N	\N
508	11	2019-09-02	161	3	\N	11	65	f	E	Mesa 11	1	\N	\N
509	11	2019-09-02	162	3	\N	2	133	f	E	Mesa 2	1	\N	\N
557	11	2019-09-04	201	3	18:33:33.588541	7	194	f	E	Mesa 7	2	0	0
560	11	2019-09-04	204	3	20:43:25.267635	8	138	f	E	Mesa 8	2	0	0
669	9	2019-09-11	309	3	12:05:25.030208	11	498	f	E	Mesa 11	11	0	0
637	11	2019-09-09	277	3	22:33:46.432957	5	366	f	E	Mesa 5	8	0	0
592	9	2019-09-06	236	3	09:59:53.294515	2	263	f	E	Mesa 2	4	0	0
575	11	2019-09-05	219	3	16:35:25.249659	11	60	f	E	Mesa 11	3	0	0
576	11	2019-09-05	220	3	16:36:36.729685	11	35	f	E	Mesa 11	3	0	0
584	11	2019-09-05	228	3	20:52:09.544414	3	138	f	E	Mesa 3	3	0	0
586	11	2019-09-05	230	3	22:43:23.117473	9	249	f	E	Mesa 9	3	0	0
597	9	2019-09-06	241	3	15:14:13.259862	11	184	f	E	Mesa 11	4	0	0
598	9	2019-09-06	242	3	15:15:02.670065	10	80	f	E	Mesa 10	4	0	0
626	11	2019-09-09	266	3	17:31:16.622159	4	65	f	E	Mesa 4	8	0	0
620	9	2019-09-09	260	3	15:38:39.767093	3	113	f	E	Mesa 3	7	0	0
670	9	2019-09-11	310	3	12:12:03.540975	11	45	f	E	Mesa 11	11	0	0
671	9	2019-09-11	311	3	12:13:23.4814	11	60	f	E	Mesa 11	11	0	0
638	11	2019-09-09	278	3	20:55:29.540009	2	146	f	T	Mesa 2	8	0	0
636	12	2019-09-09	276	3	21:06:23.975372	9	153	f	E	Mesa 9	8	0	0
640	12	2019-09-09	280	3	21:16:38.452852	11	65	f	E	Mesa 11	8	0	0
639	12	2019-09-09	279	3	21:18:41.797067	6	217	f	E	Mesa 6	8	0	0
648	9	2019-09-10	288	3	14:21:21.267012	2	93	f	E	Mesa 2	9	0	0
675	12	2019-09-11	315	3	17:12:00.530021	11	15	f	E	Mesa 11	12	0	0
683	11	2019-09-11	323	3	20:19:49.604353	11	80	f	E	Mesa 11	12	0	0
657	12	2019-09-10	297	3	15:37:39.583348	11	120	f	E	Mesa 11	10	0	0
664	11	2019-09-10	304	3	19:44:35.503309	10	18	f	E	Mesa 10	10	0	0
659	12	2019-09-10	299	3	19:52:31.746257	4	198	f	E	Mesa 4	10	0	0
663	11	2019-09-10	303	3	19:52:48.132611	11	240	f	E	Mesa 11	10	0	0
686	11	2019-09-11	326	3	23:24:12.654709	3	178	f	E	Mesa 3	12	0	0
693	9	2019-09-12	333	3	11:35:05.980855	9	208	f	E	Mesa 9	13	0	0
696	9	2019-09-12	336	3	11:53:50.367946	10	180	f	E	Mesa 10	13	0	0
716	9	2019-09-13	356	3	15:19:30.393727	7	593	f	E	Mesa 7	15	0	0
700	11	2019-09-12	340	3	15:53:26.901088	11	120	f	E	Mesa 11	14	0	0
701	12	2019-09-12	341	3	15:53:36.607446	10	195	f	E	Mesa 10	14	0	0
705	11	2019-09-12	345	3	20:35:12.5223	3	161	f	E	Mesa 3	14	0	0
712	11	2019-09-12	352	3	23:12:27.141468	10	86	f	E	Mesa 10	14	0	0
711	12	2019-09-12	351	3	23:12:38.232834	9	131	f	E	Mesa 9	14	0	0
715	9	2019-09-13	355	3	15:26:09.319378	5	135	f	E	Mesa 5	15	0	0
724	12	2019-09-13	364	3	19:15:52.958894	4	156	f	E	Mesa 4	16	0	0
727	12	2019-09-13	367	3	19:14:32.906971	11	216	f	E	Mesa 11	16	0	0
729	11	2019-09-13	369	3	22:17:33.187616	8	211	f	E	Mesa 8	16	0	0
731	10	2019-09-13	371	3	22:17:44.755476	9	260	f	T	Mesa 9	16	0	0
735	9	2019-09-14	375	3	12:37:14.217908	11	75	f	E	Mesa 11	17	0	0
736	9	2019-09-14	376	3	12:48:02.969426	11	198	f	E	Mesa 11	17	0	0
737	9	2019-09-14	377	3	12:50:58.319747	11	40	f	T	Mesa 11	17	0	0
744	12	2019-09-14	384	3	20:37:04.783824	9	73	f	E	Mesa 9	18	0	0
743	12	2019-09-14	383	3	20:54:19.934559	6	393	f	E	Mesa 6	18	0	0
750	12	2019-09-14	390	3	23:50:12.794958	8	139	f	E	Mesa 8	18	0	0
757	10	2019-09-15	397	3	17:38:16.221255	11	325	f	E	Mesa 11	20	0	0
623	11	2019-09-09	263	3	16:14:35.629515	11	36	f	E	Mesa 11	8	0	0
552	9	2019-09-04	196	3	13:07:44.890266	11	562	f	E	Mesa 11	2	1	0
558	11	2019-09-04	202	3	19:31:35.259915	6	76	f	E	Mesa 6	2	0	0
564	11	2019-09-04	208	3	21:05:36.248793	11	475	f	E	Mesa 11	2	0	0
629	11	2019-09-09	269	3	18:19:00.334112	11	60	f	E	Mesa 11	8	1	5
594	9	2019-09-06	238	3	10:46:31.20705	9	115	f	E	Mesa 9	4	0	0
510	11	2019-09-02	163	3	\N	6	101	f	E	Mesa 6	1	\N	\N
511	11	2019-09-02	164	3	\N	3	326	f	E	Mesa 3	1	\N	\N
512	11	2019-09-02	165	3	\N	2	235	f	E	Mesa 2	1	\N	\N
513	11	2019-09-02	166	3	\N	9	186	f	E	Mesa 9	1	\N	\N
502	11	2019-09-02	155	3	\N	10	0	f	C	Mesa 10	1	\N	\N
515	9	2019-09-03	168	3	\N	3	199	f	E	Mesa 3	1	\N	\N
516	9	2019-09-03	169	3	\N	9	290	f	E	Mesa 9	1	\N	\N
517	9	2019-09-03	170	3	\N	2	173	f	E	Mesa 2	1	\N	\N
518	9	2019-09-03	171	3	\N	10	165	f	E	Mesa 10	1	\N	\N
514	9	2019-09-03	167	3	\N	5	1468	f	E	Mesa 5	1	\N	\N
524	9	2019-09-03	172	3	\N	11	65	f	T	Mesa 11	1	\N	\N
525	9	2019-09-03	173	3	\N	11	330	f	E	Mesa 11	1	\N	\N
526	9	2019-09-03	174	3	\N	11	444	f	E	Mesa 11	1	\N	\N
527	9	2019-09-03	175	3	\N	10	43	f	E	Mesa 10	1	\N	\N
528	11	2019-09-03	176	3	\N	6	306	f	E	Mesa 6	1	\N	\N
529	11	2019-09-03	177	3	\N	11	170	f	T	Mesa 11	1	\N	\N
530	11	2019-09-03	178	3	\N	11	60	f	E	Mesa 11	1	\N	\N
532	11	2019-09-03	180	3	\N	8	346	f	E	Mesa 8	1	\N	\N
531	11	2019-09-03	179	3	\N	5	90	f	E	Mesa 5	1	\N	\N
533	11	2019-09-03	181	3	\N	6	330	f	E	Mesa 6	1	\N	\N
536	11	2019-09-03	184	3	\N	8	465	f	E	Mesa 8	1	\N	\N
534	11	2019-09-03	182	3	\N	10	209	f	C	Mesa 10	1	\N	\N
537	11	2019-09-03	185	3	\N	2	223	f	E	Mesa 2	1	\N	\N
538	11	2019-09-03	186	3	\N	4	145	f	T	Mesa 4	1	\N	\N
539	11	2019-09-03	187	3	\N	9	61	f	E	Mesa 9	1	\N	\N
540	11	2019-09-03	188	3	\N	7	126	f	E	Mesa 7	1	\N	\N
541	11	2019-09-03	189	3	\N	10	170	f	E	Mesa 10	1	\N	\N
542	11	2019-09-03	190	3	\N	9	473	f	E	Mesa 9	1	\N	\N
543	11	2019-09-03	191	3	\N	6	175	f	E	Mesa 6	1	\N	\N
544	11	2019-09-03	192	3	\N	10	25	f	E	Mesa 10	1	\N	\N
545	11	2019-09-03	193	3	\N	5	588	f	E	Mesa 5	1	\N	\N
535	1	2019-09-03	183	3	\N	11	0	t	\N	Mesa 11	1	\N	\N
593	9	2019-09-06	237	3	10:46:42.240593	8	245	f	E	Mesa 8	4	0	0
578	11	2019-09-05	222	3	19:22:30.827905	9	63	f	E	Mesa 9	3	0	0
577	11	2019-09-05	221	3	19:23:04.750135	4	230	f	E	Mesa 4	3	0	0
583	11	2019-09-05	227	3	21:21:41.728698	6	286	f	E	Mesa 6	3	0	0
599	11	2019-09-06	243	3	16:29:15.070004	1	380	f	E	Mesa 1	5	0	0
719	12	2019-09-13	359	3	16:04:43.103747	11	33	f	E	Mesa 11	16	0	0
721	11	2019-09-13	361	3	19:28:43.175746	8	774	f	T	Mesa 8	16	0	0
708	11	2019-09-12	348	3	20:40:18.073423	4	173	f	E	Mesa 4	14	0	0
633	11	2019-09-09	273	3	08:03:12.207935	10	0	t	\N	Mesa 10	9	\N	\N
650	9	2019-09-10	290	3	14:22:37.80911	6	131	f	E	Mesa 6	9	0	0
651	9	2019-09-10	291	3	14:23:55.071556	6	130	f	T	Mesa 6	9	0	0
652	9	2019-09-10	292	3	14:25:18.670181	6	138	f	E	Mesa 6	9	0	0
653	9	2019-09-10	293	3	14:26:20.95464	6	60	f	E	Mesa 6	9	0	0
654	9	2019-09-10	294	3	14:27:50.800471	6	115	f	E	Mesa 6	9	0	0
655	9	2019-09-10	295	3	14:28:45.368111	6	125	f	E	Mesa 6	9	0	0
706	12	2019-09-12	346	3	20:40:28.710358	2	275	f	T	Mesa 2	14	0	0
658	12	2019-09-10	298	3	17:01:04.507006	4	290	f	T	Mesa 4	10	0	0
662	12	2019-09-10	302	3	20:24:41.691101	9	326	f	E	Mesa 9	10	0	0
677	12	2019-09-11	317	3	17:21:41.713657	2	760	f	T	Mesa 2	12	0	0
672	9	2019-09-11	312	3	14:28:54.536858	9	146	f	E	Mesa 9	11	0	0
676	12	2019-09-11	316	3	17:24:03.217453	11	90	f	E	Mesa 11	12	0	0
679	12	2019-09-11	319	3	20:26:49.961066	4	198	f	E	Mesa 4	12	0	0
688	11	2019-09-11	328	3	23:58:42.987093	6	118	f	E	Mesa 6	12	0	0
687	11	2019-09-11	327	3	23:59:11.075731	10	157	f	E	Mesa 10	12	0	0
707	11	2019-09-12	347	3	20:39:41.270079	9	43	f	E	Mesa 9	14	0	0
695	9	2019-09-12	335	3	12:18:10.701824	6	130	f	E	Mesa 6	13	0	0
732	11	2019-09-13	372	3	23:19:07.786005	10	25	f	E	Mesa 10	16	0	0
738	9	2019-09-14	378	3	14:04:02.388347	8	322	f	E	Mesa 8	17	0	0
739	9	2019-09-14	379	3	14:04:12.187629	6	160	f	E	Mesa 6	17	0	0
746	12	2019-09-14	386	3	21:04:57.556023	3	108	f	E	Mesa 3	18	0	0
753	9	2019-09-15	393	3	12:10:40.588985	11	50	f	E	Mesa 11	19	0	0
752	9	2019-09-15	392	3	12:33:36.874464	4	290	f	T	Mesa 4	19	0	0
751	9	2019-09-15	391	3	12:38:14.130294	9	308	f	E	Mesa 9	19	0	0
756	10	2019-09-15	396	3	17:47:07.185475	7	145	f	E	Mesa 7	20	0	0
760	10	2019-09-15	400	3	18:56:50.123038	11	144	f	E	Mesa 11	20	0	0
758	10	2019-09-15	398	3	19:10:30.295717	6	706	f	E	Mesa 6	20	0	0
761	10	2019-09-15	401	3	19:12:15.170209	11	375	f	T	Mesa 11	20	0	0
778	12	2019-09-16	418	3	19:19:00.932801	7	378	f	E	Mesa 7	21	0	0
782	11	2019-09-16	422	3	22:20:59.222254	3	360	f	E	Mesa 3	21	0	0
783	12	2019-09-16	423	3	23:34:42.126799	11	70	f	E	Mesa 11	21	0	0
784	11	2019-09-16	424	3	23:39:35.854846	8	376	f	E	Mesa 8	21	0	0
787	12	2019-09-16	427	3	23:39:47.651863	7	203	f	E	Mesa 7	21	0	0
789	9	2019-09-17	429	3	10:06:50.718625	4	213	f	E	Mesa 4	21	0	0
792	9	2019-09-17	432	3	12:08:09.612431	11	60	f	E	Mesa 11	21	0	0
791	9	2019-09-17	431	3	12:15:55.360065	3	50	f	E	Mesa 3	21	0	0
775	12	2019-09-16	415	3	18:29:38.460447	10	401	f	E	Mesa 10	21	0	0
773	12	2019-09-16	413	3	16:51:13.188101	11	98	f	E	Mesa 11	21	0	0
774	11	2019-09-16	414	3	17:00:22.257165	11	100	f	E	Mesa 11	21	0	0
777	12	2019-09-16	417	3	21:06:19.096701	4	221	f	E	Mesa 4	21	0	0
781	12	2019-09-16	421	3	21:06:49.36474	6	255	f	E	Mesa 6	21	0	0
776	11	2019-09-16	416	3	21:07:41.325126	9	233	f	E	Mesa 9	21	0	0
786	11	2019-09-16	426	3	23:17:48.443569	6	170	f	E	Mesa 6	21	0	0
785	11	2019-09-16	425	3	23:18:03.776394	9	161	f	E	Mesa 9	21	0	0
788	9	2019-09-17	428	3	09:08:17.314583	11	80	f	E	Mesa 11	21	0	0
790	9	2019-09-17	430	3	10:26:54.724132	9	85	f	E	Mesa 9	21	0	0
793	9	2019-09-17	433	3	13:15:47.165842	7	56	f	E	Mesa 7	21	0	0
795	9	2019-09-17	435	3	15:04:35.697618	11	325	f	E	Mesa 11	21	0	0
794	9	2019-09-17	434	3	15:09:26.698367	8	145	f	E	Mesa 8	21	0	0
799	11	2019-09-17	439	3	19:42:37.392674	10	60	f	E	Mesa 10	22	0	0
800	12	2019-09-17	440	3	20:38:48.550611	10	125	f	E	Mesa 10	22	0	0
798	12	2019-09-17	438	3	21:23:27.794029	3	193	f	E	Mesa 3	22	0	0
801	11	2019-09-17	441	3	22:06:21.820521	8	279	f	T	Mesa 8	22	0	0
797	11	2019-09-17	437	3	22:06:31.633945	9	111	f	E	Mesa 9	22	0	0
802	12	2019-09-17	442	3	23:16:44.755205	9	240	f	E	Mesa 9	22	0	0
796	11	2019-09-17	436	3	23:16:53.086883	11	189	f	E	Mesa 11	22	0	0
803	9	2019-09-18	443	3	09:06:46.707907	9	220	f	E	Mesa 9	23	0	0
804	9	2019-09-18	444	3	09:06:58.190761	11	264	f	E	Mesa 11	23	0	0
805	9	2019-09-18	445	3	09:28:47.033256	11	120	f	T	Mesa 11	23	0	0
806	9	2019-09-18	446	3	10:23:13.926849	4	235	f	T	Mesa 4	23	0	0
807	9	2019-09-18	447	3	10:32:44.408143	11	70	f	E	Mesa 11	23	0	0
808	9	2019-09-18	448	3	12:54:33.625698	8	240	f	T	Mesa 8	23	0	0
809	9	2019-09-18	449	3	14:23:18.342166	11	60	f	E	Mesa 11	23	0	0
810	9	2019-09-18	450	3	15:12:25.824752	11	401	f	E	Mesa 11	23	0	0
812	11	2019-09-18	452	3	17:30:21.365035	2	413	f	E	Mesa 2	24	0	0
813	12	2019-09-18	453	3	18:56:57.094446	9	266	f	E	Mesa 9	24	0	0
817	12	2019-09-18	457	3	20:08:33.997355	4	78	f	E	Mesa 4	24	0	0
816	12	2019-09-18	456	3	20:27:23.991723	3	170	f	E	Mesa 3	24	0	0
814	12	2019-09-18	454	3	20:58:50.104548	6	139	f	E	Mesa 6	24	0	0
818	12	2019-09-18	458	3	21:05:04.989213	10	0	t	\N	Mesa 10	24	\N	\N
815	11	2019-09-18	455	3	21:30:07.036304	5	189.900000000000006	f	E	Mesa 5	24	2	10
811	11	2019-09-18	451	3	23:16:18.377366	11	91	f	E	Mesa 11	24	0	0
842	12	2019-09-19	482	3	22:12:17.56005	2	235	f	T	Mesa 2	26	0	0
843	12	2019-09-19	483	3	23:31:15.650033	3	203	f	E	Mesa 3	26	0	0
844	11	2019-09-19	484	3	23:31:25.030315	6	566	f	E	Mesa 6	26	0	0
835	11	2019-09-19	475	3	23:33:08.795095	11	573	f	E	Mesa 11	26	0	0
832	11	2019-09-19	472	3	16:51:22.674018	10	330	f	E	Mesa 10	26	0	0
831	11	2019-09-19	471	3	16:55:34.782956	3	95	f	E	Mesa 3	26	0	0
819	9	2019-09-19	459	3	09:33:34.155374	9	110	f	E	Mesa 9	25	0	0
820	9	2019-09-19	460	3	10:52:13.180407	3	140	f	E	Mesa 3	25	0	0
821	9	2019-09-19	461	3	11:08:39.090049	6	89	f	E	Mesa 6	25	0	0
822	9	2019-09-19	462	3	11:24:03.63739	2	199	f	E	Mesa 2	25	0	0
823	9	2019-09-19	463	3	11:52:51.683327	10	190	f	E	Mesa 10	25	0	0
824	9	2019-09-19	464	3	12:54:33.796144	2	205	f	E	Mesa 2	25	0	0
828	9	2019-09-19	468	3	14:39:13.403663	6	638	f	E	Mesa 6	25	0	0
826	9	2019-09-19	466	3	14:48:27.011148	9	288	f	E	Mesa 9	25	0	0
827	9	2019-09-19	467	3	14:48:35.359778	1	206	f	E	Mesa 1	25	0	0
825	9	2019-09-19	465	3	14:50:38.106113	11	415	f	E	Mesa 11	25	0	0
829	9	2019-09-19	469	3	14:51:49.356367	11	70	f	E	Mesa 11	25	0	0
846	10	2019-09-20	486	3	11:12:28.786325	6	419	f	E	Mesa 6	27	0	0
833	11	2019-09-19	473	3	16:56:09.006099	11	0	t	\N	Mesa 11	26	\N	\N
834	12	2019-09-19	474	3	17:37:34.443441	7	261	f	E	Mesa 7	26	0	0
830	12	2019-09-19	470	3	18:04:57.981761	5	593	f	E	Mesa 5	26	0	0
837	12	2019-09-19	477	3	19:14:26.527483	6	63	f	T	Mesa 6	26	0	0
838	11	2019-09-19	478	3	20:31:46.084328	7	63	f	E	Mesa 7	26	0	0
836	11	2019-09-19	476	3	20:57:00.184345	6	423	f	E	Mesa 6	26	0	0
839	12	2019-09-19	479	3	20:57:34.587483	3	178	f	E	Mesa 3	26	0	0
841	12	2019-09-19	481	3	21:00:13.517094	7	256	f	E	Mesa 7	26	0	0
840	12	2019-09-19	480	3	21:39:58.068854	4	151	f	E	Mesa 4	26	0	0
853	10	2019-09-20	493	3	11:28:10.18031	3	115	f	E	Mesa 3	27	0	0
855	10	2019-09-20	495	3	11:44:02.953813	9	129	f	E	Mesa 9	27	0	0
857	10	2019-09-20	497	3	13:34:04.000013	6	98	f	E	Mesa 6	27	0	0
859	10	2019-09-20	499	3	14:32:32.128483	7	86	f	E	Mesa 7	27	0	0
860	10	2019-09-20	500	3	15:20:22.798243	11	160	f	E	Mesa 11	27	0	0
858	10	2019-09-20	498	3	15:29:50.786315	10	236	f	E	Mesa 10	27	0	0
845	10	2019-09-20	485	3	09:52:25.588568	6	0	t	\N	Mesa 6	27	\N	\N
849	10	2019-09-20	489	3	10:10:29.854611	1	88	f	E	Mesa 1	27	0	0
850	10	2019-09-20	490	3	10:12:19.464012	11	140	f	E	Mesa 11	27	0	0
851	10	2019-09-20	491	3	10:13:33.473321	11	100	f	E	Mesa 11	27	0	0
852	10	2019-09-20	492	3	10:15:50.244517	11	64	f	E	Mesa 11	27	0	0
847	10	2019-09-20	487	3	10:17:10.277345	2	213	f	E	Mesa 2	27	0	0
854	10	2019-09-20	494	3	10:58:03.637156	11	184	f	E	Mesa 11	27	0	0
848	10	2019-09-20	488	3	11:11:10.845364	4	153	f	E	Mesa 4	27	0	0
861	12	2019-09-20	501	3	16:02:19.347045	6	353	f	E	Mesa 6	28	0	0
856	10	2019-09-20	496	3	16:03:27.202162	9	148	f	E	Mesa 9	28	0	0
863	11	2019-09-20	503	3	17:17:06.104651	11	85	f	E	Mesa 11	28	0	0
864	12	2019-09-20	504	3	18:52:12.231607	4	280	f	E	Mesa 4	28	0	0
865	12	2019-09-20	505	3	19:20:07.763715	11	200	f	E	Mesa 11	28	0	0
862	11	2019-09-20	502	3	19:26:52.843346	5	430	f	E	Mesa 5	28	0	0
868	12	2019-09-20	508	3	20:44:38.627377	11	80	f	E	Mesa 11	28	0	0
867	12	2019-09-20	507	3	21:20:43.331189	7	513	f	E	Mesa 7	28	0	0
870	12	2019-09-20	510	3	21:33:00.526105	7	90	f	E	Mesa 7	28	0	0
866	11	2019-09-20	506	3	21:33:30.459413	9	108	f	E	Mesa 9	28	0	0
871	12	2019-09-20	511	3	22:47:34.467216	3	113	f	T	Mesa 3	28	0	0
872	11	2019-09-20	512	3	23:15:23.139912	11	90	f	E	Mesa 11	28	0	0
873	11	2019-09-20	513	3	23:16:13.721199	10	202	f	E	Mesa 10	28	0	0
869	11	2019-09-20	509	3	23:22:46.652034	5	346	f	E	Mesa 5	28	0	0
874	10	2019-09-21	514	3	08:24:38.166746	4	63	f	E	Mesa 4	29	0	0
875	10	2019-09-21	515	3	08:58:23.740396	11	43	f	E	Mesa 11	29	0	0
876	10	2019-09-21	516	3	10:06:19.51894	11	79	f	E	Mesa 11	29	0	0
877	10	2019-09-21	517	3	10:42:13.064917	11	100	f	E	Mesa 11	29	0	0
878	10	2019-09-21	518	3	10:44:44.223672	11	33	f	T	Mesa 11	29	0	0
879	10	2019-09-21	519	3	12:37:10.998468	11	200	f	C	Mesa 11	29	0	0
880	10	2019-09-21	520	3	12:39:07.807995	11	83	f	E	Mesa 11	29	0	0
881	10	2019-09-21	521	3	13:42:49.541399	6	57	f	E	Mesa 6	29	0	0
882	10	2019-09-21	522	3	13:43:54.92102	11	720	f	E	Mesa 11	29	0	0
883	10	2019-09-21	523	3	14:43:12.761002	11	80	f	E	Mesa 11	29	0	0
884	10	2019-09-21	524	3	14:47:30.378723	10	185	f	E	Mesa 10	29	0	0
899	12	2019-09-21	539	3	21:47:06.10016	5	316	f	E	Mesa 5	30	0	0
902	11	2019-09-21	542	3	21:52:26.402798	9	268	f	E	Mesa 9	30	0	0
900	11	2019-09-21	540	3	22:58:07.736354	7	189	f	E	Mesa 7	30	0	0
906	12	2019-09-21	546	3	22:58:21.095801	6	352	f	E	Mesa 6	30	0	0
889	11	2019-09-21	529	3	23:09:51.853562	10	97	f	E	Mesa 10	30	0	0
905	11	2019-09-21	545	3	23:10:27.441204	4	208	f	E	Mesa 4	30	0	0
885	12	2019-09-21	525	3	17:18:39.949713	11	468	f	E	Mesa 11	30	0	0
886	11	2019-09-21	526	3	17:19:00.818723	6	50	f	E	Mesa 6	30	0	0
887	11	2019-09-21	527	3	17:41:17.697741	11	210	f	E	Mesa 11	30	0	0
888	11	2019-09-21	528	3	17:42:00.076642	7	704	f	T	Mesa 7	30	0	0
891	11	2019-09-21	531	3	18:06:58.72903	9	250	f	T	Mesa 9	30	0	0
890	12	2019-09-21	530	3	18:12:11.284789	11	185	f	E	Mesa 11	30	0	0
892	11	2019-09-21	532	3	18:36:19.475546	11	20	f	E	Mesa 11	30	0	0
893	11	2019-09-21	533	3	19:07:11.605847	2	65	f	E	Mesa 2	30	0	0
896	11	2019-09-21	536	3	19:08:05.13119	2	18	f	E	Mesa 2	30	0	0
897	11	2019-09-21	537	3	19:12:08.326162	9	70	f	E	Mesa 9	30	0	0
894	12	2019-09-21	534	3	19:26:29.422208	8	100	f	E	Mesa 8	30	0	0
898	12	2019-09-21	538	3	20:39:29.401468	4	193	f	E	Mesa 4	30	0	0
901	12	2019-09-21	541	3	20:52:24.020136	11	35	f	E	Mesa 11	30	0	0
904	12	2019-09-21	544	3	21:23:59.22276	1	330	f	E	Mesa 1	30	0	0
903	11	2019-09-21	543	3	21:32:52.812804	11	375	f	E	Mesa 11	30	0	0
895	11	2019-09-21	535	3	21:33:11.714208	6	498	f	E	Mesa 6	30	0	0
908	11	2019-09-21	548	3	23:23:23.179913	11	35	f	E	Mesa 11	30	0	0
909	10	2019-09-22	549	3	14:14:44.908533	11	540	f	E	Mesa 11	31	0	0
907	11	2019-09-21	547	3	14:16:31.295084	5	0	t	\N	Mesa 5	31	\N	\N
911	10	2019-09-22	551	3	14:20:28.627018	8	410	f	T	Mesa 8	31	0	0
912	10	2019-09-22	552	3	14:24:25.506913	2	1030	f	E	Mesa 2	31	0	0
913	10	2019-09-22	553	3	15:59:26.022987	6	459	f	E	Mesa 6	31	0	0
914	10	2019-09-22	554	3	16:00:10.15612	10	60	f	E	Mesa 10	31	0	0
910	10	2019-09-22	550	3	16:06:51.113184	11	720	f	E	Mesa 11	31	0	0
915	10	2019-09-22	555	3	16:08:13.760408	11	900	f	E	Mesa 11	31	0	0
916	10	2019-09-22	556	3	17:07:01.375344	11	48	f	E	Mesa 11	31	0	0
917	10	2019-09-22	557	3	21:18:40.177194	8	120	f	T	Mesa 8	31	0	0
918	10	2019-09-22	558	3	22:51:38.912238	10	128	f	E	Mesa 10	31	0	0
920	10	2019-09-22	560	3	22:53:56.621513	5	181	f	E	Mesa 5	31	0	0
919	10	2019-09-22	559	3	23:05:22.262366	8	385	f	E	Mesa 8	31	0	0
923	9	2019-09-23	563	3	10:30:42.004058	11	175	f	E	Mesa 11	32	0	0
921	9	2019-09-23	561	3	10:30:51.689712	9	110	f	E	Mesa 9	32	0	0
922	9	2019-09-23	562	3	11:30:33.74214	3	188	f	E	Mesa 3	32	0	0
924	9	2019-09-23	564	3	12:36:46.547944	9	32	f	E	Mesa 9	32	0	0
925	9	2019-09-23	565	3	12:38:56.926976	11	120	f	E	Mesa 11	32	0	0
926	9	2019-09-23	566	3	14:32:11.041978	11	273	f	E	Mesa 11	32	0	0
927	12	2019-09-23	567	3	16:28:28.808101	11	700	f	E	Mesa 11	33	0	0
929	11	2019-09-23	569	3	18:26:22.258123	10	55	f	E	Mesa 10	33	0	0
931	11	2019-09-23	571	3	19:01:37.247004	10	80	f	E	Mesa 10	33	0	0
930	12	2019-09-23	570	3	19:46:43.595816	5	215	f	T	Mesa 5	33	0	0
933	12	2019-09-23	573	3	20:27:31.052559	7	164	f	E	Mesa 7	33	0	0
934	11	2019-09-23	574	3	20:46:20.972604	10	65	f	E	Mesa 10	33	0	0
935	12	2019-09-23	575	3	20:48:41.084821	8	55	f	E	Mesa 8	33	0	0
936	12	2019-09-23	576	3	22:53:47.648414	3	171	f	E	Mesa 3	33	0	0
932	11	2019-09-23	572	3	22:54:02.481515	9	125	f	E	Mesa 9	33	0	0
928	11	2019-09-23	568	3	23:08:02.926066	11	446	f	E	Mesa 11	33	0	0
937	9	2019-09-24	577	3	09:46:09.981352	2	136	f	E	Mesa 2	34	0	0
938	9	2019-09-24	578	3	10:39:55.765882	9	225	f	E	Mesa 9	34	0	0
939	9	2019-09-24	579	3	11:09:19.561197	6	338	f	T	Mesa 6	34	0	0
940	9	2019-09-24	580	3	11:41:44.014856	11	80	f	E	Mesa 11	34	0	0
941	9	2019-09-24	581	3	14:52:03.785848	11	392	f	E	Mesa 11	34	0	0
942	11	2019-09-24	582	3	15:05:39.677176	6	130	f	E	Mesa 6	34	0	0
943	12	2019-09-24	583	3	15:56:11.617577	9	359	f	E	Mesa 9	35	0	0
947	12	2019-09-24	587	3	18:25:53.4747	11	280	f	E	Mesa 11	35	0	0
945	11	2019-09-24	585	3	18:46:52.844443	9	176	f	E	Mesa 9	35	0	0
946	12	2019-09-24	586	3	18:47:23.474769	6	108	f	T	Mesa 6	35	0	0
948	11	2019-09-24	588	3	18:48:02.820685	11	28	f	E	Mesa 11	35	0	0
949	11	2019-09-24	589	3	20:48:36.730364	6	225	f	E	Mesa 6	35	0	0
952	11	2019-09-24	592	3	21:06:22.387182	11	60	f	E	Mesa 11	35	0	0
951	11	2019-09-24	591	3	21:14:40.866548	3	163	f	E	Mesa 3	35	0	0
953	12	2019-09-24	593	3	21:15:51.87303	11	125	f	E	Mesa 11	35	0	0
950	12	2019-09-24	590	3	21:21:00.539954	2	125	f	E	Mesa 2	35	0	0
954	12	2019-09-24	594	3	21:44:41.479076	6	83	f	E	Mesa 6	35	0	0
944	11	2019-09-24	584	3	15:36:43.700327	11	60	f	E	Mesa 11	35	0	0
956	11	2019-09-24	596	3	23:06:17.582107	10	173	f	E	Mesa 10	35	0	0
955	11	2019-09-24	595	3	23:06:38.220808	9	160	f	E	Mesa 9	35	0	0
960	9	2019-09-25	600	3	10:17:01.475387	11	28	f	T	Mesa 11	36	0	0
958	9	2019-09-25	598	3	10:34:32.942028	9	263	f	E	Mesa 9	36	0	0
962	9	2019-09-25	602	3	12:38:29.185086	10	320	f	E	Mesa 10	36	0	0
963	9	2019-09-25	603	3	13:52:25.206274	6	474	f	E	Mesa 6	36	0	0
961	9	2019-09-25	601	3	14:03:54.22562	11	560	f	O	Mesa 11	36	0	0
964	9	2019-09-25	604	3	14:46:05.207696	11	150	f	C	Mesa 11	36	0	0
965	9	2019-09-25	605	3	14:47:59.357991	11	146	f	E	Mesa 11	36	0	0
957	9	2019-09-25	597	3	09:57:25.64387	3	188	f	E	Mesa 3	36	0	0
959	9	2019-09-25	599	3	10:04:44.492335	8	245	f	E	Mesa 8	36	0	0
966	9	2019-09-25	606	3	14:49:24.7257	11	18	f	T	Mesa 11	36	0	0
968	11	2019-09-25	608	3	17:42:26.709712	11	80	f	E	Mesa 11	37	0	0
971	11	2019-09-25	611	3	17:53:26.646937	11	360	f	T	Mesa 11	37	0	0
972	12	2019-09-25	612	3	19:03:02.231503	8	163	f	E	Mesa 8	37	0	0
969	11	2019-09-25	609	3	19:17:16.120576	9	100	f	E	Mesa 9	37	0	0
973	12	2019-09-25	613	3	19:37:39.464159	4	125	f	E	Mesa 4	37	0	0
967	11	2019-09-25	607	3	15:41:31.432371	11	65	f	E	Mesa 11	37	0	0
977	12	2019-09-25	617	3	21:17:12.773713	4	120	f	E	Mesa 4	37	0	0
975	11	2019-09-25	615	3	21:50:49.339713	6	155	f	T	Mesa 6	37	0	0
978	11	2019-09-25	618	3	21:51:04.166341	5	690	f	E	Mesa 5	37	0	0
974	11	2019-09-25	614	3	21:51:14.219604	7	326	f	E	Mesa 7	37	0	0
981	12	2019-09-25	621	3	22:31:23.108942	4	235	f	E	Mesa 4	37	0	0
979	12	2019-09-25	619	3	23:18:53.507834	3	414	f	E	Mesa 3	37	0	0
970	11	2019-09-25	610	3	23:56:35.13353	10	104	f	E	Mesa 10	37	0	0
976	11	2019-09-25	616	3	23:56:42.833545	8	358	f	E	Mesa 8	37	0	0
980	11	2019-09-25	620	3	23:56:59.670213	2	1014	f	T	Mesa 2	37	0	0
982	11	2019-09-25	622	3	23:57:08.10449	7	231	f	T	Mesa 7	37	0	0
983	11	2019-09-25	623	3	00:12:23.964638	11	185	f	E	Mesa 11	37	0	0
1005	11	2019-09-26	645	3	23:03:20.260195	9	370	f	E	Mesa 9	39	0	0
996	11	2019-09-26	636	3	17:02:33.306374	6	208	f	E	Mesa 6	39	0	0
995	12	2019-09-26	635	3	17:02:46.456111	9	330	f	E	Mesa 9	39	0	0
997	12	2019-09-26	637	3	19:19:43.740947	6	260	f	T	Mesa 6	39	0	0
992	11	2019-09-26	632	3	19:20:56.113038	7	160	f	E	Mesa 7	39	0	0
998	12	2019-09-26	638	3	19:46:27.289787	4	136	f	T	Mesa 4	39	0	0
1000	11	2019-09-26	640	3	19:46:34.237163	3	221	f	E	Mesa 3	39	0	0
1003	12	2019-09-26	643	3	19:47:41.348668	11	110	f	E	Mesa 11	39	0	0
984	9	2019-09-26	624	3	09:11:45.181581	9	108	f	E	Mesa 9	38	0	0
985	9	2019-09-26	625	3	10:38:56.205968	3	323	f	E	Mesa 3	38	0	0
986	9	2019-09-26	626	3	11:11:00.615453	6	284	f	E	Mesa 6	38	0	0
987	9	2019-09-26	627	3	11:28:07.184354	9	170	f	E	Mesa 9	38	0	0
988	9	2019-09-26	628	3	12:55:32.889578	6	319	f	E	Mesa 6	38	0	0
989	9	2019-09-26	629	3	12:57:24.586464	11	120	f	E	Mesa 11	38	0	0
990	9	2019-09-26	630	3	14:04:04.065738	9	53	f	E	Mesa 9	38	0	0
991	9	2019-09-26	631	3	14:18:26.309439	10	195	f	O	Mesa 10	38	0	0
993	9	2019-09-26	633	3	14:52:25.357325	11	330	f	E	Mesa 11	38	0	0
994	9	2019-09-26	634	3	15:01:36.336124	11	18	f	E	Mesa 11	38	0	0
1016	9	2019-09-27	656	3	14:52:04.149073	9	70	f	E	Mesa 9	40	0	0
1012	9	2019-09-27	652	3	09:23:41.170902	11	648	f	E	Mesa 11	40	2	10
1011	9	2019-09-27	651	3	09:54:02.590907	9	225	f	T	Mesa 9	40	0	0
1010	9	2019-09-27	650	3	10:22:55.518154	2	268	f	O	Mesa 2	40	0	0
1014	9	2019-09-27	654	3	11:43:06.495737	11	160	f	E	Mesa 11	40	0	0
1013	9	2019-09-27	653	3	11:56:51.027419	2	338	f	E	Mesa 2	40	0	0
1015	9	2019-09-27	655	3	14:29:17.782464	11	275	f	E	Mesa 11	40	0	0
1017	9	2019-09-27	657	3	14:29:32.199227	3	245	f	E	Mesa 3	40	0	0
1018	9	2019-09-27	658	3	14:36:33.202051	11	650	f	E	Mesa 11	40	0	0
999	12	2019-09-26	639	3	20:17:30.171132	9	158	f	E	Mesa 9	39	0	0
1006	12	2019-09-26	646	3	21:19:53.345237	2	763	f	E	Mesa 2	39	0	0
1004	12	2019-09-26	644	3	21:33:10.810933	3	121	f	E	Mesa 3	39	0	0
1002	11	2019-09-26	642	3	22:50:37.65187	5	210	f	E	Mesa 5	39	0	0
1001	11	2019-09-26	641	3	22:50:51.315681	6	138	f	E	Mesa 6	39	0	0
1008	11	2019-09-26	648	3	22:51:03.743922	10	101	f	E	Mesa 10	39	0	0
1007	12	2019-09-26	647	3	22:51:16.705041	4	255	f	E	Mesa 4	39	0	0
1009	11	2019-09-26	649	3	23:03:11.055783	11	304	f	E	Mesa 11	39	0	0
1033	9	2019-09-28	672	3	14:30:56.240893	11	692	f	E	Mesa 11	42	0	0
1034	9	2019-09-28	673	3	14:34:06.59497	11	138	f	T	Mesa 11	42	0	0
1037	9	2019-09-28	676	3	16:38:33.451249	11	250	f	E	Mesa 11	42	0	0
1038	9	2019-09-28	677	3	16:40:56.170623	11	425	f	T	Mesa 11	42	0	0
1022	9	2019-09-27	661	3	16:29:49.403234	11	148	f	E	Mesa 11	41	0	0
1020	9	2019-09-27	659	3	16:27:46.242963	1	180	f	T	Mesa 1	41	0	0
1023	9	2019-09-27	662	3	16:29:17.013495	6	25	f	E	Mesa 6	41	0	0
1021	11	2019-09-27	660	3	18:01:39.844596	9	460	f	E	Mesa 9	41	0	0
1026	12	2019-09-27	665	3	19:23:04.214849	9	178	f	E	Mesa 9	41	0	0
1028	12	2019-09-27	667	3	19:23:12.76472	3	78	f	E	Mesa 3	41	0	0
1024	11	2019-09-27	663	3	19:44:09.64455	6	685	f	E	Mesa 6	41	0	0
1025	11	2019-09-27	664	3	19:44:21.795199	5	83	f	E	Mesa 5	41	0	0
1030	12	2019-09-27	669	3	21:28:16.386183	6	500	f	E	Mesa 6	41	0	0
1027	12	2019-09-27	666	3	21:28:30.492647	8	483	f	E	Mesa 8	41	0	0
1029	11	2019-09-27	668	3	23:46:40.548895	5	2634	f	E	Mesa 5	41	0	0
1031	12	2019-09-27	670	3	00:01:04.961641	3	439	f	E	Mesa 3	41	0	0
1032	11	2019-09-27	671	3	00:01:17.41582	11	125	f	E	Mesa 11	41	0	0
1040	14	2019-09-28	679	3	17:10:43.390143	10	140	f	E	Mesa 10	43	0	0
1036	14	2019-09-28	675	3	17:12:15.712145	3	228	f	E	Mesa 3	43	0	0
1035	14	2019-09-28	674	3	17:12:30.8306	9	105	f	E	Mesa 9	43	0	0
1041	14	2019-09-28	680	3	17:28:10.288347	10	95	f	E	Mesa 10	43	0	0
1039	14	2019-09-28	678	3	17:28:40.912399	11	290	f	E	Mesa 11	43	0	0
1043	14	2019-09-28	682	3	19:25:40.273463	11	60	f	E	Mesa 11	43	0	0
1044	14	2019-09-28	683	3	19:29:25.330402	4	190	f	E	Mesa 4	43	0	0
1042	14	2019-09-28	681	3	19:30:00.456923	5	38	f	E	Mesa 5	43	0	0
1045	14	2019-09-28	684	3	19:37:20.253411	2	53	f	E	Mesa 2	43	0	0
1047	14	2019-09-28	686	3	20:42:26.688053	11	160	f	E	Mesa 11	43	0	0
1048	14	2019-09-28	687	3	21:59:17.95774	7	335	f	E	Mesa 7	43	0	0
1049	14	2019-09-28	688	3	22:17:08.739602	8	345	f	T	Mesa 8	43	0	0
1050	14	2019-09-28	689	3	22:41:02.060778	3	400	f	T	Mesa 3	43	0	0
1052	14	2019-09-28	691	3	22:41:29.449474	11	53	f	T	Mesa 11	43	0	0
1054	14	2019-09-28	693	3	22:47:23.120742	11	60	f	E	Mesa 11	43	0	0
1046	14	2019-09-28	685	3	23:07:35.67451	10	166	f	E	Mesa 10	43	0	0
1051	14	2019-09-28	690	3	23:42:10.746653	2	265	f	E	Mesa 2	43	0	0
1053	14	2019-09-28	692	3	23:42:30.639061	5	298	f	E	Mesa 5	43	0	0
1055	14	2019-09-28	694	3	23:42:41.594108	3	113	f	E	Mesa 3	43	0	0
1056	9	2019-09-29	695	3	13:53:40.981581	11	360	f	E	Mesa 11	44	0	0
1057	9	2019-09-29	696	3	15:50:08.182267	3	296	f	E	Mesa 3	44	0	0
1059	9	2019-09-29	698	3	15:50:16.252745	2	185	f	E	Mesa 2	44	0	0
1058	9	2019-09-29	697	3	16:19:47.265088	9	1185	f	E	Mesa 9	44	0	0
1060	9	2019-09-29	699	3	17:12:35.026665	11	130	f	E	Mesa 11	44	0	0
1069	9	2019-09-30	708	3	10:20:42.935597	4	110	f	E	Mesa 4	46	0	0
1068	9	2019-09-30	707	3	10:49:36.632857	2	462	f	E	Mesa 2	46	0	0
1070	9	2019-09-30	709	3	12:39:28.299282	8	130	f	T	Mesa 8	46	0	0
1062	14	2019-09-29	701	3	17:42:17.887466	11	305	f	E	Mesa 11	45	0	0
1064	14	2019-09-29	703	3	19:25:54.938727	1	175	f	E	Mesa 1	45	0	0
1061	14	2019-09-29	700	3	19:29:18.835863	9	198	f	E	Mesa 9	45	0	0
1063	14	2019-09-29	702	3	19:30:43.233857	11	425	f	E	Mesa 11	45	0	0
1066	14	2019-09-29	705	3	21:50:49.858351	4	251	f	E	Mesa 4	45	0	0
1065	14	2019-09-29	704	3	21:51:05.99756	6	389	f	E	Mesa 6	45	0	0
1071	9	2019-09-30	710	3	13:20:00.73021	1	223	f	E	Mesa 1	46	0	0
1072	9	2019-09-30	711	3	14:21:51.689684	6	92	f	E	Mesa 6	46	0	0
1073	9	2019-09-30	712	3	14:36:00.147332	11	216	f	E	Mesa 11	46	0	0
1074	9	2019-09-30	713	3	14:53:18.634683	11	1062	f	E	Mesa 11	46	0	0
1075	9	2019-09-30	714	3	15:05:32.850996	11	60	f	T	Mesa 11	46	0	0
1067	9	2019-09-30	706	3	08:56:46.223219	11	133	f	E	Mesa 11	46	0	0
1081	12	2019-09-30	720	3	20:45:53.09375	4	28	f	E	Mesa 4	47	0	0
1084	11	2019-09-30	723	3	21:12:26.944594	9	147	f	E	Mesa 9	47	0	0
1085	12	2019-09-30	724	3	22:33:08.264011	4	211	f	E	Mesa 4	47	0	0
1087	11	2019-09-30	726	3	23:13:36.523338	6	141	f	E	Mesa 6	47	0	0
1082	12	2019-09-30	721	3	23:13:45.355653	8	230	f	E	Mesa 8	47	0	0
1076	11	2019-09-30	715	3	16:58:09.707067	4	56	f	E	Mesa 4	47	0	0
1077	11	2019-09-30	716	3	17:03:10.726873	9	320	f	E	Mesa 9	47	0	0
1078	11	2019-09-30	717	3	17:10:16.455961	11	25	f	E	Mesa 11	47	0	0
1079	12	2019-09-30	718	3	18:21:53.778204	4	101	f	E	Mesa 4	47	0	0
1080	11	2019-09-30	719	3	20:45:19.928334	6	734	f	T	Mesa 6	47	0	0
1083	12	2019-09-30	722	3	20:45:34.870786	3	295	f	E	Mesa 3	47	0	0
1086	12	2019-09-30	725	3	23:13:54.874839	5	301	f	E	Mesa 5	47	0	0
1088	11	2019-09-30	727	3	23:14:04.95397	2	190	f	E	Mesa 2	47	0	0
1089	11	2019-09-30	728	3	23:14:19.007288	4	163	f	E	Mesa 4	47	0	0
1090	11	2019-09-30	729	3	23:15:50.745558	11	954	f	E	Mesa 11	47	0	0
1113	9	2019-10-02	752	3	10:15:23.512954	4	110	f	E	Mesa 4	\N	0	0
1115	9	2019-10-02	754	3	11:05:17.738995	11	80	f	E	Mesa 11	\N	0	0
1114	9	2019-10-02	753	3	11:10:16.291595	4	46	f	E	Mesa 4	\N	0	0
1117	9	2019-10-02	756	3	11:41:34.439229	2	93	f	E	Mesa 2	\N	0	0
1091	9	2019-10-01	730	3	11:14:46.893329	6	330	f	T	Mesa 6	48	0	0
1093	9	2019-10-01	732	3	11:29:25.337976	11	270	f	E	Mesa 11	48	0	0
1092	9	2019-10-01	731	3	12:28:13.645828	9	86	f	E	Mesa 9	48	0	0
1095	9	2019-10-01	734	3	13:40:43.070264	6	310	f	T	Mesa 6	48	0	0
1094	9	2019-10-01	733	3	13:46:07.8825	11	297	f	E	Mesa 11	48	2	10
1096	9	2019-10-01	735	3	14:31:09.191928	11	120	f	T	Mesa 11	48	0	0
1097	9	2019-10-01	736	3	14:36:58.796061	11	138	f	E	Mesa 11	48	0	0
1116	9	2019-10-02	755	3	12:06:12.583459	4	120	f	E	Mesa 4	\N	0	0
1119	9	2019-10-02	758	3	13:57:05.507972	11	70	f	E	Mesa 11	\N	0	0
1118	9	2019-10-02	757	3	14:05:13.147902	8	148	f	E	Mesa 8	\N	0	0
1100	11	2019-10-01	739	3	16:06:11.6923	11	38	f	E	Mesa 11	49	0	0
1101	12	2019-10-01	740	3	17:01:41.095832	11	46	f	T	Mesa 11	49	0	0
1099	12	2019-10-01	738	3	17:23:03.329905	8	361	f	E	Mesa 8	49	0	0
1102	11	2019-10-01	741	3	17:46:21.494363	6	90	f	E	Mesa 6	49	0	0
1098	11	2019-10-01	737	3	17:46:28.668929	3	544	f	E	Mesa 3	49	0	0
1107	11	2019-10-01	746	3	20:40:10.826212	10	35	f	T	Mesa 10	49	0	0
1104	12	2019-10-01	743	3	21:36:58.717966	4	56	f	E	Mesa 4	49	0	0
1105	11	2019-10-01	744	3	21:37:25.098833	6	132	f	E	Mesa 6	49	0	0
1108	12	2019-10-01	747	3	21:59:17.80555	3	188	f	E	Mesa 3	49	0	0
1103	11	2019-10-01	742	3	23:06:42.976379	11	269	f	E	Mesa 11	49	0	0
1111	11	2019-10-01	750	3	23:06:54.410954	6	344	f	T	Mesa 6	49	0	0
1109	12	2019-10-01	748	3	23:07:03.595115	7	414	f	E	Mesa 7	49	0	0
1110	11	2019-10-01	749	3	23:07:15.899531	8	128	f	T	Mesa 8	49	0	0
1106	11	2019-10-01	745	3	23:07:27.47506	9	122	f	E	Mesa 9	49	0	0
1112	9	2019-10-02	751	3	10:07:26.690254	2	205	f	E	Mesa 2	\N	0	0
\.


--
-- Data for Name: insumos; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.insumos (id_inventario, cantidad, id_producto, id) FROM stdin;
10	1	760	61
11	1	761	62
19	1	762	63
12	1	763	64
13	1	764	65
14	1	765	66
15	1	766	67
16	1	767	68
17	1	768	69
18	1	769	70
17	1	735	71
17	1	736	72
19	1	726	74
17	1	730	78
17	1	733	80
17	1	734	81
17	1	737	82
18	1	738	83
20	1	482	86
21	1	483	87
22	1	484	88
23	1	485	89
24	1	486	90
25	1	487	91
26	1	488	92
27	1	489	93
28	1	490	94
29	1	491	95
30	1	492	96
31	1	493	97
32	1	494	98
19	1	732	99
17	1	732	100
34	1	717	101
35	1	718	102
40	1	770	103
39	1	771	104
36	1	772	105
37	1	773	106
38	1	775	107
41	1	774	108
33	1	480	110
42	1	613	111
42	1	615	112
42	1	612	113
42	2	618	114
42	2	619	115
44	1	616	116
46	1	617	117
42	2	621	118
44	2	622	119
46	2	623	120
45	1	624	121
42	2	625	122
42	1	680	137
14	1	626	152
42	1	626	153
13	1	627	154
42	1	627	155
12	1	628	156
42	1	628	157
19	1	629	158
42	1	629	159
11	1	631	164
42	1	631	165
14	1	632	166
42	1	632	167
13	1	633	168
42	1	633	169
12	1	634	170
42	1	634	171
19	1	635	172
42	1	635	173
16	1	636	174
42	1	636	175
11	1	637	176
42	1	637	177
11	1	643	178
16	1	642	179
14	1	638	180
13	1	639	181
12	1	640	182
19	1	641	183
14	1	644	184
49	1	644	185
13	1	645	186
49	1	645	187
12	1	646	188
49	1	646	189
19	1	647	190
49	1	647	191
11	1	649	195
49	1	649	196
14	1	650	197
12	1	652	199
13	1	651	200
19	1	653	201
16	1	654	202
11	1	655	203
14	1	656	204
45	1	656	205
13	1	657	206
45	1	657	207
12	1	658	208
45	1	658	209
19	1	659	210
45	1	659	211
11	1	661	214
45	1	661	215
10	1	662	216
43	1	665	218
48	1	666	221
43	1	668	222
48	1	668	223
43	1	671	227
43	1	673	228
46	1	674	229
43	1	677	231
48	1	682	233
15	1	781	234
42	1	781	235
15	1	783	236
15	1	782	237
42	1	782	238
15	1	784	239
49	1	784	240
15	1	785	241
15	1	786	242
45	1	786	243
17	1	759	244
18	1	723	245
44	1	725	246
17	1	729	247
44	1	731	248
16	1	630	253
42	2	630	254
48	2	630	255
16	1	648	256
49	2	648	257
16	1	660	258
45	2	660	259
48	1	667	260
18	1	740	261
47	1	744	262
47	1	750	263
17	1	795	265
17	1	796	266
17	1	797	267
17	1	799	268
17	1	800	269
17	1	801	270
17	1	804	271
17	1	805	272
17	1	806	273
17	1	807	274
17	1	808	275
17	1	809	276
43	1	788	277
42	1	789	278
45	1	790	279
48	1	791	280
49	1	792	281
20	1	812	283
20	1	810	284
\.


--
-- Data for Name: inventario; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.inventario (cantidad, unidad_medida, descripcion, proveedor, marca, ubicacion, id_sucursal, id_inventario, categoria, minimo) FROM stdin;
5000	pz	Arrachera	Cocina	Cocina	COCINA	3	47	CARNES	5
5000	pz	TARTA DE PERA	Cocinq	Cocina	COCINA	3	30	CEREALES	5
5000	pz	MIRINDA 	Pepsi	Pepsi	COCINA	3	36	REFRESCOS	5
4999	pz	TARTA DE CHOCO PRALINE	Cocina	Cocina	COCINA	3	33	CEREALES	5
4984	pz	MANZANA 	Pepsi 	Pepsi 	COCINA	3	38	REFRESCOS	5
4983	pz	Panini Tomate 	Cocina	Pan	COCINA	3	12	CEREALES	5
4957	pz	COCA COLA LIGHT 	Coca 	Coca	COCINA	3	39	REFRESCOS	5
4942	pz	COCA COLA 	Coca	Coca	COCINA	3	40	REFRESCOS	5
4965	pz	Focacia Romero 	Cocina	Pan	COCINA	3	15	CEREALES	5
4919	pz	Ciabatta	Cocina 	Pan 	COCINA	3	19	CEREALES	5
4980	pz	Focacia Aceitunas 	Cocina	Pqn	COCINA	3	14	CEREALES	5
4964	pz	CHESSECAKE	Cocina	Cocina	COCINA	3	20	CEREALES	5
4988	pz	MOUSSE TEQUILA	Cocina 	Cocina a	COCINA	3	24	CEREALES	5
4741	pz	Pan Chico	Cocina	Pan	COCINA	3	17	CEREALES	5
4974	pz	Queso Cabra Hierbas Finas	Cocina	Cocinq	COCINA	3	49	LACTEOS	5
4992	pz	CASERA	Pepsi	Pepsi 	COCINA	3	37	REFRESCOS	5
4904	pz	Pan Grande 	Cocina 	Pan	COCINA	3	18	CEREALES	5
4966	pz	MOSTACHON CHICO	Cocina 	Cocina 	COCINA	3	23	CEREALES	5
4980	pz	CREMOSO FRUTOS ROJOS	Cocina 	Cocina 	COCINA	3	22	CEREALES	5
4944	pz	Panini Tocino	Cocina 	Pan	COCINA	3	13	CEREALES	5
4975	pz	Camarones 	Cocina 	Cocina 	COCINA	3	43	MARISCOS	5
4961	pz	Baguette 	Cocina 	Pan	COCINA	3	16	CEREALES	5
4841	pz	Jamon Serrano	Proteína 	Cocina	COCINA	3	42	CARNES	5
4967	pz	TARTA DE CAFÉ 	Cocina 	Cocina 	COCINA	3	21	CEREALES	5
4999	pz	PASTEL FRUTOS ROJOS	Cocina 	Cocina 	COCINA	3	27	CEREALES	5
4986	pz	PASTEL CAFÉ 	Cocina 	Cocina 	COCINA	3	25	CEREALES	5
4984	pz	Frutti Di Mare 	Cocina	Cocina	COCINA	3	46	MARISCOS	5
4964	pz	Queso Cabra Ceniza 	Cocina	Cocina	COCINA	3	48	LACTEOS	5
4981	pz	H2O	Cocina	Cocina	COCINA	3	34	REFRESCOS	5
4980	pz	PASTEL 3 LECHES	Cocina	Cocina	COCINA	3	28	CEREALES	5
4984	pz	PASTEL SELVA NEGRA 	Cocina	Cocina	COCINA	3	29	CEREALES	5
4996	pz	7UP	Pepsi	Pepsi	COCINA	3	41	REFRESCOS	5
4980	pz	Salmón 	Cocina	Cocina	COCINA	3	45	MARISCOS	5
4975	pz	Camarones Pizza	Cocina 	Cocina	COCINA	3	44	MARISCOS	5
4975	pz	H2O MINERAL 	Cocina	Cocina	COCINA	3	35	REFRESCOS	5
4986	pz	PASTEL CHOCOLATE 	Cocina 	Cocina 	COCINA	3	26	CEREALES	5
4989	pz	Pan Hogaza	Cocina	Pan	COCINA	3	10	CEREALES	5
4940	pz	TARTA DE QUESO 	Cocina	Cocina	COCINA	3	31	CEREALES	5
4995	pz	TIRAMISU	Cocina	Cocina	COCINA	3	32	CEREALES	5
4945	pz	Pan Ajo	Cocina	Pan	COCINA	3	11	CEREALES	5
\.


--
-- Data for Name: key; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.key (password, id_sucursal, serial) FROM stdin;
12345	\N	1
\.


--
-- Data for Name: mesas; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.mesas (id_mesa, id_tipo, id_sucursal, ocupada, mesafusionada) FROM stdin;
10	1	3	f	\N
3	1	3	f	\N
6	1	3	f	\N
7	1	3	f	\N
9	1	3	f	\N
5	1	3	f	\N
2	1	3	f	\N
4	1	3	f	\N
11	1	3	f	\N
8	1	3	f	\N
1	1	3	f	\N
\.


--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.productos (id_producto, nombre, descripcion, precio, id_categoria, id_video, nombre_video, notificacion, ruta_imagen, subcategoria) FROM stdin;
624	BRUSQUETAS DE SALMON	BRUSQUETAS DE SALOM	90	124	\N		1	\N	166
625	JAMON SERRANO & FRUTOS ROJOS	JAMON SERRANO & FRUTOS ROJOS	200	124	\N		1	\N	166
627	PANINI NAPOLITANA PAN TOCINO	PANINI NAPOLITANA PAN DE TOCINO	70	124	\N		1	\N	167
628	PANINI NAPOLITANA PAN DE TOMATE	NAPOLITANA PAN DE TOMATE	70	124	\N		1	\N	167
629	PANINI NAPOLITANA CIABATTA	PANINI NAPOLITANA CIABATTA	60	124	\N		1	\N	167
630	PANINI NAPOLITANA BAGUETTE RUSTICO	PANINI NAPOLITANA BAGGUETE RUSTICO	80	124	\N		1	\N	167
631	PANINI NAPOLITANA PAN DE AJO	PANINI NAPOLITANA PAN DE AJO	78	124	\N		1	\N	167
634	PANINI ITALIANA PAN DE TOMATE	PANINI ITALIANA PAN DE TOMATE	70	124	\N		1	\N	168
635	PANINI ITALIANA CIABATTA	PANINI ITALIANA CIABATTA	60	124	\N		1	\N	168
636	PANINI ITALIANA BAGUETTE RUSTICO	RUSTICO	80	124	\N		1	\N	168
637	PANINI ITALIANA PAN DE AJO	PAN DE AJO	78	124	\N		1	\N	168
639	PANINI ARABESCA PAN TOCINO	TOCINO	70	124	\N		1	\N	169
640	PANINI ARABESCA PAN DE TOMATE	TOMATE	70	124	\N		1	\N	169
641	PANINI ARABESCA CIABATTA	CIABATTA	60	124	\N		1	\N	169
642	PANINI ARABESCA BAGUETTE RUSTICO	BAGUETTE RUSTICO	80	124	\N		1	\N	169
643	PANINI ARABESCA PAN DE AJO	PAN DE AJO	78	124	\N		1	\N	169
645	PANINI ESPAÑOLA PAN DE TOCINO	PANINI ESPAÑOLA PAN DE TOCINO	70	124	\N		1	\N	170
646	PANINI ESPAÑOLA PAN DE TOMATE	PANINI ESPAÑOLA PAN DE TOMATE	70	124	\N		1	\N	170
647	PANINI ESPAÑOLA CIABATTA	PANINI ESPAÑOLA CIABATTA	60	124	\N		1	\N	170
649	PANINI ESPAÑOLA PAN DE AJO	PANINI ESPAÑOLA PAN DE AJO	78	124	\N		1	\N	170
651	PANINI LOMO DE LA CASA PAN TOCINO	PANINI PAN TOCINO	70	124	\N		1	\N	171
652	PANINI LOMO DE LA CASA PAN DE TOMATE	PANINI PAN DE TOMATE	70	124	\N		1	\N	171
653	PANINI LOMO DE LA CASA CIABATTA	PANINI CIABATTA	60	124	\N		1	\N	171
654	PANINI LOMO DE LA CASA BAGUETTE RUSTICO	PANINI BAGUETTE RUSTICO	80	124	\N		1	\N	171
475	PASTEL FRUTOS ROJOS ENTERO	PASTEL FRUTOS ROJOS	360	114	\N		1	\N	138
655	PANINI LOMO DE LA CASA PAN DE AJO	PAN DE AJO	78	124	\N		1	\N	171
657	PANINI SALMON AHUMADO PAN DE TOCINO	PANINI SALMON AHUMADO PAN DE TOCINO	70	124	\N		1	\N	172
658	PANINI SALMON AHUMADO PAN DE TOMATE	PANINI SALMON AHUMADO PAN DE TOMATE	70	124	\N		1	\N	172
659	PANINI SALMON AHUMADO CIABATTA	PANINI SALMON AHUMADO CIABATTA	60	124	\N		1	\N	172
660	PANINI SALMON AHUMADO BAGUETTE RUSTICO	PANINI SALMON AHUMADO BAGUETTE RUSTICO	80	124	\N		1	\N	172
661	PANINI SALMON AHUMADO PAN DE AJO	PANINI SALMON AHUMADO PAN DE AJO	78	124	\N		1	\N	172
663	PASTA CARBONERA	PASTA CARBONERA	80	124	\N		1	\N	180
665	PASTA CARBONERA CAMARONES SALTEADOS	CAMARONES SALTEADOS	140	124	\N		1	\N	180
666	PASTA PESTO	PASTA PESTO	80	124	\N		1	\N	181
667	PASTA PESTO CON POLLO	PASTA PESTO CON POLLO	115	124	\N		1	\N	181
668	PASTA PESTO CAMARONES SALTEADOS	PASTA PESTO CAMARONES SALTEADOS	140	124	\N		1	\N	181
669	PASTA ARRABIATA	PASTA ARRABIATA	80	124	\N		1	\N	182
670	PASTA ARRABIATA CON POLLO	PASTA ARRABIATA CON POLLO	115	124	\N		1	\N	182
671	PASTA ARRABIATA CAMARONES SALTEADOS	PASTA ARRABIATA CAMARONES SALTEADOS	140	124	\N		1	\N	182
632	PANINI ITALIANA FOCACIA ACEITUNAS 	PANINI ITALIANA FOCACCIA	55	124	\N		1	\N	168
638	PANINI ARABESCA FOCACIA ACEITUNAS 	FOCACCIA	55	124	\N		1	\N	169
644	PANINI ESPAÑOLA FOCACIA ACEITUNAS 	PANINI ESPAÑOLA FOCACCIA	55	124	\N		1	\N	170
656	PANINI SALMON AHUMADO FOCACIA ACEITUNAS 	PANINI SALMON AHUMADO FOCACCIA	55	124	\N		1	\N	172
469	CREMOSO DE FRUTOS ROJOS ENTERO	CREMOSO DE FRUTOS ROJOS	360	114	\N		1	\N	138
471	MOSTACHON CHICO ENTERO	MOSTACHON CHICO 	250	114	\N		1	\N	138
470	MOSTACHON GRANDE ENTERO 	MOSTACHON GRANDE	400	114	\N		1	\N	138
472	MOUSSE DE TEQUILA ENTERO 	MOUSSE DE TEQUILA	300	114	\N		1	\N	138
473	PASTEL DE CAFÉ ENTERO 	PASTEL DE CAFE 	360	114	\N		1	\N	138
476	PASTEL TRES LECHES ENTERO 	PASTEL TRES LECHES	330	114	\N		1	\N	138
477	PASTEL SELVA NEGRA ENTERO 	PASTEL SELVA NEGRA	380	114	\N		1	\N	138
478	TARTA DE PERA ENTERO 	TARTA DE PERA	360	114	\N		1	\N	138
479	TARTA DE QUESO ENTERO 	TARTA DE QUESO	360	114	\N		1	\N	138
480	TARTALETAS ENTERO	TARTALETAS	60	114	\N		1	\N	138
481	TIRAMISU ENTERO	TIRAMISU	360	114	\N		1	\N	138
482	CHESECAKE REBANADA	CHESSSECAKE	60	114	\N		1	\N	139
483	TARTA DE CAFÉ REBANADA 	TARTA DE CAFE	65	114	\N		1	\N	139
485	MOSTACHON CHICO REBANADA 	MOSTACHON CHICO	65	114	\N		1	\N	139
486	MOUSSE TEQUILA REBANADA 	MOUSSE TEQUILA	50	114	\N		1	\N	139
487	PASTEL DE CAFE REBANADA 	PASTEL DE CAFE 	60	114	\N		1	\N	139
489	PASTEL FRUTOS ROJOS REBANADA 	PASTEL DE FRUTOS ROJOS	60	114	\N		1	\N	139
490	PASTEL TRES LECHES REBANADA 	PASTEL TRES LECHES	55	114	\N		1	\N	139
491	PASTEL SELVA NEGRA REBANADA 	PASTEL SELVA NEGRA	65	114	\N		1	\N	139
492	TARTA DE PERA REBANADA 	TARTA DE PERA	65	114	\N		1	\N	139
493	TARTA DE QUESO REBANADA 	TARTA DE QUESO	60	114	\N		1	\N	139
494	TIRAMISU REBANADA 	TIRAMISU	60	114	\N		1	\N	139
633	PANINI ITALIANA PAN TOCINO	PANINI ITALIANA PAN TOCINO	70	124	\N		1	\N	168
648	PANINI ESPAÑOLA BAGUETTE RUSTICO	PANINI ESPAÑOLA BAGUETTE RUSTICO	80	124	\N		1	\N	170
662	SAN ANTON	SAN ANTON	95	124	\N		1	\N	173
664	PASTA CARBONERA CON POLLO	CON POLLO	115	124	\N		1	\N	180
736	CAPUCHINO CH + PAN DE LA CASA CH	CAPUCHINO CH	32	125	\N		2	\N	195
735	CAFE AMERICANO + PAN DE LA CASA CH	CAFE AMERICANO	25	125	\N		2	\N	195
737	PAN CHICO	PAN CHICO	12	125	\N		1	\N	196
738	PAN GRANDE	PAN GRANDE	25	125	\N		1	\N	196
729	PAN FRANCES CON BERRIES Y CREMA BATIDA - PAQ. 	PAN FRANCES CON BERRIES Y CREMA BATIDA	100	125	\N		3	\N	194
730	CHILAQUILES DE GUAJILLO CON POLLO AL GRILL- PAQ	CHILAQUILES DE GUAJILLO CON POLLO AL GRILL	110	125	\N		3	\N	194
731	OMELETTE DE CAMARONES CON QUESO PHIL.- PAQ	OMELETTE DE CAMARONES CON QUESO PHIL.	115	125	\N		3	\N	194
732	OMELETTE ARABESCA- PAQ	OMELETTE ARABESCA	110	125	\N		3	\N	194
733	MOLLETES DE CHORIZO Y QUESO GOUDA- PAQ	MOLLETES DE CHORIZO Y QUESO GOUDA	110	125	\N		3	\N	194
734	TORTILLA ESPAÑOLA- PAQ	TORTILA ESPAÑOLA	115	125	\N		3	\N	194
626	PANINI NAPOLITANA FOCACIA ACEITUNAS 	PANINIA NAPOLITANA FOCACCIA	55	124	\N		1	\N	167
781	PANINI NAPOLITANA FOCACIA ROMERO	Pan	55	124	\N		1	\N	167
783	PANINI ARABESCA FOCACIA ROMERO	Pan	55	124	\N		1	\N	169
650	PANINI LOMO DE LA CASA FOCACIA ACEITUNAS 	PANINI FOCACCIA	55	124	\N		1	\N	171
786	PANINI SALMON AHUMADO FOCACIA ROMERO	Pan	55	124	\N		1	\N	172
811	BRUSQUETAS DE SALMON PIEZA	1 Pz. 	30	124	\N		1	\N	166
672	PASTA AMATRICCIANA	PASTA AMATRICCIANA	125	124	\N		1	\N	183
673	PASTA AL HORNO	PASTA AL HORNO	145	124	\N		1	\N	184
674	PASTA FRUTTI DI MARE	PASTA FRUTTI DI MARE	145	124	\N		1	\N	185
675	ENSALADA CESAR	ENSALADA CESAR	50	124	\N		1	\N	174
676	ENSALADA CESAR CON POLLO	ENSALADA CESAR CON POLLO	85	124	\N		1	\N	174
677	ENSALADA CESAR CAMARONES SALTEADOS	ENSALADA CESAR CAMARONES SALTEADOS	110	124	\N		1	\N	174
679	ENSALADA DE POLLO	ENSALADA DE POLLO	75	124	\N		1	\N	175
680	ENSALADA PERA Y JAMON SERRANO	ENSALADA PERA Y JAMON SERRANO	100	124	\N		1	\N	176
682	ENSALADA LIGERA	ENSALADA LIGERA	60	124	\N		1	\N	177
683	CAFE AMERICANO CH	CAFE AMERICANO	18	124	\N		2	\N	186
739	YOGURT CON BERRIES Y STREUSSEL DE AVENA	YOGURT CON BERRIES Y STREUSSEL DE AVENA	80	126	\N		1	\N	198
741	MOLLETES CON CHORIZO	MOLLETES CON CHORIZO ACOMPAÑADOS DE RAJAS DE CHILES DE AGUA	80	126	\N		1	\N	199
742	SALSA DE CHORIZO CON FRIJOLES REFRITOS	SALSA DE CHORIZO CON FRIJOLES REFRITOS	100	126	\N		1	\N	199
743	HUEVOS EN CAZUELA CON FRIJOLES REFRITOS	HUEVOS	80	126	\N		1	\N	199
744	CHILAQUILES DE FRIJOS CON LONGANIZAS DE TEOPISCA CHIAPAS(120G)	CHILAQUILES DE FRIJOS CON LONGANIZAS DE TEOPISCA CHIAPAS(120G	130	126	\N		1	\N	199
746	CHILAQUILES DE GUAJILLO CON ARRACHERA(120G)	CHILAQUILES DE GUAJILLO CON ARRACHERA(120G)	140	126	\N		1	\N	199
747	MOLLETES CON CHORIZO CON RAJAS DE CHILES AGUA	MOLLETES CON CHORIZO CON RAJAS DE CHILES AGUA	120	126	\N		1	\N	200
749	HUEVOS EN CAZUELA CON FRIJOLES REFR.	HUEVOS EN CAZUELA CON FRIJOLES REFR.	120	126	\N		1	\N	200
750	CHILAQUILES DE FRIJOL CON LONGANIZAS DE TEOPISCA CHIAPAS(120G)	CHILAQUILES DE FRIJOL CON LONGANIZAS DE TEOPISCA CHIAPAS(120G	170	126	\N		1	\N	200
751	CHILAQUILES DE GUAJILLO CON 2 HUEVOS	CHILAQUILES DE GUAJILLO CON 2 HUEVOS	120	126	\N		1	\N	200
752	CHILAQUILES DE GUAJILLO CON ARRACHERA (120G)	CHILAQUILES DE GUAJILLO CON ARRACHERA (120G)	140	126	\N		1	\N	200
760	PAN HOGAZA	Pan	35	127	\N		2	\N	\N
762	CIABATA	Pan 	10	127	\N		2	\N	\N
764	TOCINO	Pan 	35	127	\N		2	\N	\N
763	TOMATE	Pan	35	127	\N		2	\N	\N
765	FOCACIA ACEITUNA	Pan	35	127	\N		2	\N	\N
767	BAGUETTE 	Pan 	15	127	\N		2	\N	\N
768	PAN CHICO 	Pan	15	127	\N		2	\N	\N
769	PAN GRANDE 	Pan	25	127	\N		2	\N	\N
782	PANINI ITALIANA FOCACIA ROMERO	Pan	55	124	\N		1	\N	168
784	PANINI ESPAÑOLA FOCACIA ROMERO 	Pan	55	124	\N		1	\N	170
785	PANINI LOMO DE LA CASA FOCACIA ROMERO 	Pan 	55	124	\N		1	\N	171
812	PASTEL DEL DÍA + CAPUCHINO 	Promo	72	130	\N		3	\N	208
815	NARANJA/MANGO	Jugos	35	125	\N		2	\N	195
816	NARANJA/FRUTOS ROJOS 	Jugos	35	125	\N		2	\N	195
817	NARANJA/MANGO	Jugos	35	126	\N		2	\N	201
818	NARANJA/FRUTOS ROJOS	Jugos	35	126	\N		2	\N	201
484	CREMOSO FRUTOS ROJOS REBANADA 	CREMOSO FRUTOS ROJOS	65	114	\N		1	\N	139
684	CADE EXPRESSO CH	CAFE EXPRESSO	18	124	\N		2	\N	186
740	PAN FRANCES CON BERRIES	PAN FRANCES CON BERRIES	80	126	\N		1	\N	198
745	CHILAQUILES GUAJILLO CON 2 HUEVOS	CHILAQUILES CON HUEVO	100	126	\N		1	\N	199
748	SALSA DE CHORIZO CON FRIJOLES REFR.	SALSA DE CHORIZO CON FRIJOLES REFR.	140	126	\N		1	\N	200
753	CAFE DE LA CASA	CAFE	18	126	\N		2	\N	201
754	SELECCION DE TE	SELECCION DE TE	35	126	\N		2	\N	201
761	PAN AJO	Pan	35	127	\N		2	\N	\N
474	PASTEL CHOCOLATE C/FRESAS ENTERO	PASTEL DE CHOCOLATE C/FRESAS 	360	114	\N		1	\N	138
813	CERVEZA ALEMANA 	Pieza	50	131	\N		2	\N	\N
814	COPA DE VINO	Copa	50	124	\N		2	\N	192
685	CORTADO CH	CORTADO	28	124	\N		2	\N	186
686	LATTE CH	LATTE	28	124	\N		2	\N	186
687	CAPUCHINO CH	CAPUCHINO	25	124	\N		2	\N	186
755	AGUA DEL DIA	AGUA DEL DIA	35	126	\N		2	\N	201
770	COCA COLA	Refrescos 	25	124	\N		2	\N	192
771	COCA COLA LIGHT 	Refrescos 	25	124	\N		2	\N	192
766	FOCACIA ROMERO	Pan	20	127	\N		2	\N	\N
772	MIRINDA	Refrescos 	25	124	\N		2	\N	192
773	CASERA	Refrescos 	25	124	\N		2	\N	192
774	7UP	Refrescos 	25	124	\N		2	\N	192
775	MANZANA 	Refrescos 	25	124	\N		2	\N	192
787	POLLO 	Proteína 	35	131	\N		1	\N	\N
788	CAMARONES 	Proteína 	60	131	\N		1	\N	\N
789	JAMÓN SERRANO	Proteína 	35	131	\N		1	\N	\N
790	SALMON 	Proteína 	35	131	\N		1	\N	\N
791	QUESO CABRA CENIZA 	Proteína 	35	131	\N		1	\N	\N
792	QUESO CABRA HIERBAS 	Proteína 	35	131	\N		1	\N	\N
793	LECHE 	Leche	5	131	\N		2	\N	\N
794	JARABE 	Jarabe 	5	131	\N		2	\N	\N
693	CARGA EXTRA DE CAFE O JARABE	JARABE O CAFE	5	124	\N		2	\N	186
688	CAPUCHINO CARAMEL CH	CAPUCHINO CARAMEL	32	124	\N		2	\N	186
689	CAPUCHINO MOKA CH	CAPUCHINO MOKA	32	124	\N		2	\N	186
690	CAPUCHINO BAILEYS CH	CAPUCHINO BAILEYS	55	124	\N		2	\N	186
691	CAPUCHINO AMARETTO CH	CAPUCHINO AMARETTO	55	124	\N		2	\N	186
692	CAFE DEL MES CH	CAFE DEL MES	55	124	\N		2	\N	186
694	CAFE AMERICANO GRANDE	CAFE AMERICANO GRANDE	28	124	\N		2	\N	187
695	LATTE GRANDE	LATTE GRANDE	38	124	\N		2	\N	187
696	CAPUCHINO GRANDE	CAPUCHINO GRANDE	35	124	\N		2	\N	187
698	CAPUCHINO MOKA GRANDE	CAPUCHINO MOKA GRANDE	38	124	\N		2	\N	187
697	CAPUCHINO CARAMEL GRANDE	CAPUCHINO CARAMEL	38	124	\N		2	\N	187
699	CAPUCHINO BAILEYS GRANDE	CAPUCHINO BAILEYS GRANDE	65	124	\N		2	\N	187
700	CAPUCHINO AMARETTO	CAPUCHINO AMARETTO	65	124	\N		2	\N	187
701	CAFE DEL MES	CAFE DEL MES	65	124	\N		2	\N	187
702	EXTRA CAFE O JARABE	EXTRA	5	124	\N		2	\N	187
703	FRAPPE CH	FRAPPE CH	35	124	\N		2	\N	188
708	FRAPPE DE TEMPORADA CH	FRAPPE DE TEMPORADA CH	45	124	\N		2	\N	188
704	FRAPPE MOKA CH	FRAPPE MOKA	38	124	\N		2	\N	188
705	FRAPPE OREO CH	FRAPPE OREO	38	124	\N		2	\N	188
706	FRAPPE CARAMEL CH	FRAPPE CARAMEL	38	124	\N		2	\N	188
707	FRAPPE CHAI CH	FRAPPE CHAI	45	124	\N		2	\N	188
709	FRAPPE GRANDE	FRAPPE GRANDE	45	124	\N		2	\N	189
710	FRAPPE MOKA GRANDE	FRAPPE MOKA	48	124	\N		2	\N	189
711	FRAPPE OREO  GRANDE	FRAPPE OREO	48	124	\N		2	\N	189
712	FRAPPE CARAMEL GRANDE	FRAPPE CARAMEL	48	124	\N		2	\N	189
756	FRIJOLES CON TOTOPOS	FRIJOLES	40	126	\N		1	\N	202
758	RAJAS DE CHILE DE AGUA	RAJAS DE CHILE DE AGUA	40	126	\N		1	\N	202
759	PAN DE LA CASA	PAN DE LA CASA	15	126	\N		1	\N	202
776	SODA RAÍZ 	Vaso	28	124	\N		2	\N	192
779	SODA JAMAICA 	Vaso	28	124	\N		2	\N	192
795	CAFÉ AME. CH + PAN	Promo	25	130	\N		2	\N	204
797	CAFÉ AME. GD + PAN	Promo	35	130	\N		2	\N	204
800	CAPUCHINO MD + PAN	Promo	37	130	\N		2	\N	205
799	CAPUCHINO CH + PAN	Promo	32	130	\N		2	\N	205
796	CAFÉ AME. MD + PAN	Promo	32	130	\N		2	\N	204
713	FRAPPE CHAI GRANDE	FRAPPE CHAI	55	124	\N		2	\N	189
714	FRAPPE DE TEMPORADA GRANDE	FRAPPE DE TEMPORADA	55	124	\N		2	\N	189
715	TE CH	TE CH	35	124	\N		2	\N	190
716	TE GRANDE	TE GRANDE	60	124	\N		2	\N	191
717	AGUA EMBOTELLADA	AGUA EMBOTELLADA	20	124	\N		2	\N	192
718	AGUA MINERAL	AGUA MINERAL	25	124	\N		2	\N	192
720	VASO DE CLERICOT	VASO DE CLERICOT	65	124	\N		2	\N	192
721	JARRA DE CLERICOT	JARRA DE CLERICOT	250	124	\N		2	\N	192
722	CARAJILLO	CARAJILLO	65	124	\N		2	\N	192
723	PAN FRANC. CON BERRIES Y CREMA BATIDA	PAN FRANCES CON BERRIES Y CREMA BATIDA	80	125	\N		1	\N	193
724	CHILAQUILES DE GUAJILLO CON POLLO AL GRILL	CHILAQUILES DE GUAJILLO CON POLLO AL GRILL	90	125	\N		1	\N	193
725	OMELETTE DE CAMARONES CON QUESO PHILA.	OMELETTE DE CAMARONES CON QUESO PHILA.	95	125	\N		1	\N	193
726	OMELETTE ARABESCA	OMELETTE ARABESCA	90	125	\N		1	\N	193
727	MOLLETES DE CHORIZO Y QUESO GOUDA	MOLLETES DE CHORIZO Y QUESO GOUDA	90	125	\N		1	\N	193
728	TORTILLA ESPAÑOLA	TORTILLA ESPAÑOLA	95	125	\N		1	\N	193
780	SODA MARACUYA	Vaso	35	124	\N		2	\N	192
777	SODA TE LIMÓN 	Vaso	28	124	\N		2	\N	192
778	SODA CHABACANO 	Vaso	28	124	\N		2	\N	192
801	CAPUCHINO GD + PAN	Promo	42	130	\N		2	\N	205
802	PIZZA CH ABIERTA	Pizza	120	124	\N		1	\N	178
613	PIZZA JAMON SERRANO CH	PIZZA JAMON SERRANO CH	120	124	\N		1	\N	178
612	PIZZA PROSCIUTTO CH	PIZZA PROSCIUTTO CH	120	124	\N		1	\N	178
614	PIZZA CHORIZO PAMPLONA CH	PIZZA CHORIZO PAMPLONA	120	124	\N		1	\N	178
615	PIZZA PERA CON JAMON CH	PIZZA PERA CON JAMON CH	120	124	\N		1	\N	178
616	PIZZA ALL ARRABIATA CH	PIZZA ALL ARRABIATA CH	145	124	\N		1	\N	178
617	PIZZA FRUTTI CH	PIZZA FRUTTI CH 	145	124	\N		1	\N	178
618	PIZZA PROSCIUTTO GR	PIZZA PROSCIUTTO GR	210	124	\N		1	\N	179
619	PIZZA JAMON SERRANO GR	PIZZAR JAMON SERRANO GR	210	124	\N		1	\N	179
620	PIZZA CHORIZO PAMPLONA GR	PIZZA CHORIZO PMAPLONA GR	210	124	\N		1	\N	179
621	PIZZA PERA CON JAMON GR	PIZZA PERA CON JAMON GR	210	124	\N		1	\N	179
622	PIZZA ALL ARRABATIA	PIZZA AL ARRABATIA	230	124	\N		1	\N	179
623	PIZZA FRUTTI GR	PIZZA FRUTI GR 	230	124	\N		1	\N	179
803	PIZZA GD ABIERTA 	Pizza	210	124	\N		1	\N	179
804	CHOCOLATE CH + PAN	Promo	42	130	\N		2	\N	206
805	CHOCOLATE MD + PAN	Promo	47	130	\N		2	\N	206
806	CHOCOLATE GD + PAN	Promo	52	130	\N		2	\N	206
807	TE CHAI CH + PAN	Promo	42	130	\N		2	\N	207
808	TE CHAI MD + PAN	Promo	47	130	\N		2	\N	207
809	TE CHAI GD + PAN	Promo	52	130	\N		2	\N	207
810	PASTEL DEL DÍA + CAFÉ 	Promo	65	130	\N		3	\N	208
819	Jarra de soda	Bebida	90	124	\N		2	\N	192
820	Jarra de soda de maracuya 	Bebida	120	124	\N		2	\N	192
821	Chai ch calinte	Te	35	124	\N		0	\N	186
822	Chai caliente grande 	Te	45	124	\N		2	\N	187
823	Volovan	Snak	15	132	\N		1	\N	\N
824	Bebida y postre	Pro!o	60	132	\N		3	\N	\N
825	Pastel de Zanahoria	Pastel	350	114	\N		1	\N	138
826	Pastel de Zanahoria	Pastel	60	114	\N		1	\N	139
827	Chocolate	Bebida	35	124	\N		2	\N	186
467	CHESECAKE ENTERO 	CHESECAKE	360	114	\N		1	\N	138
468	TARTA DE CAFÉ ENTERO	TARTA DE CAFE	390	114	\N		1	\N	138
828	Minerva 	Bebida	120	131	\N		0	\N	\N
830	Cerveza Alemana grande	Bebida	120	131	\N		2	\N	\N
831	CAFÉ AMERICANO MD	Taza 	23	124	\N		2	\N	209
832	CAPUCHINO MD	Taza	30	124	\N		2	\N	209
833	CHOCOLATE MD	Taza 	40	124	\N		2	\N	209
834	TE CHAI MD	Taza 	40	124	\N		2	\N	209
836	ATE CON QUESO CAMEMBERT	App	200	134	\N		1	\N	\N
837	PIZZA DE PIMIENTOS	Pizza	250	134	\N		1	\N	\N
838	PIZZA DE ARRACHERA	Pizza	250	134	\N		1	\N	\N
839	LIMONADA	Bebidas	55	124	\N		2	\N	192
840	Streussel 1/2	Para llevsr	60	131	\N		0	\N	\N
841	NARANJADA/LIMONADA	Bebidas	55	124	\N		2	\N	192
842	TARTA SANTIAGO	Pastel	65	114	\N		1	\N	139
843	FOCACCIA DE QUESO AZUL	Pan	50	127	\N		1	\N	\N
844	CAJA DE PAN DULCE 5PZ	Pan	65	127	\N		2	\N	\N
845	Zona 1	Cargo Extra	20	131	\N		2	\N	\N
846	Zona 2	Cargo extra 	30	131	\N		2	\N	\N
847	Tartaleta mini	Canapés	20	132	\N		1	\N	\N
848	S. Peregrino	Agua	65	124	\N		2	\N	192
849	YOGURT CON BERRIES 1/2	Desayuno	45	125	\N		0	\N	193
850	YOGURT CON BERRIES 	Desayuno	80	125	\N		1	\N	193
851	Pastel chico	Pastel	200	114	\N		0	\N	138
852	Pax Pastel	Eventos	45	132	\N		0	\N	\N
853	Bombolini	Pan	25	127	\N		1	\N	\N
488	PASTEL DE CHOCOLATE REBANADA 	PASTEL DE CHOCOLATE 	65	114	\N		1	\N	139
854	Mini baggette	Extra	10	131	\N		1	\N	\N
855	SALSS DE CHORIZO	Desayuno	95	125	\N		1	\N	193
856	SALSA DE CHORIZO 	Desayuno	120	125	\N		1	\N	194
857	CROQUE MADAME	Desayuno	140	125	\N		1	\N	193
858	CROQUE MADAME	Desayuno	165	125	\N		1	\N	194
859	HUEVOS EN CAZUELA	Desayuno	95	125	\N		1	\N	193
860	HUEVOS EN CAZUELA	Desayuno	120	125	\N		1	\N	194
861	CHILAQUILES CON GUAJILLO CON ARRACHERA	Desayuno	160	125	\N		1	\N	194
862	CHILAQUILES CON GUAJILLO CON ARRACHERA	Desayuno	140	125	\N		1	\N	193
863	Bollo 120	Eventos	5.5	132	\N		1	\N	\N
757	GUACAMOLE CON TOTOPOS	GUACAMOLE CON TOTOPOS	75	126	\N		1	\N	202
864	Carga de licor 	Extra	35	131	\N		2	\N	\N
\.


--
-- Data for Name: promociones; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.promociones (id, nombre, descripcion, inicia, termina, precio, dias, productos, productoscodificado) FROM stdin;
22	CAFÉ AME + PAN	Bebida chica + pan x $25	08:00	08:01	35	do	[{"nombre":"PASTELES","descripcion":"POSTRES","submenu":true,"id":114,"submenu_array":[{"nombre":"ENTERO","id":138,"id_categoria":114,"id_subcategoria":1,"submenu":false},{"nombre":"REBANADO","id":139,"id_categoria":114,"id_subcategoria":2,"submenu":false}]},{"nombre":"GENERAL","descripcion":"GENERAL","submenu":true,"id":124,"submenu_array":[{"nombre":"APPS","id":166,"id_categoria":124,"id_subcategoria":1,"submenu":false},{"nombre":"PANINI","id":159,"id_categoria":124,"id_subcategoria":2,"submenu":true,"submenu_array":[{"nombre":"NAPOLITANA","id":167,"id_categoria":124,"id_subcategoria":2,"submenu":false},{"nombre":"ITALIANA","id":168,"id_categoria":124,"id_subcategoria":2,"submenu":false},{"nombre":"ARABESCA","id":169,"id_categoria":124,"id_subcategoria":2,"submenu":false},{"nombre":"ESPAÑOLA","id":170,"id_categoria":124,"id_subcategoria":2,"submenu":false},{"nombre":"LOMO DE LA CASA","id":171,"id_categoria":124,"id_subcategoria":2,"submenu":false},{"nombre":"SALMON AHUMADO","id":172,"id_categoria":124,"id_subcategoria":2,"submenu":false},{"nombre":"SAN ANTON","id":173,"id_categoria":124,"id_subcategoria":2,"submenu":false}]},{"nombre":"ENSALADAS","id":160,"id_categoria":124,"id_subcategoria":3,"submenu":true,"submenu_array":[{"nombre":"CESAR","id":174,"id_categoria":124,"id_subcategoria":3,"submenu":false},{"nombre":"DE POLLO","id":175,"id_categoria":124,"id_subcategoria":3,"submenu":false},{"nombre":"PERA Y JAMON SERRANO","id":176,"id_categoria":124,"id_subcategoria":3,"submenu":false},{"nombre":"LIGERA","id":177,"id_categoria":124,"id_subcategoria":3,"submenu":false}]},{"nombre":"PIZZAS","id":161,"id_categoria":124,"id_subcategoria":4,"submenu":true,"submenu_array":[{"nombre":"CHICO","id":178,"id_categoria":124,"id_subcategoria":4,"submenu":false},{"nombre":"GRANDE","id":179,"id_categoria":124,"id_subcategoria":4,"submenu":false}]},{"nombre":"PASTAS","id":162,"id_categoria":124,"id_subcategoria":5,"submenu":true,"submenu_array":[{"nombre":"CARBONERA","id":180,"id_categoria":124,"id_subcategoria":5,"submenu":false},{"nombre":"PESTO","id":181,"id_categoria":124,"id_subcategoria":5,"submenu":false},{"nombre":"ARRABIATA","id":182,"id_categoria":124,"id_subcategoria":5,"submenu":false},{"nombre":"AMATRICCIANA","id":183,"id_categoria":124,"id_subcategoria":5,"submenu":false},{"nombre":"AL HORNO","id":184,"id_categoria":124,"id_subcategoria":5,"submenu":false},{"nombre":"FRUTTI DI MARE","id":185,"id_categoria":124,"id_subcategoria":5,"submenu":false}]},{"nombre":"BEBIDAS CALIENTES","id":163,"id_categoria":124,"id_subcategoria":6,"submenu":true,"submenu_array":[{"nombre":"CHICO","id":186,"id_categoria":124,"id_subcategoria":6,"submenu":false},{"nombre":"GRANDE","id":187,"id_categoria":124,"id_subcategoria":6,"submenu":false},{"nombre":"MEDIANO","id":209,"id_categoria":124,"id_subcategoria":6,"submenu":false}]},{"nombre":"FRAPPES","id":164,"id_categoria":124,"id_subcategoria":7,"submenu":true,"submenu_array":[{"nombre":"CHICO","id":188,"id_categoria":124,"id_subcategoria":7,"submenu":false},{"nombre":"GRANDE","id":189,"id_categoria":124,"id_subcategoria":7,"submenu":false}]},{"nombre":"TES","id":165,"id_categoria":124,"id_subcategoria":8,"submenu":true,"submenu_array":[{"nombre":"CHICO","id":190,"id_categoria":124,"id_subcategoria":8,"submenu":false},{"nombre":"GRANDE","id":191,"id_categoria":124,"id_subcategoria":8,"submenu":false}]},{"nombre":"OTRAS BEBIDAS","id":192,"id_categoria":124,"id_subcategoria":9,"submenu":false}]},{"nombre":"DESAYUNOS","descripcion":"DESAYUNOS","submenu":true,"id":125,"submenu_array":[{"nombre":"CARTA","id":193,"id_categoria":125,"id_subcategoria":1,"submenu":false},{"nombre":"PAQUETE","id":194,"id_categoria":125,"id_subcategoria":2,"submenu":false},{"nombre":"BEBIDAS","id":195,"id_categoria":125,"id_subcategoria":3,"submenu":false},{"nombre":"PAN","id":196,"id_categoria":125,"id_subcategoria":4,"submenu":false}]},{"nombre":"DESAYUNOS DOMINICALES","descripcion":"DESAYUNOS DOMINICALES","submenu":true,"id":126,"submenu_array":[{"nombre":"ENTRADA","id":198,"id_categoria":126,"id_subcategoria":1,"submenu":false},{"nombre":"PLATO FUERTE","id":197,"id_categoria":126,"id_subcategoria":2,"submenu":true,"submenu_array":[{"nombre":"CARTA","id":199,"id_categoria":126,"id_subcategoria":2,"submenu":false},{"nombre":"PAQUETE","id":200,"id_categoria":126,"id_subcategoria":2,"submenu":false}]},{"nombre":"BEBIDAS","id":201,"id_categoria":126,"id_subcategoria":3,"submenu":false},{"nombre":"EXTRAS","id":202,"id_categoria":126,"id_subcategoria":4,"submenu":false}],"productos":[{"id_producto":753,"nombre":"CAFE DE LA CASA","descripcion":"CAFE","precio":18,"id_categoria":126,"id_video":null,"nombre_video":"","notificacion":2,"ruta_imagen":"","subcategoria":"201","cantidad":1,"seleccionado":true}]},{"nombre":"PANADERÍA ","descripcion":"Pan recién horneado ","submenu":false,"id":127,"productos":[{"id_producto":768,"nombre":"PAN CHICO ","descripcion":"Pan","precio":15,"id_categoria":127,"id_video":null,"nombre_video":"","notificacion":2,"ruta_imagen":"","subcategoria":null,"cantidad":1,"seleccionado":true}]},{"nombre":"PROMOCIONES ","descripcion":"Promos del mes","submenu":true,"id":130,"submenu_array":[{"nombre":"CAFÉ AMERICANO ","id":204,"id_categoria":130,"id_subcategoria":1,"submenu":false},{"nombre":"CAPUCHINO","id":205,"id_categoria":130,"id_subcategoria":2,"submenu":false},{"nombre":"CHOCOLATE","id":206,"id_categoria":130,"id_subcategoria":3,"submenu":false},{"nombre":"TE CHAI","id":207,"id_categoria":130,"id_subcategoria":4,"submenu":false},{"nombre":"PROMOCIÓN DEL DÍA ","id":208,"id_categoria":130,"id_subcategoria":5,"submenu":false}]},{"nombre":"EXTRAS","descripcion":"PROTEÍNAS ","submenu":false,"id":131}]	753:1-768:1
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.roles (rol, descripcion, id) FROM stdin;
Administrador	Administrador del sistema en general	1
Barman	El que atiende en barra	3
Cajera	Cajera lobster	7
Cocina	Cocina de lobster	6
Mesero	Mesero que atiende en la mesa	2
\.


--
-- Data for Name: subcategoria; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.subcategoria (nombre, submenu_enlazado, id, id_categoria, id_subcategoria) FROM stdin;
ENTERO	\N	138	114	1
REBANADO	\N	139	114	2
PANINI	\N	159	124	2
ENSALADAS	\N	160	124	3
PIZZAS	\N	161	124	4
PASTAS	\N	162	124	5
BEBIDAS CALIENTES	\N	163	124	6
FRAPPES	\N	164	124	7
TES	\N	165	124	8
APPS	\N	166	124	1
NAPOLITANA	159	167	124	2
ITALIANA	159	168	124	2
ARABESCA	159	169	124	2
ESPAÑOLA	159	170	124	2
LOMO DE LA CASA	159	171	124	2
SALMON AHUMADO	159	172	124	2
SAN ANTON	159	173	124	2
CESAR	160	174	124	3
DE POLLO	160	175	124	3
PERA Y JAMON SERRANO	160	176	124	3
LIGERA	160	177	124	3
CHICO	161	178	124	4
GRANDE	161	179	124	4
CARBONERA	162	180	124	5
PESTO	162	181	124	5
ARRABIATA	162	182	124	5
AMATRICCIANA	162	183	124	5
AL HORNO	162	184	124	5
FRUTTI DI MARE	162	185	124	5
CHICO	163	186	124	6
GRANDE	163	187	124	6
CHICO	164	188	124	7
GRANDE	164	189	124	7
CHICO	165	190	124	8
GRANDE	165	191	124	8
OTRAS BEBIDAS	\N	192	124	9
CARTA	\N	193	125	1
PAQUETE	\N	194	125	2
BEBIDAS	\N	195	125	3
PAN	\N	196	125	4
PLATO FUERTE	\N	197	126	2
ENTRADA	\N	198	126	1
CARTA	197	199	126	2
PAQUETE	197	200	126	2
BEBIDAS	\N	201	126	3
EXTRAS	\N	202	126	4
SUGERENCIAS	\N	203	128	1
CAFÉ AMERICANO 	\N	204	130	1
CAPUCHINO	\N	205	130	2
CHOCOLATE	\N	206	130	3
TE CHAI	\N	207	130	4
PROMOCIÓN DEL DÍA 	\N	208	130	5
MEDIANO	163	209	124	6
\.


--
-- Data for Name: sucursales; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.sucursales (direccion, nombre, id) FROM stdin;
COL REFORMA	COL REFORMA	3
\.


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.tickets (id_ticket, id_user, fecha, id_folio, id_sucursal, hora, id_mesa, nombre, cortesia, efectivo_porcentaje) FROM stdin;
\.


--
-- Data for Name: tipo_producto; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.tipo_producto (nombre, descripcion, id_tipoproducto) FROM stdin;
CIUDAD alterna	\N	4
oaxaca alterna	\N	5
veracruz	av obesa 1 norte	3
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: udgaybsavmmsdn
--

COPY public.users (login, nombre, id_rol, password, id_sucursal, menu, catalogos, bar, cocina, cuentas, transacciones, id, inicio, gestion_usuarios, sucursales, mesas, caja, productos, historial_cuentas, reportes, autorizar, inventario, configuraciones, iniciar_en) FROM stdin;
Admin	Mariscal	3	12345	3	t	t	t	t	t	t	1	t	t	t	t	t	t	t	t	t	t	t	1
Guillermo	Guillermo	1	Papolina	3	t	t	t	t	t	t	10	t	t	t	t	t	t	t	t	t	t	t	5
Fidel	Fidel Reyes	7	Sombras97	3	t	t	f	f	t	f	9	t	\N	\N	\N	t	\N	\N	\N	\N	\N	t	1
Flor	Flor solano	2	3656	3	t	t	f	f	t	f	11	t	\N	\N	\N	t	\N	\N	\N	\N	\N	t	1
Yess	Yessica Vianey	2	1602	3	t	t	f	f	t	f	12	t	\N	\N	\N	t	\N	\N	\N	\N	\N	t	1
Denisse	Denisse 	2	1010	3	t	t	f	f	t	f	14	t	\N	\N	\N	t	\N	\N	\N	\N	\N	t	1
\.


--
-- Name: carrito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: udgaybsavmmsdn
--

SELECT pg_catalog.setval('public.carrito_id_seq', 7, true);


--
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: udgaybsavmmsdn
--

SELECT pg_catalog.setval('public.categoria_id_seq', 134, true);


--
-- Name: categoria_insumos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: udgaybsavmmsdn
--

SELECT pg_catalog.setval('public.categoria_insumos_id_seq', 1, false);


--
-- Name: combos_id_combo_seq; Type: SEQUENCE SET; Schema: public; Owner: udgaybsavmmsdn
--

SELECT pg_catalog.setval('public.combos_id_combo_seq', 23, true);


--
-- Name: control_movimientos_id_control_seq; Type: SEQUENCE SET; Schema: public; Owner: udgaybsavmmsdn
--

SELECT pg_catalog.setval('public.control_movimientos_id_control_seq', 73, true);


--
-- Name: correos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: udgaybsavmmsdn
--

SELECT pg_catalog.setval('public.correos_id_seq', 1, false);


--
-- Name: corte_caja_id_seq; Type: SEQUENCE SET; Schema: public; Owner: udgaybsavmmsdn
--

SELECT pg_catalog.setval('public.corte_caja_id_seq', 50, true);


--
-- Name: detalle_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: udgaybsavmmsdn
--

SELECT pg_catalog.setval('public.detalle_ticket_id_seq', 3071, true);


--
-- Name: insumos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: udgaybsavmmsdn
--

SELECT pg_catalog.setval('public.insumos_id_seq', 284, true);


--
-- Name: inventario_id_inventario_seq; Type: SEQUENCE SET; Schema: public; Owner: udgaybsavmmsdn
--

SELECT pg_catalog.setval('public.inventario_id_inventario_seq', 50, true);


--
-- Name: key_serial_seq; Type: SEQUENCE SET; Schema: public; Owner: udgaybsavmmsdn
--

SELECT pg_catalog.setval('public.key_serial_seq', 1, true);


--
-- Name: productos_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: udgaybsavmmsdn
--

SELECT pg_catalog.setval('public.productos_id_producto_seq', 864, true);


--
-- Name: promociones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: udgaybsavmmsdn
--

SELECT pg_catalog.setval('public.promociones_id_seq', 22, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: udgaybsavmmsdn
--

SELECT pg_catalog.setval('public.roles_id_seq', 5, true);


--
-- Name: subcategoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: udgaybsavmmsdn
--

SELECT pg_catalog.setval('public.subcategoria_id_seq', 209, true);


--
-- Name: tickets_id_ticket_seq; Type: SEQUENCE SET; Schema: public; Owner: udgaybsavmmsdn
--

SELECT pg_catalog.setval('public.tickets_id_ticket_seq', 1119, true);


--
-- Name: tipo_producto_id_tipoproducto_seq; Type: SEQUENCE SET; Schema: public; Owner: udgaybsavmmsdn
--

SELECT pg_catalog.setval('public.tipo_producto_id_tipoproducto_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: udgaybsavmmsdn
--

SELECT pg_catalog.setval('public.users_id_seq', 14, true);


--
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- Name: historico_promocion_productos historico_promocion_productos_pkey; Type: CONSTRAINT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.historico_promocion_productos
    ADD CONSTRAINT historico_promocion_productos_pkey PRIMARY KEY (id_ticket, id_promocion, id_producto);


--
-- Name: historico_promocion_ticket historico_promocion_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.historico_promocion_ticket
    ADD CONSTRAINT historico_promocion_ticket_pkey PRIMARY KEY (id_ticket, id_promocion);


--
-- Name: mesas mesas_pkey; Type: CONSTRAINT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.mesas
    ADD CONSTRAINT mesas_pkey PRIMARY KEY (id_mesa, id_sucursal);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (rol);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: udgaybsavmmsdn
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (login);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: udgaybsavmmsdn
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO udgaybsavmmsdn;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO udgaybsavmmsdn;


--
-- PostgreSQL database dump complete
--

