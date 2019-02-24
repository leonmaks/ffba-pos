select * from ffba_pos order by ident
;
elta_00002 (2)
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
from r$u003_00002_products
group by category
;
5d575994-2e3a-4b87-bc49-176f247c92e7    122
ff69f552-2e4e-4c54-ac32-5a3e1db7ce1a    28
ab758c05-f5aa-40eb-b3d1-1c62d14c52d5    38
541a3c62-1082-4d0a-8cba-2980c9ad43c1    158
d9747fb6-a74c-4b1f-a363-ed0b6c7c789b    60

000 --> ff69f552-2e4e-4c54-ac32-5a3e1db7ce1a
;

select * from r$u003_00002_products
;


;;; SITEGUID ;;;;;;;;;;

select * from "r$u003_00002_siteguid"
;
    ffcf5815-b7ef-4b9b-bc8f-14f6f04c59e6
;


;;; PRODUCTS ;;;;;;;;;;

select * from r$u003_00002_products
;
    taxcat 180f06fd-2518-409a-8c67-50946156bd5b;
    siteguid ffcf5815-b7ef-4b9b-bc8f-14f6f04c59e6;

select * from r$d003_00002_products
;
select * from r$u003_00002_taxcategories
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
from r$d003_00003_products
group by category
;

update r$d003_00003_products set category = 'c107a00e-ecda-4306-a8d8-cb6bd7de3e66' where category = '000'
;

select count(*) from r$u003_00003_products
;
