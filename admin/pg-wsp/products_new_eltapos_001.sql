DELETE
  products
  eltapos_001 (3)
;

siteguid:   2a502e42-f359-4174-8a5a-46118f4637a6


select id from r$_products where siteguid = '99999'
EXCEPT
select id from r$_products where siteguid = '2a502e42-f359-4174-8a5a-46118f4637a6'
;
d3729116-3a39-41d4-8a20-708d9ad3cf59
0e0f5b40-d25d-466b-94f2-18308ca85810
03b15c73-2c1d-4ef9-a2b9-4cf62dcedb8c
e8d409e1-0c6f-4a96-94a0-72c361835273
018a4943-8bc9-4760-bb0c-152133dbd3e3
c402119e-ae09-43f8-82bb-88d269ca9360
cdfd1006-630a-4838-bd28-d18012efaaeb
fb47c59d-0d3f-4319-8a5e-b571ffd157e2
068325cf-4a73-4649-818c-51a40ee01619
;

select max(r$_id) from r$d003_products
;

insert into r$d003_products (
  id, reference, code, codetype, "name", pricebuy, pricesell, category, taxcat, attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, "attributes", isvprice, isverpatrib,
  texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog, catorder, ispack,
  packquantity, packproduct, promotionid, allproducts, managestock, siteguid, sflag,
  r$_op, r$_create_dt
) select
  id, reference, code, codetype, "name", pricebuy, pricesell, category, taxcat, attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, "attributes", isvprice, isverpatrib,
  texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog, catorder, ispack,
  packquantity, packproduct, promotionid, allproducts, managestock, '2a502e42-f359-4174-8a5a-46118f4637a6', sflag,
  'N', now()
from r$_products
where siteguid = '99999'
  and id in (
'd3729116-3a39-41d4-8a20-708d9ad3cf59',
'0e0f5b40-d25d-466b-94f2-18308ca85810',
'03b15c73-2c1d-4ef9-a2b9-4cf62dcedb8c',
'e8d409e1-0c6f-4a96-94a0-72c361835273',
'018a4943-8bc9-4760-bb0c-152133dbd3e3',
'c402119e-ae09-43f8-82bb-88d269ca9360',
'cdfd1006-630a-4838-bd28-d18012efaaeb',
'fb47c59d-0d3f-4319-8a5e-b571ffd157e2',
'068325cf-4a73-4649-818c-51a40ee01619'
  )
;
