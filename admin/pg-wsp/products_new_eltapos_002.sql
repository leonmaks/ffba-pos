DELETE
  products
  eltapos_001 (3)
;

siteguid:   87011394-b5a6-46bf-b332-ca2f78b569f1


select id from r$_products where siteguid = '99999'
EXCEPT
select id from r$_products where siteguid = '87011394-b5a6-46bf-b332-ca2f78b569f1'
;
'15868e11-68c4-4efb-8433-b11d2d62061e',
'd3729116-3a39-41d4-8a20-708d9ad3cf59',
'e1fc9de4-6082-48bb-8c11-5cb0767be376',
'82a90694-92b6-4cdd-905d-454f86af0fa9',
'0e0f5b40-d25d-466b-94f2-18308ca85810',
'e35ca979-9b8c-49e5-a88b-36a22f1e6519',
'03b15c73-2c1d-4ef9-a2b9-4cf62dcedb8c',
'16c550e7-f1ae-45a4-a4dd-7196c4628c14',
'e8d409e1-0c6f-4a96-94a0-72c361835273',
'018a4943-8bc9-4760-bb0c-152133dbd3e3',
'c402119e-ae09-43f8-82bb-88d269ca9360',
'cdfd1006-630a-4838-bd28-d18012efaaeb',
'fb47c59d-0d3f-4319-8a5e-b571ffd157e2',
'068325cf-4a73-4649-818c-51a40ee01619'
;

select max(r$_id) from r$d004_products
;

insert into r$d004_products (
  id, reference, code, codetype, "name", pricebuy, pricesell, category, taxcat, attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, "attributes", isvprice, isverpatrib,
  texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog, catorder, ispack,
  packquantity, packproduct, promotionid, allproducts, managestock, siteguid, sflag,
  r$_op, r$_create_dt
) select
  id, reference, code, codetype, "name", pricebuy, pricesell, category, taxcat, attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, "attributes", isvprice, isverpatrib,
  texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog, catorder, ispack,
  packquantity, packproduct, promotionid, allproducts, managestock, '87011394-b5a6-46bf-b332-ca2f78b569f1', sflag,
  'N', now()
from r$_products
where siteguid = '99999'
  and id in (
'15868e11-68c4-4efb-8433-b11d2d62061e',
'd3729116-3a39-41d4-8a20-708d9ad3cf59',
'e1fc9de4-6082-48bb-8c11-5cb0767be376',
'82a90694-92b6-4cdd-905d-454f86af0fa9',
'0e0f5b40-d25d-466b-94f2-18308ca85810',
'e35ca979-9b8c-49e5-a88b-36a22f1e6519',
'03b15c73-2c1d-4ef9-a2b9-4cf62dcedb8c',
'16c550e7-f1ae-45a4-a4dd-7196c4628c14',
'e8d409e1-0c6f-4a96-94a0-72c361835273',
'018a4943-8bc9-4760-bb0c-152133dbd3e3',
'c402119e-ae09-43f8-82bb-88d269ca9360',
'cdfd1006-630a-4838-bd28-d18012efaaeb',
'fb47c59d-0d3f-4319-8a5e-b571ffd157e2',
'068325cf-4a73-4649-818c-51a40ee01619'
  )
;
