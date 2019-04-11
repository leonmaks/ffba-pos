DOWN
  elta_00003
  id= 3
  siteguid= 7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c
from_
  eltapos_003
  id= 5
  siteguid= 34892ae3-3656-4601-92a3-16ba73b14dcb
;

select * from ffba_pos order by ident
;


;;; SOURCE ;;;;;;;;;;

select * from r$u005_products where r$_create_dt > '2019-02-01'
;

  categories    0
  products      287
  resources     1180
  stockcurrent  155

select category, count(*)
from r$u005_products
where r$_create_dt > '2019-02-01'
group by category
;
000 7
541a3c62-1082-4d0a-8cba-2980c9ad43c1    20
5d575994-2e3a-4b87-bc49-176f247c92e7    20
ab758c05-f5aa-40eb-b3d1-1c62d14c52d5    2
d9747fb6-a74c-4b1f-a363-ed0b6c7c789b    1
;

select category, count(*)
from r$u003_00003_products
group by category
;
d9747fb6-a74c-4b1f-a363-ed0b6c7c789b    30
c107a00e-ecda-4306-a8d8-cb6bd7de3e66    15
5d575994-2e3a-4b87-bc49-176f247c92e7    64
ab758c05-f5aa-40eb-b3d1-1c62d14c52d5    19
541a3c62-1082-4d0a-8cba-2980c9ad43c1    83

000 --> c107a00e-ecda-4306-a8d8-cb6bd7de3e66
;


;;; SITEGUID ;;;;;;;;;;

select * from "r$u003_00003_siteguid"
;
    7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c
;


;;; PRODUCTS ;;;;;;;;;;

select * from r$u003_00003_products
;
    taxcat cb8d9b64-0966-436c-a5ad-abe0543953e5;
    siteguid 7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c;


select * from r$d003_00003_products
;
select * from r$u003_00001_taxcategories
;

insert into r$d003_00003_products (
  id, reference, code, codetype, "name", pricebuy, pricesell, category, taxcat, attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, "attributes", isvprice,
  isverpatrib, texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog,
  catorder, ispack, packquantity, packproduct, promotionid, allproducts, managestock, siteguid, sflag, commission,
  defaultptr, remotedisplay, defaultscreen, preptime, averagecost, ptroverride, "r$_op", "r$_create_dt"
)
select
  id, reference, code, codetype, "name", pricebuy, pricesell, category, 'cb8d9b64-0966-436c-a5ad-abe0543953e5', attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, "attributes", isvprice,
  isverpatrib, texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog,
  catorder, ispack, packquantity, packproduct, promotionid, allproducts, managestock, '7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c', sflag, 0,
  2, false, 1, 0, 0, false, r$_op, now()
from
  r$u005_products
where
  r$_create_dt > '2019-02-01'
order by r$_id
;

select category, count(*)
from r$u003_00003_products
group by category
;

update r$d003_00003_products set category = 'c107a00e-ecda-4306-a8d8-cb6bd7de3e66' where category = '000'
;

select count(*) from r$u003_00003_products
;


select taxcat, count(*)
from r$u003_00003_products
group by taxcat
;



select * from "r$u003_00003_products"
where name = 'Пирожок с картошкой'
order by r$_id desc
;
select name, pricebuy, pricesell, r$_op
from "r$u003_00003_products"
where name = 'Пирожок с картошкой'
order by r$_id desc
;
