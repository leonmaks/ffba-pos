select * from ffba_cashreg
order by identity
;
ELTAPOS_003 (5 - legacy);


;;; SOURCE ;;;;;;;;;;

select * from r$u005_products where r$_create_dt > '2019-02-01'
;

  categories    0
  products      287
  resources     1180
  stockcurrent  155


;;; SITEGUID ;;;;;;;;;;

eltapos_001 (3);
select * from "r$u003_siteguid";
    2a502e42-f359-4174-8a5a-46118f4637a6
;


;;; PRODUCTS ;;;;;;;;;;

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
SELECT setval('r$d003_products_r$_id_seq', 211, true)
;
