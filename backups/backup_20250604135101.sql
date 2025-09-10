--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13 (Debian 15.13-1.pgdg120+1)
-- Dumped by pg_dump version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)

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
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    country character varying(255) NOT NULL,
    region character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    street character varying(255) NOT NULL,
    postal_code character varying(255) NOT NULL
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.address_id_seq OWNER TO postgres;

--
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.address_id_seq OWNED BY public.address.id;


--
-- Name: admin_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_user (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    role character varying(255) NOT NULL
);


ALTER TABLE public.admin_user OWNER TO postgres;

--
-- Name: admin_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_user_id_seq OWNER TO postgres;

--
-- Name: admin_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_user_id_seq OWNED BY public.admin_user.id;


--
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id integer NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- Name: cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cart_id_seq OWNER TO postgres;

--
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;


--
-- Name: cart_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_item (
    cart_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT cart_item_quantity_check CHECK ((quantity > 0))
);


ALTER TABLE public.cart_item OWNER TO postgres;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_id_seq OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(10)
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_id_seq OWNER TO postgres;

--
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;


--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO postgres;

--
-- Name: logistic_company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logistic_company (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    api_base_url character varying(255) NOT NULL
);


ALTER TABLE public.logistic_company OWNER TO postgres;

--
-- Name: logistic_company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logistic_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.logistic_company_id_seq OWNER TO postgres;

--
-- Name: logistic_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logistic_company_id_seq OWNED BY public.logistic_company.id;


--
-- Name: notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notification (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    type_id integer NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.notification OWNER TO postgres;

--
-- Name: notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notification_id_seq OWNER TO postgres;

--
-- Name: notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notification_id_seq OWNED BY public.notification.id;


--
-- Name: notification_subscription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notification_subscription (
    customer_id integer NOT NULL,
    type_id integer NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.notification_subscription OWNER TO postgres;

--
-- Name: notification_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notification_type (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    channel character varying(255) NOT NULL
);


ALTER TABLE public.notification_type OWNER TO postgres;

--
-- Name: notification_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notification_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notification_type_id_seq OWNER TO postgres;

--
-- Name: notification_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notification_type_id_seq OWNED BY public.notification_type.id;


--
-- Name: order_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_item (
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    unit_price numeric(10,2) NOT NULL,
    CONSTRAINT order_item_quantity_check CHECK ((quantity > 0))
);


ALTER TABLE public.order_item OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    address_id integer NOT NULL,
    shipment_method_id integer NOT NULL,
    payment_id integer,
    status character varying(255) NOT NULL,
    total_amount numeric(10,2) NOT NULL,
    currency character varying(3) NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    id integer NOT NULL,
    order_id integer NOT NULL,
    method_id integer NOT NULL,
    amount numeric(10,2) NOT NULL,
    currency character varying(3) NOT NULL,
    status character varying(50) NOT NULL
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_id_seq OWNER TO postgres;

--
-- Name: payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_id_seq OWNED BY public.payment.id;


--
-- Name: payment_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_method (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL
);


ALTER TABLE public.payment_method OWNER TO postgres;

--
-- Name: payment_method_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_method_id_seq OWNER TO postgres;

--
-- Name: payment_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_method_id_seq OWNED BY public.payment_method.id;


--
-- Name: platform; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.platform (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    api_base_url character varying(255) NOT NULL
);


ALTER TABLE public.platform OWNER TO postgres;

--
-- Name: platform_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.platform_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.platform_id_seq OWNER TO postgres;

--
-- Name: platform_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.platform_id_seq OWNED BY public.platform.id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    platform_id integer NOT NULL,
    category_id integer NOT NULL,
    name character varying(255) NOT NULL,
    price numeric(10,2) NOT NULL,
    currency character varying(3) NOT NULL,
    available boolean DEFAULT true NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_id_seq OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- Name: refund; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refund (
    id integer NOT NULL,
    order_id integer NOT NULL,
    reason text NOT NULL,
    status character varying(255) NOT NULL
);


ALTER TABLE public.refund OWNER TO postgres;

--
-- Name: refund_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refund_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.refund_id_seq OWNER TO postgres;

--
-- Name: refund_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refund_id_seq OWNED BY public.refund.id;


--
-- Name: return_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.return_item (
    return_id integer NOT NULL,
    order_item_order_id integer NOT NULL,
    order_item_product_id integer NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT return_item_quantity_check CHECK ((quantity > 0))
);


ALTER TABLE public.return_item OWNER TO postgres;

--
-- Name: review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    product_id integer NOT NULL,
    order_id integer NOT NULL,
    rating integer NOT NULL,
    comment character varying(255),
    CONSTRAINT review_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.review OWNER TO postgres;

--
-- Name: review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.review_id_seq OWNER TO postgres;

--
-- Name: review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.review_id_seq OWNED BY public.review.id;


--
-- Name: shipment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipment (
    id integer NOT NULL,
    order_id integer NOT NULL,
    shipment_method_id integer NOT NULL,
    shipped_at timestamp without time zone,
    estimated_delivery date
);


ALTER TABLE public.shipment OWNER TO postgres;

--
-- Name: shipment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shipment_id_seq OWNER TO postgres;

--
-- Name: shipment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipment_id_seq OWNED BY public.shipment.id;


--
-- Name: shipment_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipment_method (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    carrier_id integer NOT NULL,
    estimated_days integer NOT NULL
);


ALTER TABLE public.shipment_method OWNER TO postgres;

--
-- Name: shipment_method_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipment_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shipment_method_id_seq OWNER TO postgres;

--
-- Name: shipment_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipment_method_id_seq OWNED BY public.shipment_method.id;


--
-- Name: support_ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.support_ticket (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    order_id integer,
    subject character varying(255) NOT NULL,
    status character varying(255) NOT NULL
);


ALTER TABLE public.support_ticket OWNER TO postgres;

--
-- Name: support_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.support_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.support_ticket_id_seq OWNER TO postgres;

--
-- Name: support_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.support_ticket_id_seq OWNED BY public.support_ticket.id;


--
-- Name: ticket_message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticket_message (
    id integer NOT NULL,
    ticket_id integer NOT NULL,
    author_type character varying(255) NOT NULL,
    author_id integer NOT NULL,
    message character varying(255) NOT NULL
);


ALTER TABLE public.ticket_message OWNER TO postgres;

--
-- Name: ticket_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ticket_message_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ticket_message_id_seq OWNER TO postgres;

--
-- Name: ticket_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ticket_message_id_seq OWNED BY public.ticket_message.id;


--
-- Name: tracking_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracking_info (
    id integer NOT NULL,
    shipment_id integer NOT NULL,
    tracking_number character varying(255) NOT NULL
);


ALTER TABLE public.tracking_info OWNER TO postgres;

--
-- Name: tracking_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tracking_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tracking_info_id_seq OWNER TO postgres;

--
-- Name: tracking_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tracking_info_id_seq OWNED BY public.tracking_info.id;


--
-- Name: address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address ALTER COLUMN id SET DEFAULT nextval('public.address_id_seq'::regclass);


--
-- Name: admin_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_user ALTER COLUMN id SET DEFAULT nextval('public.admin_user_id_seq'::regclass);


--
-- Name: cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);


--
-- Name: logistic_company id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logistic_company ALTER COLUMN id SET DEFAULT nextval('public.logistic_company_id_seq'::regclass);


--
-- Name: notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification ALTER COLUMN id SET DEFAULT nextval('public.notification_id_seq'::regclass);


--
-- Name: notification_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_type ALTER COLUMN id SET DEFAULT nextval('public.notification_type_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN id SET DEFAULT nextval('public.payment_id_seq'::regclass);


--
-- Name: payment_method id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_method ALTER COLUMN id SET DEFAULT nextval('public.payment_method_id_seq'::regclass);


--
-- Name: platform id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.platform ALTER COLUMN id SET DEFAULT nextval('public.platform_id_seq'::regclass);


--
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- Name: refund id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refund ALTER COLUMN id SET DEFAULT nextval('public.refund_id_seq'::regclass);


--
-- Name: review id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review ALTER COLUMN id SET DEFAULT nextval('public.review_id_seq'::regclass);


--
-- Name: shipment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipment ALTER COLUMN id SET DEFAULT nextval('public.shipment_id_seq'::regclass);


--
-- Name: shipment_method id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipment_method ALTER COLUMN id SET DEFAULT nextval('public.shipment_method_id_seq'::regclass);


--
-- Name: support_ticket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_ticket ALTER COLUMN id SET DEFAULT nextval('public.support_ticket_id_seq'::regclass);


--
-- Name: ticket_message id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_message ALTER COLUMN id SET DEFAULT nextval('public.ticket_message_id_seq'::regclass);


--
-- Name: tracking_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracking_info ALTER COLUMN id SET DEFAULT nextval('public.tracking_info_id_seq'::regclass);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.address (id, customer_id, country, region, city, street, postal_code) FROM stdin;
1	1	Puerto Rico	Rhode Island	North Lake Kamilleburgh	287998 Lydia Green	22245
2	2	Falkland Islands (Malvinas)	Nebraska	East Lake Darrion	573583 Hyatt Forks	13041-7400
3	3	Macedonia, The Former Yugoslav Republic of	Nebraska	South Port Manuelborough	515137 Chadrick Forks	65801
4	4	Suriname	Arkansas	Julienmouth	525401 Abshire Stravenue	64210-5455
5	5	Christmas Island	Nebraska	Cleofurt	191386 Novella Hills	81085-3472
6	6	Latvia	Oklahoma	South Port Elysechester	20547 Wisozk Summit	20115-1722
7	7	Kazakhstan	Texas	Jerrellhaven	910577 Yost Loaf	38662-4622
8	8	India	New Mexico	West Port Carmella	619752 Mariah Key	81463
9	9	Bouvet Island	Minnesota	South New Maxiefort	312903 Bode Meadows	60562-1075
10	10	Indonesia	Illinois	South Port Alexachester	190700 Lafayette Shoal	37145
\.


--
-- Data for Name: admin_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_user (id, username, role) FROM stdin;
1	tiana_king	admin
2	lubowitz_korbin	manager
3	christiansen_aleen	support
4	jerde.vincenza	admin
5	jimmie.mosciski	manager
6	o'connell.carter	support
7	beahan-davion	admin
8	schaefer_zackery	manager
9	hershel.stracke	support
10	amparo_ferry	admin
\.


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, customer_id) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
10	10
\.


--
-- Data for Name: cart_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_item (cart_id, product_id, quantity) FROM stdin;
1	2	4
6	1	3
5	1	3
4	8	3
8	9	2
3	6	1
1	1	1
5	4	4
9	5	4
9	8	2
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name) FROM stdin;
1	venenatis
2	elementum
3	phasellus
4	velit
5	ultrices
6	erat
7	non
8	pulvinar
9	lacinia
10	cursus
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (id, first_name, last_name, email, phone) FROM stdin;
1	Hunter	Sipes	kris_dusty@schaden.biz	27981645
2	Arielle	Terry	ransom-hessel@sauer.info	65439674
3	Cora	Dickens	gaylord.lebsack@abbott.co.uk	60940821
4	Michele	Kerluke	hyman.dietrich@lind.co.uk	37228472
5	Edyth	Altenwerth	smitham_bridgette@langworth.name	29133356
6	Adah	Homenick	mcdermott.brady@veum.name	84853310
7	Abigale	Moen	lela.kirlin@wunsch.us	39697359
8	Glenna	Runte	connor_macejkovic@beier.biz	48082399
9	Prince	Lang	hilpert-carmelo@hudson.ca	12149611
10	Virginie	Schulist	astrid_dubuque@hessel.com	49434684
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1	create base entities	SQL	V1__create_base_entities.sql	-219098641	postgres	2025-06-04 12:21:13.43315	67	t
2	2	create dependent entities	SQL	V2__create_dependent_entities.sql	-1825759258	postgres	2025-06-04 12:21:13.556154	30	t
3	3	create supportive entities	SQL	V3__create_supportive_entities.sql	-1600151593	postgres	2025-06-04 12:21:13.611407	87	t
\.


--
-- Data for Name: logistic_company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logistic_company (id, name, api_base_url) FROM stdin;
1	Schulist, Stark and Dach	https://gaylord.name
2	Goyette-Torphy	https://zboncak.us
3	Adams Inc	https://deckow.co.uk
4	Kassulke, Mante and Hoppe	https://kuphal.ca
5	Schoen and Sons	https://weissnat.info
6	Cummings-Lesch	https://kris.co.uk
7	Mueller, Aufderhar and Halvorson	https://robel.info
8	Gusikowski and Sons	https://oberbrunner.name
9	Hilpert, Padberg and Jones	https://hackett.ca
10	Schneider, Raynor and Spencer	https://walsh.ca
\.


--
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notification (id, customer_id, type_id, content) FROM stdin;
1	3	2	Cursus turpis massa tincidunt dui ut.
2	1	2	Eget lorem dolor sed viverra ipsum nunc aliquet bibendum enim.
3	3	3	Amet nisl purus in mollis nunc.
4	8	1	Aliquam vestibulum morbi blandit cursus risus at ultrices mi tempus.
5	3	3	Fringilla est ullamcorper eget nulla facilisi etiam dignissim.
6	7	3	Leo in vitae turpis massa sed.
7	6	1	Tempus iaculis urna id volutpat lacus laoreet.
8	1	3	Nibh cras pulvinar mattis nunc sed blandit.
9	6	2	Porttitor lacus luctus accumsan tortor posuere ac ut consequat semper.
10	6	3	Erat velit scelerisque in dictum non consectetur a erat nam.
\.


--
-- Data for Name: notification_subscription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notification_subscription (customer_id, type_id, enabled) FROM stdin;
1	1	t
1	2	f
1	3	t
2	1	t
2	2	t
2	3	f
3	1	f
3	2	f
3	3	t
4	1	f
4	2	t
4	3	f
5	1	f
5	2	f
5	3	t
6	1	f
6	2	t
6	3	f
7	1	t
7	2	t
7	3	f
8	1	t
8	2	f
8	3	f
9	1	t
9	2	f
9	3	t
10	1	f
10	2	t
10	3	f
\.


--
-- Data for Name: notification_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notification_type (id, name, channel) FROM stdin;
1	Order Confirmation	email
2	Shipment Update	sms
3	Promotional	push
\.


--
-- Data for Name: order_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_item (order_id, product_id, quantity, unit_price) FROM stdin;
7	7	1	5.77
6	1	4	6.87
7	9	2	6.48
2	10	1	5.54
6	7	1	6.11
2	3	4	5.86
8	3	1	6.31
9	5	1	6.74
1	7	1	5.36
9	9	2	5.91
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, customer_id, address_id, shipment_method_id, payment_id, status, total_amount, currency) FROM stdin;
1	7	10	7	\N	pending	21.92	USD
2	6	7	1	\N	confirmed	20.78	USD
3	8	7	7	\N	shipped	20.33	USD
4	6	3	3	\N	pending	21.23	USD
5	9	8	6	\N	confirmed	21.18	USD
6	3	6	8	\N	shipped	21.78	USD
7	2	10	10	\N	pending	20.04	USD
8	7	6	7	\N	confirmed	20.99	USD
9	2	3	2	\N	shipped	20.57	USD
10	10	2	3	\N	pending	20.47	USD
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (id, order_id, method_id, amount, currency, status) FROM stdin;
1	4	3	21.94	USD	completed
2	10	2	20.78	USD	pending
3	10	1	21.03	USD	failed
4	2	1	21.62	USD	completed
5	3	1	20.51	USD	pending
6	4	1	20.81	USD	failed
7	8	3	20.74	USD	completed
8	7	3	20.60	USD	pending
9	4	2	21.25	USD	failed
10	10	2	20.76	USD	completed
\.


--
-- Data for Name: payment_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_method (id, name, type) FROM stdin;
1	Credit Card	card
2	PayPal	digital_wallet
3	Bank Transfer	bank
\.


--
-- Data for Name: platform; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.platform (id, name, api_base_url) FROM stdin;
1	Hansen LLC	https://bogan.info
2	Greenfelder-Homenick	https://mcdermott.co.uk
3	Walsh-Upton	https://raynor.biz
4	O'Reilly-King	https://kunze.co.uk
5	Muller and Sons	https://prohaska.us
6	Mitchell Group	https://carter.co.uk
7	Waters-Marquardt	https://leffler.com
8	Collier, Robel and Hudson	https://grant.com
9	Feeney, Leffler and Lowe	https://okuneva.com
10	Runolfsdottir-Balistreri	https://kshlerin.co.uk
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, platform_id, category_id, name, price, currency, available) FROM stdin;
1	2	6	porttitor	5.20	USD	f
2	7	10	nec	5.05	USD	f
3	7	3	pulvinar	5.73	USD	f
4	6	10	nibh	6.18	USD	t
5	3	4	magna	5.20	USD	f
6	10	1	eu	5.69	USD	f
7	5	7	in	6.02	USD	t
8	7	7	accumsan	6.08	USD	f
9	5	9	etiam	6.76	USD	t
10	3	5	neque	5.55	USD	f
\.


--
-- Data for Name: refund; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refund (id, order_id, reason, status) FROM stdin;
1	8	Adipiscing bibendum est ultricies integer quis auctor elit.	pending
2	4	Diam vel quam elementum pulvinar etiam non quam lacus suspendisse.	approved
3	10	Sed cras ornare arcu dui vivamus arcu felis bibendum.	rejected
4	10	Purus in massa tempor nec.	pending
5	7	Ac tortor dignissim convallis aenean et tortor.	approved
6	8	Augue ut lectus arcu bibendum at varius vel pharetra vel.	rejected
7	6	Orci sagittis eu volutpat odio facilisis mauris sit.	pending
8	1	Eget sit amet tellus cras adipiscing enim eu.	approved
9	10	Molestie ac feugiat sed lectus.	rejected
10	9	Id venenatis a condimentum vitae sapien pellentesque habitant.	pending
\.


--
-- Data for Name: return_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.return_item (return_id, order_item_order_id, order_item_product_id, quantity) FROM stdin;
4	8	3	1
9	8	3	1
10	8	3	2
8	8	3	2
1	8	3	1
7	8	3	1
6	8	3	2
5	8	3	1
2	8	3	2
\.


--
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.review (id, customer_id, product_id, order_id, rating, comment) FROM stdin;
1	3	7	3	4	Vitae et leo duis ut diam quam nulla porttitor massa.
2	10	4	9	1	Posuere lorem ipsum dolor sit amet consectetur adipiscing elit.
3	3	10	2	2	Diam maecenas ultricies mi eget mauris pharetra.
4	7	2	8	3	Amet volutpat consequat mauris nunc congue nisi vitae suscipit tellus.
5	7	6	7	4	Ac feugiat sed lectus vestibulum mattis.
6	7	1	5	2	Ullamcorper morbi tincidunt ornare massa eget egestas purus viverra accumsan.
7	10	6	5	2	Egestas pretium aenean pharetra magna ac placerat vestibulum lectus mauris.
8	4	1	5	2	Eu tincidunt tortor aliquam nulla facilisi cras.
9	1	7	10	4	Nisi lacus sed viverra tellus in hac.
10	9	4	2	3	Viverra justo nec ultrices dui sapien eget mi.
\.


--
-- Data for Name: shipment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipment (id, order_id, shipment_method_id, shipped_at, estimated_delivery) FROM stdin;
1	7	4	2025-06-04 12:21:17.788825	2025-06-07
2	2	10	2025-06-03 12:21:17.788825	2025-06-08
3	1	8	2025-06-02 12:21:17.788825	2025-06-09
4	4	4	2025-06-01 12:21:17.788825	2025-06-10
5	10	6	2025-05-31 12:21:17.788825	2025-06-11
6	4	9	2025-05-30 12:21:17.788825	2025-06-12
7	3	4	2025-05-29 12:21:17.788825	2025-06-13
8	8	5	2025-05-28 12:21:17.788825	2025-06-14
9	4	1	2025-05-27 12:21:17.788825	2025-06-15
10	9	7	2025-05-26 12:21:17.788825	2025-06-16
\.


--
-- Data for Name: shipment_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipment_method (id, name, carrier_id, estimated_days) FROM stdin;
1	consequat Shipping	10	3
2	varius Shipping	3	6
3	a Shipping	8	4
4	accumsan Shipping	6	6
5	lacus Shipping	8	4
6	volutpat Shipping	3	3
7	posuere Shipping	1	6
8	nullam Shipping	1	5
9	ut Shipping	4	1
10	sagittis Shipping	9	1
\.


--
-- Data for Name: support_ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.support_ticket (id, customer_id, order_id, subject, status) FROM stdin;
1	7	10	Tincidunt augue interdum velit euismod.	open
2	10	5	Ridiculus mus mauris vitae ultricies leo integer malesuada.	in_progress
3	6	3	Elit eget gravida cum sociis natoque penatibus et magnis.	closed
4	2	2	Nisi est sit amet facilisis magna.	open
5	5	2	Eget velit aliquet sagittis id consectetur purus.	in_progress
6	5	9	Viverra justo nec ultrices dui sapien eget mi.	closed
7	7	9	Id venenatis a condimentum vitae.	open
8	10	9	Magnis dis parturient montes nascetur.	in_progress
9	4	2	Convallis posuere morbi leo urna.	closed
10	10	7	Id venenatis a condimentum vitae.	open
\.


--
-- Data for Name: ticket_message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ticket_message (id, ticket_id, author_type, author_id, message) FROM stdin;
1	2	admin	3	Arcu cursus euismod quis viverra nibh cras pulvinar.
2	2	admin	2	Fusce ut placerat orci nulla pellentesque dignissim enim.
3	4	customer	6	Sem et tortor consequat id.
4	1	customer	7	Quisque sagittis purus sit amet volutpat consequat mauris nunc.
5	7	admin	6	Feugiat pretium nibh ipsum consequat nisl vel pretium.
6	7	admin	7	At consectetur lorem donec massa sapien faucibus.
7	4	admin	3	Eget mi proin sed libero enim sed.
8	7	customer	10	Tempus imperdiet nulla malesuada pellentesque.
9	6	customer	5	Est ultricies integer quis auctor elit sed.
10	10	customer	1	Aliquam faucibus purus in massa tempor nec feugiat nisl pretium.
\.


--
-- Data for Name: tracking_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tracking_info (id, shipment_id, tracking_number) FROM stdin;
1	10	fd25d8fa-cd54-a3b6-5c80-696c39a57a1a
2	3	dfd334d4-8dab-ae46-352d-2d6224822e86
3	10	317052e8-b7e2-be7c-12af-1df64b77a7ba
4	9	3739671a-5de8-5716-ffcb-9975b5d31d6f
5	9	e3477b5f-091d-0986-f1b1-5e648de772a3
6	6	4b891d68-8217-2759-7c9c-81c1197fbdab
7	3	71c3505b-4a27-f0d7-abc9-0ed7453782dd
8	4	1cc2ea1a-dc72-b9d1-8bd7-fa0530f55c96
9	2	077d9082-28ab-df69-88e5-5b9c955e45cc
10	3	20a46f75-3258-78af-2c38-01833cfbdde8
\.


--
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_id_seq', 10, true);


--
-- Name: admin_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_user_id_seq', 10, true);


--
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 10, true);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 10, true);


--
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_id_seq', 10, true);


--
-- Name: logistic_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logistic_company_id_seq', 10, true);


--
-- Name: notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notification_id_seq', 10, true);


--
-- Name: notification_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notification_type_id_seq', 3, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 10, true);


--
-- Name: payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_id_seq', 10, true);


--
-- Name: payment_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_method_id_seq', 3, true);


--
-- Name: platform_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.platform_id_seq', 10, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 10, true);


--
-- Name: refund_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refund_id_seq', 10, true);


--
-- Name: review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.review_id_seq', 10, true);


--
-- Name: shipment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipment_id_seq', 10, true);


--
-- Name: shipment_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipment_method_id_seq', 10, true);


--
-- Name: support_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.support_ticket_id_seq', 10, true);


--
-- Name: ticket_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ticket_message_id_seq', 10, true);


--
-- Name: tracking_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tracking_info_id_seq', 10, true);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: admin_user admin_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_user
    ADD CONSTRAINT admin_user_pkey PRIMARY KEY (id);


--
-- Name: admin_user admin_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_user
    ADD CONSTRAINT admin_user_username_key UNIQUE (username);


--
-- Name: cart_item cart_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_pkey PRIMARY KEY (cart_id, product_id);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: customer customer_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_email_key UNIQUE (email);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: logistic_company logistic_company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logistic_company
    ADD CONSTRAINT logistic_company_pkey PRIMARY KEY (id);


--
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (id);


--
-- Name: notification_subscription notification_subscription_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_subscription
    ADD CONSTRAINT notification_subscription_pkey PRIMARY KEY (customer_id, type_id);


--
-- Name: notification_type notification_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_type
    ADD CONSTRAINT notification_type_pkey PRIMARY KEY (id);


--
-- Name: order_item order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (order_id, product_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: payment_method payment_method_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_method
    ADD CONSTRAINT payment_method_pkey PRIMARY KEY (id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- Name: platform platform_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.platform
    ADD CONSTRAINT platform_pkey PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: refund refund_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refund
    ADD CONSTRAINT refund_pkey PRIMARY KEY (id);


--
-- Name: return_item return_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return_item
    ADD CONSTRAINT return_item_pkey PRIMARY KEY (return_id, order_item_order_id, order_item_product_id);


--
-- Name: review review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_pkey PRIMARY KEY (id);


--
-- Name: shipment_method shipment_method_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipment_method
    ADD CONSTRAINT shipment_method_pkey PRIMARY KEY (id);


--
-- Name: shipment shipment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipment
    ADD CONSTRAINT shipment_pkey PRIMARY KEY (id);


--
-- Name: support_ticket support_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_ticket
    ADD CONSTRAINT support_ticket_pkey PRIMARY KEY (id);


--
-- Name: ticket_message ticket_message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_message
    ADD CONSTRAINT ticket_message_pkey PRIMARY KEY (id);


--
-- Name: tracking_info tracking_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracking_info
    ADD CONSTRAINT tracking_info_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- Name: cart cart_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id) ON DELETE CASCADE;


--
-- Name: cart_item cart_item_cart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.cart(id) ON DELETE CASCADE;


--
-- Name: cart_item cart_item_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: notification notification_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id) ON DELETE CASCADE;


--
-- Name: notification_subscription notification_subscription_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_subscription
    ADD CONSTRAINT notification_subscription_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id) ON DELETE CASCADE;


--
-- Name: notification_subscription notification_subscription_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_subscription
    ADD CONSTRAINT notification_subscription_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.notification_type(id) ON DELETE CASCADE;


--
-- Name: notification notification_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.notification_type(id) ON DELETE CASCADE;


--
-- Name: order_item order_item_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: order_item order_item_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE RESTRICT;


--
-- Name: orders orders_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(id) ON DELETE RESTRICT;


--
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id) ON DELETE RESTRICT;


--
-- Name: orders orders_shipment_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_shipment_method_id_fkey FOREIGN KEY (shipment_method_id) REFERENCES public.shipment_method(id) ON DELETE RESTRICT;


--
-- Name: payment payment_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_method_id_fkey FOREIGN KEY (method_id) REFERENCES public.payment_method(id) ON DELETE RESTRICT;


--
-- Name: payment payment_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: product product_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id) ON DELETE RESTRICT;


--
-- Name: product product_platform_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_platform_id_fkey FOREIGN KEY (platform_id) REFERENCES public.platform(id) ON DELETE RESTRICT;


--
-- Name: refund refund_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refund
    ADD CONSTRAINT refund_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: return_item return_item_order_item_order_id_order_item_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return_item
    ADD CONSTRAINT return_item_order_item_order_id_order_item_product_id_fkey FOREIGN KEY (order_item_order_id, order_item_product_id) REFERENCES public.order_item(order_id, product_id) ON DELETE CASCADE;


--
-- Name: return_item return_item_return_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.return_item
    ADD CONSTRAINT return_item_return_id_fkey FOREIGN KEY (return_id) REFERENCES public.refund(id) ON DELETE CASCADE;


--
-- Name: review review_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id) ON DELETE CASCADE;


--
-- Name: review review_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: review review_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: shipment_method shipment_method_carrier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipment_method
    ADD CONSTRAINT shipment_method_carrier_id_fkey FOREIGN KEY (carrier_id) REFERENCES public.logistic_company(id) ON DELETE RESTRICT;


--
-- Name: shipment shipment_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipment
    ADD CONSTRAINT shipment_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: shipment shipment_shipment_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipment
    ADD CONSTRAINT shipment_shipment_method_id_fkey FOREIGN KEY (shipment_method_id) REFERENCES public.shipment_method(id) ON DELETE RESTRICT;


--
-- Name: support_ticket support_ticket_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_ticket
    ADD CONSTRAINT support_ticket_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id) ON DELETE CASCADE;


--
-- Name: support_ticket support_ticket_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_ticket
    ADD CONSTRAINT support_ticket_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE SET NULL;


--
-- Name: ticket_message ticket_message_ticket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_message
    ADD CONSTRAINT ticket_message_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES public.support_ticket(id) ON DELETE CASCADE;


--
-- Name: tracking_info tracking_info_shipment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracking_info
    ADD CONSTRAINT tracking_info_shipment_id_fkey FOREIGN KEY (shipment_id) REFERENCES public.shipment(id) ON DELETE CASCADE;


--
-- Name: TABLE address; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.address TO analytic;


--
-- Name: TABLE admin_user; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.admin_user TO analytic;


--
-- Name: TABLE cart; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.cart TO analytic;


--
-- Name: TABLE cart_item; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.cart_item TO analytic;


--
-- Name: TABLE category; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.category TO analytic;


--
-- Name: TABLE customer; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.customer TO analytic;


--
-- Name: TABLE flyway_schema_history; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.flyway_schema_history TO analytic;


--
-- Name: TABLE logistic_company; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.logistic_company TO analytic;


--
-- Name: TABLE notification; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.notification TO analytic;


--
-- Name: TABLE notification_subscription; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.notification_subscription TO analytic;


--
-- Name: TABLE notification_type; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.notification_type TO analytic;


--
-- Name: TABLE order_item; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.order_item TO analytic;


--
-- Name: TABLE orders; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.orders TO analytic;


--
-- Name: TABLE payment; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.payment TO analytic;


--
-- Name: TABLE payment_method; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.payment_method TO analytic;


--
-- Name: TABLE platform; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.platform TO analytic;


--
-- Name: TABLE product; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.product TO analytic;


--
-- Name: TABLE refund; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.refund TO analytic;


--
-- Name: TABLE return_item; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.return_item TO analytic;


--
-- Name: TABLE review; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.review TO analytic;


--
-- Name: TABLE shipment; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.shipment TO analytic;


--
-- Name: TABLE shipment_method; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.shipment_method TO analytic;


--
-- Name: TABLE support_ticket; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.support_ticket TO analytic;


--
-- Name: TABLE ticket_message; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.ticket_message TO analytic;


--
-- Name: TABLE tracking_info; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.tracking_info TO analytic;


--
-- PostgreSQL database dump complete
--

