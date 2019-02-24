select * from ffba_pos order by ident
;
ELTA_00001 (1)
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

000 --> 7a54531a-4512-4358-9851-fbef6d50d60d
;

select category, count(*)
from r$u003_00001_products
group by category
;


;;; SITEGUID ;;;;;;;;;;

select * from "r$u003_00001_siteguid"
;
    2da8b8e5-7a47-4f1f-a950-ec140dc87a72
;


;;; PRODUCTS ;;;;;;;;;;

select * from r$u003_00001_products
;
    taxcat 0a882dd6-1fd9-43b6-bb78-9f337aff9551;
    siteguid 2da8b8e5-7a47-4f1f-a950-ec140dc87a72;


select * from r$d003_00001_products
;
select * from r$u003_00001_taxcategories
;

insert into r$d003_00001_products (
  id, reference, code, codetype, "name", pricebuy, pricesell, category, taxcat, attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, "attributes", isvprice,
  isverpatrib, texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog,
  catorder, ispack, packquantity, packproduct, promotionid, allproducts, managestock, siteguid, sflag, commission,
  defaultptr, remotedisplay, defaultscreen, preptime, averagecost, ptroverride, "r$_op", "r$_create_dt"
)
select
  id, reference, code, codetype, "name", pricebuy, pricesell, category, '0a882dd6-1fd9-43b6-bb78-9f337aff9551', attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, "attributes", isvprice,
  isverpatrib, texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog,
  catorder, ispack, packquantity, packproduct, promotionid, allproducts, managestock, '2da8b8e5-7a47-4f1f-a950-ec140dc87a72', sflag, 0,
  2, false, 1, 0, 0, false, r$_op, now()
from
  r$u005_products
where
  r$_create_dt > '2019-02-01'
order by r$_id
;

select category, count(*)
from r$d003_00001_products
group by category
;

update r$d003_00001_products set category = '7a54531a-4512-4358-9851-fbef6d50d60d' where category = '000'
;
