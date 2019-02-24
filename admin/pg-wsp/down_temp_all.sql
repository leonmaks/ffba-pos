select * from ffba_cashreg
order by identity
;


4   eltapos_002
5   eltapos_003


3
1282	categories	5
1301	products	93
1277	stockcurrent	94


4
1331	categories	2
1353	products	122
1317	resources	5
1334	stockcurrent	15



eltapos_003 (5)

  categories    0
  products      287
  resources     1180
  stockcurrent  155


;;; SITEGUID ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

eltapos_001 (3);
select * from "r$u003_siteguid";
    2a502e42-f359-4174-8a5a-46118f4637a6
;


eltapos_003 (old)
;
    34892ae3-3656-4601-92a3-16ba73b14dcb

elta_00001
    2da8b8e5-7a47-4f1f-a950-ec140dc87a72

elta_00002
    ffcf5815-b7ef-4b9b-bc8f-14f6f04c59e6

elta_00003
    7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c
;

categories

	U 000 --> 7a54531a-4512-4358-9851-fbef6d50d60d
	D ae4b8b88-a368-4acb-b796-9917eafd537f

	N 541a3c62-1082-4d0a-8cba-2980c9ad43c1	Выпечка мясо
	N 5d575994-2e3a-4b87-bc49-176f247c92e7	Выпечка сладкая
	N d9747fb6-a74c-4b1f-a363-ed0b6c7c789b	Горячие напитки
	N ab758c05-f5aa-40eb-b3d1-1c62d14c52d5	Фастфуд + пицца



U 000	Хлеб
D xxx999	***

I 000	Category Standard
I xxx999	***


7a54531a-4512-4358-9851-fbef6d50d60d	Category Standard
ae4b8b88-a368-4acb-b796-9917eafd537f	***

2745ef70-c620-4a09-b781-f9c37fe0974e
268aaf5c-3ddd-4ae5-865c-03d9598b79f5
;

7a54531a-4512-4358-9851-fbef6d50d60d



elta_00002
  000 --> 38460a84-dae8-4280-8d77-9163093ea45a
  xxx999 --> ff69f552-2e4e-4c54-ac32-5a3e1db7ce1a
;
select* from r$d003_00002_categories
;
insert into
  r$d003_00002_categories
  (id, name, parentid, texttip, catshowname, image, colour, catorder, sflag, siteguid, "r$_id", "r$_op", "r$_create_dt")
select
  id, name, parentid, texttip, catshowname, image, colour, catorder, sflag, 'ffcf5815-b7ef-4b9b-bc8f-14f6f04c59e6', r$_id, r$_op, now()
from
  r$d005_categories
;
select * from r$u003_00002_categories
;
update r$d003_00002_categories set id = '38460a84-dae8-4280-8d77-9163093ea45a' where id = '000' (?)
;
update r$d003_00002_categories set id = 'ff69f552-2e4e-4c54-ac32-5a3e1db7ce1a' where id = 'xxx999' (?)
;
select * from r$u003_00002_products
;


elta_00003
  000 --> c107a00e-ecda-4306-a8d8-cb6bd7de3e66
  xxx999 --> 628792f7-56ee-4fbf-aa06-798932a1efdc
;
select * from r$d003_00003_categories
;
insert into
  r$d003_00003_categories
  (id, name, parentid, texttip, catshowname, image, colour, catorder, sflag, siteguid, "r$_id", "r$_op", "r$_create_dt")
select
  id, name, parentid, texttip, catshowname, image, colour, catorder, sflag, '7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c', r$_id, r$_op, now()
from
  r$d005_categories
;
select * from r$u003_00003_categories
;
select * from r$u003_00003_products
;



select * from r$u003_00002_categories
;

select * from r$d005_categories;



;;; PRODUCTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ELTAPOS_003 (5 - legacy)

select * from r$u005_products where r$_create_dt > '2019-02-01'
;

select * from r$d005_products
;



eltapos_001 (3 - legacy)
;
select * from r$d003_products
;
select * from r$u003_taxcategories
;
insert into r$d003_products (
  id, reference, code, codetype, "name", pricebuy, pricesell, category, taxcat, attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, "attributes", isvprice,
  isverpatrib, texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog,
  catorder, ispack, packquantity, packproduct, promotionid, allproducts, managestock, siteguid, sflag, "r$_op", "r$_create_dt"
)
select
  id, reference, code, codetype, "name", pricebuy, pricesell, category, taxcat, attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, "attributes", isvprice,
  isverpatrib, texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog,
  catorder, ispack, packquantity, packproduct, promotionid, allproducts, managestock, '2a502e42-f359-4174-8a5a-46118f4637a6', sflag, r$_op, now()
from
  r$u005_products
where
  r$_create_dt > '2019-02-01'
;
select max(r$_id) from r$d003_products
;
SELECT setval('r$d003_products_r$_id_seq', 143, true)
;



elta_00002
;
select * from r$d003_00002_products
;

select * from r$d005_products
;
insert into r$d003_00002_products (
  id, reference, code, codetype, "name", pricebuy, pricesell, category, taxcat, attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, "attributes", isvprice,
  isverpatrib, texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog,
  catorder, ispack, packquantity, packproduct, promotionid, allproducts, managestock, siteguid, sflag, commission,
  defaultptr, remotedisplay, defaultscreen, preptime, averagecost, ptroverride, "r$_id", "r$_op", "r$_create_dt"
)
select
  id, reference, code, codetype, "name", pricebuy, pricesell, category, taxcat, attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, "attributes", isvprice,
  isverpatrib, texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog,
  catorder, ispack, packquantity, packproduct, promotionid, allproducts, managestock, 'ffcf5815-b7ef-4b9b-bc8f-14f6f04c59e6', sflag, 0,
  2, false, 1, 0, 0, false, r$_id, r$_op, now()
from
  r$d005_products
;
select * from r$u003_00002_categories
;
update r$d003_00002_products set category = 'ff69f552-2e4e-4c54-ac32-5a3e1db7ce1a'
where category = '000'
;
select * from r$u003_00002_taxcategories
;
update r$d003_00002_products set taxcat = '7dbe26d7-0a42-4de1-aace-31e45ebc372a'
;
select max(r$_id) from r$d003_00002_products
;
SELECT setval('r$d003_00002_products_r$_id_seq', 211, true)
;

; update alwaysavailable ;
insert into r$d003_00002_products (
  id, reference, code, codetype, "name", pricebuy, pricesell, category, taxcat, attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, "attributes", isvprice,
  isverpatrib, texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog,
  catorder, ispack, packquantity, packproduct, promotionid, allproducts, managestock, siteguid, sflag, commission,
  defaultptr, remotedisplay, defaultscreen, preptime, averagecost, ptroverride, "r$_op", "r$_create_dt"
)
select
  id, reference, code, codetype, "name", pricebuy, pricesell, category, taxcat, attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, "attributes", isvprice,
  isverpatrib, texttip, warranty, image, stockunits, alias, false, discounted, candiscount, iscatalog,
  catorder, ispack, packquantity, packproduct, promotionid, allproducts, managestock, siteguid, sflag, commission,
  defaultptr, remotedisplay, defaultscreen, preptime, averagecost, ptroverride, 'U', now()
from
  r$d003_00002_products
;



elta_00003
;
select * from r$d003_00003_products
;

select * from r$d005_products
;
insert into r$d003_00003_products (
  id, reference, code, codetype, "name", pricebuy, pricesell, category, taxcat, attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, "attributes", isvprice,
  isverpatrib, texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog,
  catorder, ispack, packquantity, packproduct, promotionid, allproducts, managestock, siteguid, sflag, commission,
  defaultptr, remotedisplay, defaultscreen, preptime, averagecost, ptroverride, "r$_id", "r$_op", "r$_create_dt"
)
select
  id, reference, code, codetype, "name", pricebuy, pricesell, category, taxcat, attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, "attributes", isvprice,
  isverpatrib, texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog,
  catorder, ispack, packquantity, packproduct, promotionid, allproducts, managestock, '7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c', sflag, 0,
  2, false, 1, 0, 0, false, r$_id, r$_op, now()
from
  r$d005_products
;
select * from r$u003_00003_categories
;
update r$d003_00003_products set category = 'c107a00e-ecda-4306-a8d8-cb6bd7de3e66'
where category = '000'
;
select * from r$u003_00003_taxcategories
;
update r$d003_00003_products set taxcat = 'cb8d9b64-0966-436c-a5ad-abe0543953e5'
;





/* POS-00000 */
update r$d003_00000_products set siteguid = '4651ee81-b78c-49de-8bc2-66a297f7ee9f'
;

select * from r$d003_00000_products
;

select * from r$u003_00000_categories
;

'2745ef70-c620-4a09-b781-f9c37fe0974e'
;

update r$d003_00001_products set category = '7a54531a-4512-4358-9851-fbef6d50d60d' where category = '000'
;

select * from r$d003_00001_products where category = '000'
;

update r$d003_00001_products set taxcat = '0a882dd6-1fd9-43b6-bb78-9f337aff9551'
;



select * from r$u003_00000_resources
;

select * from r$d003_resources
;

select * from r$d004_resources
;

select * from r$d005_resources
;

select * from r$u005_resources where id = '54'
;

select * from r$u005_resources where id = '54'
;




select * from r$d003_00001_stockcurrent
;

select * from r$u003_00001_products
;

select * from r$d004_stockcurrent
;

select * from r$d005_stockcurrent
;

insert into r$d003_00001_stockcurrent (
    location,
    product,
    attributesetinstance_id,
    units,
    siteguid,
    sflag,
    "r$_id",
    "r$_op",
    "r$_create_dt"
)
select
    location,
    product,
    attributesetinstance_id,
    units,
    '2da8b8e5-7a47-4f1f-a950-ec140dc87a72',
    sflag,
    "r$_id",
    "r$_op",
    now()
from r$d005_stockcurrent
;

select * from r$u003_00001_stockcurrent
;

select * from r$u003_00001_products
;

select count(*) from r$d003_00001_stockcurrent s
where not exists (
select 1 from r$u003_00001_products
where id = s.product and siteguid = s.siteguid
)
;

select product, siteguid, count(*) from r$d003_00001_stockcurrent
group by product, siteguid
having count(*) > 1
;

delete from r$d003_00001_stockcurrent
where product in (
'1bca65ca-dd79-454d-9c54-e733fb10bb02',
'38047ec6-dfa8-41bd-80e7-ff5294ae755d',
'd5a8e644-2ade-4ed5-af60-846c7cdc09b4',
'3e0413a8-77e6-46c6-814a-a9bfa4fd09cf',
'cedc68af-7b4e-4878-8ca6-7854779e44a0',
'e08cdbaa-628e-4a97-9dfd-64edb4704549',
'01b8af7a-d6df-487a-938d-ce6127ea334b'
)
;


select * from r$d003_00001_stockcurrent
where product in (
'd25ade5d-b0e3-4a89-a7fa-9cf395ac658a'
)
order by "r$_id"
;



select * from r$d005_stockcurrent
where product = 'xxx999_999xxx_x9x9x9'
;

select * from r$u003_00001_products
where id = 'xxx999_999xxx_x9x9x9'
;

select
;

create table t$_ffba_pos_repl_table as select * from ffba_pos_repl_table where pos_id = 0
;
select * from t$_ffba_pos_repl_table
;

select * from t$_ffba_pos_repl_table where id in (86, 114, 93, 70, 64)
;




	id varchar(255) NOT NULL,
	reference varchar(255) NOT NULL,
	code varchar(255) NOT NULL,
	codetype varchar(50) NULL,
	"name" varchar(255) NOT NULL,
	pricebuy float8 NOT NULL DEFAULT 0,
	pricesell float8 NOT NULL DEFAULT 0,
	category varchar(255) NOT NULL,
	taxcat varchar(255) NOT NULL,
	attributeset_id varchar(255) NULL,
	stockcost float8 NULL,
	stockvolume float8 NULL,
	iscom bool NOT NULL DEFAULT false,
	isscale bool NOT NULL DEFAULT false,
	iskitchen bool NOT NULL DEFAULT false,
	printkb bool NOT NULL DEFAULT false,
	sendstatus bool NOT NULL DEFAULT false,
	isservice bool NOT NULL DEFAULT false,
	display varchar(255) NULL,
	"attributes" bytea NULL,
	isvprice bool NOT NULL DEFAULT false,
	isverpatrib bool NOT NULL DEFAULT false,
	texttip varchar(255) NULL,
	warranty bool NOT NULL DEFAULT false,
	image bytea NULL,
	stockunits float8 NOT NULL DEFAULT 0,
	alias varchar(50) NULL,
	alwaysavailable bool NOT NULL DEFAULT false,
	discounted varchar(5) NULL DEFAULT 'no'::character varying,
	candiscount bool NOT NULL DEFAULT true,
	iscatalog bool NOT NULL DEFAULT true,
	catorder int4 NULL,
	ispack bool NOT NULL DEFAULT false,
	packquantity float8 NULL,
	packproduct varchar(255) NULL,
	promotionid varchar(50) NULL,
	allproducts bool NULL DEFAULT false,
	managestock bool NULL DEFAULT true,
	sflag bool NULL DEFAULT true,
	siteguid varchar(50) NOT NULL DEFAULT '4651ee81-b78c-49de-8bc2-66a297f7ee9f'::character varying,

	commission float8 NOT NULL DEFAULT 0,
	supplier varchar(50) NULL,
	defaultptr varchar(40) NULL DEFAULT '2'::character varying,
	remotedisplay bool NULL DEFAULT false,
	defaultscreen varchar(5) NULL DEFAULT '0'::character varying,
	preptime int4 NULL DEFAULT 0,
	averagecost numeric(12,3) NULL DEFAULT 0,
	ptroverride bool NULL DEFAULT false,




categories  2 0
products    1 +
stockcurrent    1 (all new)
resources   1
sharedtickets   2 (all new) -


select * from r$u003_00000_categories order by r$_id
;

select * from r$u003_00000_products order by r$_id
;

select * from r$d003_00001_products order by r$_id
;
SELECT setval('r$d003_00001_products_r$_id_seq', 211, true)
;
insert into r$d003_00001_products (
  id, reference, code, codetype, "name", pricebuy, pricesell, category, taxcat, attributeset_id, stockcost, stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, "attributes", isvprice, isverpatrib, texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog, catorder, ispack, packquantity, packproduct, promotionid, allproducts, managestock, siteguid, sflag, commission, defaultptr, remotedisplay, defaultscreen, preptime, averagecost, ptroverride, "r$_op", "r$_create_dt"
)
select
  id, reference, code, codetype, "name", pricebuy, pricesell, category, taxcat, attributeset_id, stockcost, stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, "attributes", isvprice, isverpatrib, texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog, catorder, ispack, packquantity, packproduct, promotionid, allproducts, managestock, siteguid, sflag, 0, 2, false, 1, 0, 0, false, 'U', now()
from
  r$d003_00001_products
;



select * from r$u003_00000_sharedtickets order by r$_id
;



select * from r$u003_00000_resources order by r$_id
;

;;;;;;;;;;

create role pos_00001 with login encrypted password 'elTApOspASsFoRrePl'
;
grant ffba_pos to pos_00001
;

create role pos_00002 with login encrypted password 'elTApOspASsFoRrePl'
;
create role pos_00003 with login encrypted password 'elTApOspASsFoRrePl'
;



;;;;;;;;;;
select * from ffba_pos_session
order by id desc
;
delete from ffba_pos_session
where id <= 6979
;
