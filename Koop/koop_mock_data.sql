CREATE TABLE available_quantities
(
  available_quantity_id bigint NOT NULL IDENTITY(1, 1),
  product_id bigint NOT NULL,
  quantity int NOT NULL
)


ALTER TABLE available_quantities ADD CONSTRAINT pk_available_quantities
  PRIMARY KEY (available_quantity_id)


CREATE TABLE baskets
(
  basket_id bigint NOT NULL IDENTITY(1, 1),
  coop_id bigint NULL
)


ALTER TABLE baskets ADD CONSTRAINT pk_baskets
  PRIMARY KEY (basket_id)


CREATE TABLE categories
(
  category_id bigint NOT NULL IDENTITY(1, 1),
  category_name varchar(100) NOT NULL
)


ALTER TABLE categories ADD CONSTRAINT pk_categories
  PRIMARY KEY (category_id)


CREATE TABLE cooperators
(
  coop_id bigint NOT NULL IDENTITY(1, 1),
  first_name varchar(20) NOT NULL,
  last_name varchar(20) NOT NULL,
  email varchar(30) NOT NULL,
  phone varchar(20) NULL,
  info text NULL,
  debt float NULL,
  fund_id bigint NOT NULL,
  function_id bigint NULL,
  basket_id tinyint NULL
)


ALTER TABLE cooperators ADD CONSTRAINT pk_cooperators
  PRIMARY KEY (coop_id)


CREATE TABLE favorities
(
  favorite_id bigint NOT NULL IDENTITY(1, 1),
  coop_id bigint NOT NULL,
  product_id bigint NOT NULL
)


ALTER TABLE favorities ADD CONSTRAINT pk_favorities
  PRIMARY KEY (favorite_id)


CREATE TABLE functions
(
  function_id bigint NOT NULL IDENTITY(1, 1),
  function_name varchar(100) NOT NULL
)


ALTER TABLE functions ADD CONSTRAINT pk_functions
  PRIMARY KEY (function_id)


CREATE TABLE funds
(
  fund_id bigint NOT NULL IDENTITY(1, 1),
  value tinyint NOT NULL
)


ALTER TABLE funds ADD CONSTRAINT pk_funds
  PRIMARY KEY (fund_id)


CREATE TABLE order_status
(
  order_status_id bigint NOT NULL IDENTITY(1, 1),
  order_status_name varchar(100) NOT NULL
)


ALTER TABLE order_status ADD CONSTRAINT pk_order_status
  PRIMARY KEY (order_status_id)


CREATE TABLE ordered_items
(
  ordered_item_id bigint NOT NULL IDENTITY(1, 1),
  order_id bigint NOT NULL,
  product_id bigint NOT NULL,
  coop_id bigint NOT NULL,
  order_status_id bigint NOT NULL,
  quantity int NOT NULL DEFAULT 0
)


ALTER TABLE ordered_items ADD CONSTRAINT pk_ordered_items
  PRIMARY KEY (ordered_item_id)


CREATE TABLE orders
(
  order_id bigint NOT NULL IDENTITY(1, 1),
  order_start_date datetime NOT NULL,
  order_stop_date datetime NOT NULL
)


ALTER TABLE orders ADD CONSTRAINT pk_orders
  PRIMARY KEY (order_id)


CREATE TABLE product_categories
(
  product_category_id bigint NOT NULL IDENTITY(1, 1),
  product_id bigint NOT NULL,
  category_id bigint NOT NULL
)


ALTER TABLE product_categories ADD CONSTRAINT pk_product_categories
  PRIMARY KEY (product_category_id)


CREATE TABLE products
(
  product_id bigint NOT NULL IDENTITY(1, 1),
  product_name varchar(100) NOT NULL,
  price float NOT NULL,
  description text NULL,
  amount_in_magazine int NOT NULL DEFAULT 0,
  magazine bit NOT NULL DEFAULT 0,
  amount_max int NULL,
  deposit int NULL DEFAULT 0,
  picture text DEFAULT '',
  unit_id bigint NOT NULL,
  supplier_id bigint NOT NULL,
  available bit NOT NULL DEFAULT 0,
  blocked bit NOT NULL DEFAULT 0
)


ALTER TABLE products ADD CONSTRAINT pk_products
  PRIMARY KEY (product_id)


CREATE TABLE suppliers
(
  supplier_id bigint NOT NULL IDENTITY(1, 1),
  supplier_name varchar(100) NOT NULL,
  supplier_abbr varchar(20) NOT NULL,
  description text NULL,
  email varchar(30) NOT NULL,
  phone varchar(20) NOT NULL,
  picture text NULL,
  order_closing_date datetime NULL,
  opro_id bigint NOT NULL
)


ALTER TABLE suppliers ADD CONSTRAINT pk_suppliers
  PRIMARY KEY (supplier_id)


CREATE TABLE units
(
  unit_id bigint NOT NULL IDENTITY(1, 1),
  unit_name varchar(50) NULL
)


ALTER TABLE units ADD CONSTRAINT pk_units
  PRIMARY KEY (unit_id)


CREATE TABLE work_types
(
  work_type_id bigint NOT NULL IDENTITY(1, 1),
  work_type varchar(200) NOT NULL
)


ALTER TABLE work_types ADD CONSTRAINT pk_work_types
  PRIMARY KEY (work_type_id)


CREATE TABLE works
(
  work_id bigint NOT NULL IDENTITY(1, 1),
  work_date datetime NOT NULL,
  duration float NOT NULL,
  coop_id bigint NOT NULL,
  work_type_id bigint NOT NULL
)


ALTER TABLE works ADD CONSTRAINT pk_works
  PRIMARY KEY (work_id)


ALTER TABLE available_quantities ADD CONSTRAINT fk_available_quantities_product_id
  FOREIGN KEY (product_id) REFERENCES products (product_id)


ALTER TABLE baskets ADD CONSTRAINT fk_baskets_coop_id
  FOREIGN KEY (coop_id) REFERENCES cooperators (coop_id)


ALTER TABLE cooperators ADD CONSTRAINT fk_cooperators_function_id
  FOREIGN KEY (function_id) REFERENCES functions (function_id)


ALTER TABLE cooperators ADD CONSTRAINT fk_cooperators_fund_id
  FOREIGN KEY (fund_id) REFERENCES funds (fund_id)


ALTER TABLE favorities ADD CONSTRAINT fk_favorities_coop_id
  FOREIGN KEY (coop_id) REFERENCES cooperators (coop_id)


ALTER TABLE favorities ADD CONSTRAINT fk_favorities_product_id
  FOREIGN KEY (product_id) REFERENCES products (product_id)


ALTER TABLE ordered_items ADD CONSTRAINT fk_ordered_items_coop_id
  FOREIGN KEY (coop_id) REFERENCES cooperators (coop_id)


ALTER TABLE ordered_items ADD CONSTRAINT fk_ordered_items_order_id
  FOREIGN KEY (order_id) REFERENCES orders (order_id)


ALTER TABLE ordered_items ADD CONSTRAINT fk_ordered_items_order_status_id
  FOREIGN KEY (order_status_id) REFERENCES order_status (order_status_id)


ALTER TABLE ordered_items ADD CONSTRAINT fk_ordered_items_product_id
  FOREIGN KEY (product_id) REFERENCES products (product_id)


ALTER TABLE product_categories ADD CONSTRAINT fk_product_categories_category_id
  FOREIGN KEY (category_id) REFERENCES categories (category_id)


ALTER TABLE product_categories ADD CONSTRAINT fk_product_categories_product_id
  FOREIGN KEY (product_id) REFERENCES products (product_id)


ALTER TABLE products ADD CONSTRAINT fk_products_supplier_id
  FOREIGN KEY (supplier_id) REFERENCES suppliers (supplier_id) ON DELETE CASCADE ON UPDATE CASCADE


ALTER TABLE products ADD CONSTRAINT fk_products_unit_id
  FOREIGN KEY (unit_id) REFERENCES units (unit_id)


ALTER TABLE suppliers ADD CONSTRAINT fk_suppliers_coop_id
  FOREIGN KEY (opro_id) REFERENCES cooperators (coop_id)


ALTER TABLE works ADD CONSTRAINT fk_works_coop_id
  FOREIGN KEY (coop_id) REFERENCES cooperators (coop_id)


ALTER TABLE works ADD CONSTRAINT fk_works_work_type_id
  FOREIGN KEY (work_type_id) REFERENCES work_types (work_type_id)


INSERT INTO work_types (work_type) VALUES (N'Sprzatanie');
INSERT INTO work_types (work_type) VALUES (N'Paczkowanie');
INSERT INTO work_types (work_type) VALUES (N'Wprowadzanie nowych kooperantów');
INSERT INTO work_types (work_type) VALUES (N'OpRo');
INSERT INTO work_types (work_type) VALUES (N'KoTy');

INSERT INTO order_status (order_status_name) VALUES (N'Szkic');
INSERT INTO order_status (order_status_name) VALUES (N'Zatwierdzone');
INSERT INTO order_status (order_status_name) VALUES (N'Zrealizowane');

INSERT INTO functions (function_name) VALUES (N'admin');
INSERT INTO functions (function_name) VALUES (N'koty');
INSERT INTO functions (function_name) VALUES (N'opro');
INSERT INTO functions (function_name) VALUES (N'paczkers');
INSERT INTO functions (function_name) VALUES (N'rozwazacz');
INSERT INTO functions (function_name) VALUES (N'wprowadzacz');
INSERT INTO functions (function_name) VALUES (N'skarbnik');
INSERT INTO functions (function_name) VALUES (N'default');

INSERT INTO funds (value) VALUES (10);
INSERT INTO funds (value) VALUES (30);

INSERT INTO orders (order_start_date, order_stop_date) VALUES (N'2021-02-06 00:00:00.000', N'2021-02-09 00:00:00.000');
INSERT INTO orders (order_start_date, order_stop_date) VALUES (N'2021-02-13 00:00:00.000', N'2021-02-16 00:00:00.000');
INSERT INTO orders (order_start_date, order_stop_date) VALUES (N'2021-02-27 00:00:00.000', N'2021-03-02 00:00:00.000');
INSERT INTO orders (order_start_date, order_stop_date) VALUES (N'2021-03-13 00:00:00.000', N'2021-03-16 00:00:00.000');

INSERT INTO units (unit_name) VALUES (N'l');
INSERT INTO units (unit_name) VALUES (N'kg');
INSERT INTO units (unit_name) VALUES (N'g');
INSERT INTO units (unit_name) VALUES (N'piece');
INSERT INTO units (unit_name) VALUES (N'ml');

INSERT INTO categories (category_name) VALUES (N'Warzywa');
INSERT INTO categories (category_name) VALUES (N'Produkty zwierzece');
INSERT INTO categories (category_name) VALUES (N'Alkohol');
INSERT INTO categories (category_name) VALUES (N'Pieczywo');
INSERT INTO categories (category_name) VALUES (N'Wyroby cukiernicze');
INSERT INTO categories (category_name) VALUES (N'Dla wegan');
INSERT INTO categories (category_name) VALUES (N'Produkty zwierzeco-podobne');
INSERT INTO categories (category_name) VALUES (N'Napoje');

INSERT INTO cooperators (first_name, last_name, email, phone, info, debt, fund_id, function_id, basket_id) VALUES (N'Cyprian', N'Zalewski', N'bbertouloume0@woothemes.com', N'460 519 0177', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar.', 0, 1, 1, null);
INSERT INTO cooperators (first_name, last_name, email, phone, info, debt, fund_id, function_id, basket_id) VALUES (N'Gniewomir', N'Witkowski', N'jdebell1@cnbc.com', N'572 452 2547', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar.', 0, 1, 2, null);
INSERT INTO cooperators (first_name, last_name, email, phone, info, debt, fund_id, function_id, basket_id) VALUES (N'Kamil', N'Gajewski', N'bfargher2@live.com', N'255 849 1951', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar.', 2, 2, 4, null);
INSERT INTO cooperators (first_name, last_name, email, phone, info, debt, fund_id, function_id, basket_id) VALUES (N'Marcel', N'Zakrzewski', N'zdjordjevic3@icq.com', N'959 246 8273', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar.', 12, 2, 7, 3);
INSERT INTO cooperators (first_name, last_name, email, phone, info, debt, fund_id, function_id, basket_id) VALUES (N'Dorian', N'Szymanski', N'bharrowell4@cam.ac.uk', N'294 762 0360', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar.', -10, 1, 6, null);
INSERT INTO cooperators (first_name, last_name, email, phone, info, debt, fund_id, function_id, basket_id) VALUES (N'Jakub', N'Ostrowski', N'rdoers5@imgur.com', N'309 913 9211', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar.', 0, 2, 4, 1);
INSERT INTO cooperators (first_name, last_name, email, phone, info, debt, fund_id, function_id, basket_id) VALUES (N'Lucjan', N'Urbanski', N'nandrus6@so-net.ne.jp', N'930 652 1576', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar.', 0, 1, 8, 3);
INSERT INTO cooperators (first_name, last_name, email, phone, info, debt, fund_id, function_id, basket_id) VALUES (N'Andrzej', N'Kalinowski', N'cgrebert7@jimdo.com', N'494 572 0008', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar.', -21, 1, 8, null);
INSERT INTO cooperators (first_name, last_name, email, phone, info, debt, fund_id, function_id, basket_id) VALUES (N'Marcel', N'Dabrowski', N'mginnell8@canalblog.com', N'489 722 9926', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar.', 22, 2, 4, null);
INSERT INTO cooperators (first_name, last_name, email, phone, info, debt, fund_id, function_id, basket_id) VALUES (N'Mikolaj', N'Wasilewski', N'aleestut9@china.com.cn', N'723 622 1986', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar.', 0, 2, 8, 2);
INSERT INTO cooperators (first_name, last_name, email, phone, info, debt, fund_id, function_id, basket_id) VALUES (N'Jakub', N'Adamski', N'awarkupa@tripadvisor.com', N'129 326 4719', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar.', 0, 1, 8, null);
INSERT INTO cooperators (first_name, last_name, email, phone, info, debt, fund_id, function_id, basket_id) VALUES (N'Konrad', N'Baran', N'mmantioneb@mysql.com', N'720 752 5258', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar.', 0, 1, 8, null);
INSERT INTO cooperators (first_name, last_name, email, phone, info, debt, fund_id, function_id, basket_id) VALUES (N'Kuba', N'Malinowski', N'lhaylettc@ucoz.ru', N'290 882 4958', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar.', 0, 1, 8, 4);

INSERT INTO suppliers (supplier_name, supplier_abbr, description, email, phone, picture, order_closing_date, opro_id) VALUES (N'Chorazy', N'CHOR', N'Best vegetables', N'chor@chor.pl', N'48235125694', null, null, 4);
INSERT INTO suppliers (supplier_name, supplier_abbr, description, email, phone, picture, order_closing_date, opro_id) VALUES (N'Gustaw', N'GUMI', N'Sweets without sugar', N'gumi@gumi.pl', N'48562145896', null, N'2021-03-24 00:00:00.000', 7);
INSERT INTO suppliers (supplier_name, supplier_abbr, description, email, phone, picture, order_closing_date, opro_id) VALUES (N'Kamila', N'KAMI', N'Meat for vegans', N'kami@kami.pl', N'48521359844', null, null, 7);
INSERT INTO suppliers (supplier_name, supplier_abbr, description, email, phone, picture, order_closing_date, opro_id) VALUES (N'Jedrzej', N'JEDY', N'Non-milk dairy products', N'jedy@jedy.pl', N'48985632154', null, N'2021-03-23 00:00:00.000', 7);
INSERT INTO suppliers (supplier_name, supplier_abbr, description, email, phone, picture, order_closing_date, opro_id) VALUES (N'Grzegorz', N'GRZE', N'Alcohol-free wines', N'grze@grze.pl', N'48568741256', null, N'2021-03-24 00:00:00.000', 4);
INSERT INTO suppliers (supplier_name, supplier_abbr, description, email, phone, picture, order_closing_date, opro_id) VALUES (N'Felicjan', N'FELI', N'Best artificial honey', N'feli@feli.pl', N'48741258963', null, null, 4);
INSERT INTO suppliers (supplier_name, supplier_abbr, description, email, phone, picture, order_closing_date, opro_id) VALUES (N'Eleonora', N'ELEO', N'Flour-free bread', N'eleo@eleo.pl', N'48563259841', null, N'2021-03-22 00:00:00.000', 7);

INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Cebula czerwona', 2, null, 20, 1, 20, null, null, 4, 1, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Cukinia', 3, null, 10, 1, 10, null, null, 4, 1, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Dynia', 6, null, 15, 1, 15, null, null, 4, 1, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Marchew', 4, null, 20, 1, 20, null, null, 2, 1, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Muffin black', 10, null, 0, 0, 30, null, null, 4, 2, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Mleczna czekolada', 20, null, 0, 0, 10, null, null, 4, 2, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Babka piaskowa', 6, null, 0, 0, 5, null, null, 4, 2, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Kurczak sojowy', 8, null, 0, 0, 15, null, null, 3, 3, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Stek sojowy', 10, null, 0, 0, 12, null, null, 3, 3, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Golonko sojowe', 15, null, 0, 0, 7, null, null, 3, 3, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Serca drobiowe sojowe', 4, null, 0, 0, 22, null, null, 3, 3, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Twaróg', 8, null, 0, 0, 6, null, null, 3, 4, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Mleko sojowe', 10, null, 0, 0, 5, null, null, 5, 4, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Oscypek', 15, null, 0, 0, 6, null, null, 3, 4, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Bryndza', 13, null, 0, 0, 5, null, null, 3, 4, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Wino z winogron', 22, null, 10, 1, 10, null, null, 1, 5, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Piwo jeczmienne', 6, null, 15, 1, 15, null, null, 5, 5, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Piwo lager', 8, null, 15, 1, 15, null, null, 5, 5, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Wino porzeczkowe', 10, null, 12, 1, 12, null, null, 1, 5, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Miód spadziowy', 15, null, 10, 1, 10, null, null, 2, 6, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Miód lipowy', 17, null, 12, 1, 12, null, null, 2, 6, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Miód rzepakowy', 13, null, 15, 1, 15, null, null, 2, 6, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Bulka pszenna', 3, null, 0, 0, 30, null, null, 3, 7, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Chleb zytni', 7, null, 0, 0, 15, null, null, 3, 7, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Chleb pszenny', 6, null, 0, 0, 10, null, null, 3, 7, 1, 0);
INSERT INTO products (product_name, price, description, amount_in_magazine, magazine, amount_max, deposit, picture, unit_id, supplier_id, available, blocked) VALUES (N'Bulka zytnia', 4, null, 0, 0, 16, null, null, 3, 7, 1, 0);

INSERT INTO available_quantities (product_id, quantity) VALUES (1, 1);
INSERT INTO available_quantities (product_id, quantity) VALUES (2, 1);
INSERT INTO available_quantities (product_id, quantity) VALUES (3, 1);
INSERT INTO available_quantities (product_id, quantity) VALUES (4, 1);
INSERT INTO available_quantities (product_id, quantity) VALUES (5, 1);
INSERT INTO available_quantities (product_id, quantity) VALUES (6, 1);
INSERT INTO available_quantities (product_id, quantity) VALUES (7, 1);
INSERT INTO available_quantities (product_id, quantity) VALUES (8, 100);
INSERT INTO available_quantities (product_id, quantity) VALUES (9, 120);
INSERT INTO available_quantities (product_id, quantity) VALUES (10, 120);
INSERT INTO available_quantities (product_id, quantity) VALUES (11, 60);
INSERT INTO available_quantities (product_id, quantity) VALUES (12, 150);
INSERT INTO available_quantities (product_id, quantity) VALUES (13, 250);
INSERT INTO available_quantities (product_id, quantity) VALUES (14, 130);
INSERT INTO available_quantities (product_id, quantity) VALUES (15, 120);
INSERT INTO available_quantities (product_id, quantity) VALUES (17, 300);
INSERT INTO available_quantities (product_id, quantity) VALUES (18, 300);
INSERT INTO available_quantities (product_id, quantity) VALUES (20, 1);
INSERT INTO available_quantities (product_id, quantity) VALUES (21, 1);
INSERT INTO available_quantities (product_id, quantity) VALUES (22, 1);
INSERT INTO available_quantities (product_id, quantity) VALUES (23, 100);
INSERT INTO available_quantities (product_id, quantity) VALUES (24, 250);
INSERT INTO available_quantities (product_id, quantity) VALUES (25, 250);
INSERT INTO available_quantities (product_id, quantity) VALUES (26, 100);

INSERT INTO product_categories (product_id, category_id) VALUES (1, 1);
INSERT INTO product_categories (product_id, category_id) VALUES (2, 1);
INSERT INTO product_categories (product_id, category_id) VALUES (3, 1);
INSERT INTO product_categories (product_id, category_id) VALUES (4, 1);
INSERT INTO product_categories (product_id, category_id) VALUES (5, 5);
INSERT INTO product_categories (product_id, category_id) VALUES (5, 6);
INSERT INTO product_categories (product_id, category_id) VALUES (6, 5);
INSERT INTO product_categories (product_id, category_id) VALUES (6, 6);
INSERT INTO product_categories (product_id, category_id) VALUES (7, 5);
INSERT INTO product_categories (product_id, category_id) VALUES (7, 6);
INSERT INTO product_categories (product_id, category_id) VALUES (8, 6);
INSERT INTO product_categories (product_id, category_id) VALUES (9, 6);
INSERT INTO product_categories (product_id, category_id) VALUES (10, 6);
INSERT INTO product_categories (product_id, category_id) VALUES (11, 6);
INSERT INTO product_categories (product_id, category_id) VALUES (8, 7);
INSERT INTO product_categories (product_id, category_id) VALUES (9, 7);
INSERT INTO product_categories (product_id, category_id) VALUES (10, 7);
INSERT INTO product_categories (product_id, category_id) VALUES (11, 7);
INSERT INTO product_categories (product_id, category_id) VALUES (12, 7);
INSERT INTO product_categories (product_id, category_id) VALUES (13, 7);
INSERT INTO product_categories (product_id, category_id) VALUES (14, 7);
INSERT INTO product_categories (product_id, category_id) VALUES (15, 7);
INSERT INTO product_categories (product_id, category_id) VALUES (12, 6);
INSERT INTO product_categories (product_id, category_id) VALUES (13, 6);
INSERT INTO product_categories (product_id, category_id) VALUES (14, 6);
INSERT INTO product_categories (product_id, category_id) VALUES (15, 6);
INSERT INTO product_categories (product_id, category_id) VALUES (16, 8);
INSERT INTO product_categories (product_id, category_id) VALUES (17, 8);
INSERT INTO product_categories (product_id, category_id) VALUES (18, 8);
INSERT INTO product_categories (product_id, category_id) VALUES (19, 8);
INSERT INTO product_categories (product_id, category_id) VALUES (20, 6);
INSERT INTO product_categories (product_id, category_id) VALUES (21, 6);
INSERT INTO product_categories (product_id, category_id) VALUES (22, 6);
INSERT INTO product_categories (product_id, category_id) VALUES (23, 4);
INSERT INTO product_categories (product_id, category_id) VALUES (24, 4);
INSERT INTO product_categories (product_id, category_id) VALUES (25, 4);
INSERT INTO product_categories (product_id, category_id) VALUES (26, 4);

INSERT INTO baskets (coop_id) VALUES (null);
INSERT INTO baskets (coop_id) VALUES (null);
INSERT INTO baskets (coop_id) VALUES (null);
INSERT INTO baskets (coop_id) VALUES (null);
INSERT INTO baskets (coop_id) VALUES (null);
INSERT INTO baskets (coop_id) VALUES (6);
INSERT INTO baskets (coop_id) VALUES (7);
INSERT INTO baskets (coop_id) VALUES (10);
INSERT INTO baskets (coop_id) VALUES (13);

INSERT INTO works (work_date, duration, coop_id, work_type_id) VALUES (N'2021-02-13 00:00:00.000', 2, 3, 2);
INSERT INTO works (work_date, duration, coop_id, work_type_id) VALUES (N'2021-02-13 00:00:00.000', 1, 10, 5);
INSERT INTO works (work_date, duration, coop_id, work_type_id) VALUES (N'2021-02-13 00:00:00.000', 1, 1, 1);
INSERT INTO works (work_date, duration, coop_id, work_type_id) VALUES (N'2021-02-14 00:00:00.000', 2, 9, 2);
INSERT INTO works (work_date, duration, coop_id, work_type_id) VALUES (N'2021-02-16 00:00:00.000', 1, 7, 4);
INSERT INTO works (work_date, duration, coop_id, work_type_id) VALUES (N'2021-02-21 00:00:00.000', 2, 9, 1);
INSERT INTO works (work_date, duration, coop_id, work_type_id) VALUES (N'2021-02-22 00:00:00.000', 1, 4, 4);
INSERT INTO works (work_date, duration, coop_id, work_type_id) VALUES (N'2021-02-25 00:00:00.000', 1, 3, 2);
INSERT INTO works (work_date, duration, coop_id, work_type_id) VALUES (N'2021-02-26 00:00:00.000', 1, 11, 1);

INSERT INTO favorities (coop_id, product_id) VALUES (1, 4);
INSERT INTO favorities (coop_id, product_id) VALUES (1, 8);
INSERT INTO favorities (coop_id, product_id) VALUES (1, 12);
INSERT INTO favorities (coop_id, product_id) VALUES (2, 8);
INSERT INTO favorities (coop_id, product_id) VALUES (4, 3);
INSERT INTO favorities (coop_id, product_id) VALUES (6, 23);
INSERT INTO favorities (coop_id, product_id) VALUES (8, 25);
INSERT INTO favorities (coop_id, product_id) VALUES (9, 3);
INSERT INTO favorities (coop_id, product_id) VALUES (9, 9);
INSERT INTO favorities (coop_id, product_id) VALUES (5, 5);
INSERT INTO favorities (coop_id, product_id) VALUES (3, 7);
INSERT INTO favorities (coop_id, product_id) VALUES (5, 15);

INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (1, 1, 6, 1, 5);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (1, 3, 10, 2, 1);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (1, 4, 6, 1, 2);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (1, 5, 10, 2, 3);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (1, 7, 7, 2, 1);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (1, 8, 13, 2, 1);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (1, 10, 7, 2, 1);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (1, 12, 6, 1, 1);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (1, 13, 13, 2, 2);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (1, 15, 7, 2, 1);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (1, 17, 6, 1, 4);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (1, 19, 10, 2, 1);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (1, 21, 13, 2, 2);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (1, 22, 10, 2, 3);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (1, 24, 6, 1, 2);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (1, 25, 7, 2, 5);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (2, 1, 1, 3, 6);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (2, 3, 4, 3, 2);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (2, 4, 6, 3, 1);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (3, 5, 8, 3, 10);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (3, 7, 11, 3, 2);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (3, 8, 3, 3, 3);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (3, 10, 4, 3, 3);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (3, 12, 4, 3, 2);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (3, 13, 1, 3, 1);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (4, 15, 6, 3, 2);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (4, 17, 13, 3, 5);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (4, 19, 12, 3, 1);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (4, 21, 11, 3, 2);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (4, 22, 6, 3, 3);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (4, 24, 4, 3, 4);
INSERT INTO ordered_items (order_id, product_id, coop_id, order_status_id, quantity) VALUES (4, 25, 7, 3, 5);