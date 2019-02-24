siteguid = '34892ae3-3656-4601-92a3-16ba73b14dcb'
;

select id from r$_products where siteguid = '34892ae3-3656-4601-92a3-16ba73b14dcb'
EXCEPT
select id from r$_products where siteguid = '99999'
;

select *
from r$_products
where id = '263de228-d622-4d15-a5a3-74ea399f799f'
  and siteguid = '34892ae3-3656-4601-92a3-16ba73b14dcb'
;


select id from r$_products where siteguid = '99999'
EXCEPT
select id from r$_products where siteguid = '34892ae3-3656-4601-92a3-16ba73b14dcb'
;


select
  id, reference, code, codetype, "name", pricebuy, pricesell, category, taxcat, attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, "attributes", isvprice, isverpatrib,
  texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog, catorder, ispack,
  packquantity, packproduct, promotionid, allproducts, managestock, sflag
from
  r$_products
where
  siteguid = '99999'
EXCEPT
select
  id, reference, code, codetype, "name", pricebuy, pricesell, category, taxcat, attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, "attributes", isvprice, isverpatrib,
  texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog, catorder, ispack,
  packquantity, packproduct, promotionid, allproducts, managestock, sflag
from
  r$_products
where
  siteguid = '34892ae3-3656-4601-92a3-16ba73b14dcb'
;
