7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c

000 --> c107a00e-ecda-4306-a8d8-cb6bd7de3e66
;



;;; UPDATE ;;;

  REPLACE (category, '000', 'c107a00e-ecda-4306-a8d8-cb6bd7de3e66') category,
  '96c91776-059e-4d74-a919-05dab70658dd',
;

select
  id, reference, code, codetype, name, pricebuy, pricesell, category,
  attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, attributes, isvprice, isverpatrib,
  texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog, catorder, ispack,
  packquantity, packproduct, promotionid, allproducts, managestock, sflag,
commission, supplier, defaultptr, remotedisplay, defaultscreen, preptime, averagecost, ptroverride
from r$_products
where siteguid = '7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c'
EXCEPT
select
  id, reference, code, codetype, name, pricebuy, pricesell,
  category,
  attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, attributes, isvprice, isverpatrib,
  texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog, catorder, ispack,
  packquantity, packproduct, promotionid, allproducts, managestock, sflag,
commission, supplier, defaultptr, remotedisplay, defaultscreen, preptime, averagecost, ptroverride
from r$_products
where siteguid = 'ffcf5815-b7ef-4b9b-bc8f-14f6f04c59e6'
;

select * from r$_products where siteguid = '7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c';
select taxcat, count(*) from r$_products where siteguid = '7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c' group by taxcat;
select * from "r$_taxcategories" where siteguid = '7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c';

96c91776-059e-4d74-a919-05dab70658dd  Tax Exempt  7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c  true
cb8d9b64-0966-436c-a5ad-abe0543953e5  Tax Standard  7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c  true


select * from r$_categories where id = 'ff69f552-2e4e-4c54-ac32-5a3e1db7ce1a'
;

SELECT
id, reference, code, codetype, name, pricebuy, pricesell, category, taxcat,
attributeset_id, stockcost,
stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, attributes, isvprice, isverpatrib,
texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog, catorder, ispack,
packquantity, packproduct, promotionid, allproducts, managestock, sflag,
commission, supplier, defaultptr, remotedisplay, defaultscreen, preptime, averagecost, ptroverride
FROM r$_products 
WHERE id = '89117cc7-b695-40bb-b1bc-81c671c3a71b'
AND siteguid in ('7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c', 'ffcf5815-b7ef-4b9b-bc8f-14f6f04c59e6')
;

7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c  c107a00e-ecda-4306-a8d8-cb6bd7de3e66  96c91776-059e-4d74-a919-05dab70658dd
                                      c107a00e-ecda-4306-a8d8-cb6bd7de3e66  96c91776-059e-4d74-a919-05dab70658dd

ffcf5815-b7ef-4b9b-bc8f-14f6f04c59e6  ff69f552-2e4e-4c54-ac32-5a3e1db7ce1a  180f06fd-2518-409a-8c67-50946156bd5b
                                      ff69f552-2e4e-4c54-ac32-5a3e1db7ce1a  180f06fd-2518-409a-8c67-50946156bd5b
;

select * from "r$_taxcategories" where siteguid = 'ffcf5815-b7ef-4b9b-bc8f-14f6f04c59e6';



;;; DELETED ;;;

select id from r$_products where siteguid = '7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c'
EXCEPT
select id from r$_products where siteguid = '34892ae3-3656-4601-92a3-16ba73b14dcb'
;


;;; NEW ;;;

select id from r$_products where siteguid = '34892ae3-3656-4601-92a3-16ba73b14dcb'
EXCEPT
select id from r$_products where siteguid = '7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c'
;

select * from r$d003_00003_products order by r$_id;
select count(*) from r$d003_00003_products;

insert into r$d003_00003_products (
  id, reference, code, codetype, name, pricebuy, pricesell,
  category,
  taxcat, attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, attributes, isvprice, isverpatrib,
  texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog, catorder, ispack,
  packquantity, packproduct, promotionid, allproducts, managestock, siteguid, sflag,
  commission, defaultptr, remotedisplay, defaultscreen, preptime, averagecost, ptroverride,
  r$_op, r$_create_dt
)
select
  id, reference, code, codetype, name, pricebuy, pricesell,
  REPLACE (category, '000', 'c107a00e-ecda-4306-a8d8-cb6bd7de3e66') category,
  '96c91776-059e-4d74-a919-05dab70658dd', attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, attributes, isvprice, isverpatrib,
  texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog, catorder, ispack,
  packquantity, packproduct, promotionid, allproducts, managestock, '7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c', sflag,
  0, 2, false, 1, 0, 0, false,
  'N', now()
from r$_products
where siteguid = '34892ae3-3656-4601-92a3-16ba73b14dcb'
and id in (
'f9e13fda-a763-4018-9646-2c74f3c37444',
'8c5143eb-5aca-4034-8dc6-d89201d135c4',
'e2325e09-33b4-4bf7-80f1-eea01010383e',
'4f1765f5-2cfe-42f0-8264-3ec09d5b1261',
'263de228-d622-4d15-a5a3-74ea399f799f',
'fe602649-18a2-4b8f-8890-f41d02a08500',
'fe610bf3-9ddc-4b09-b414-72337499de51',
'0ac8bb91-fe7b-45a3-94fe-e0e13fabb08a',
'd434b38e-a492-439e-9106-761ce9c61665',
'31d645d5-848c-45cc-ae69-01a5f717973c',
'2af69e9a-40ba-4b95-b4a0-09dd51b3e99c',
'29e446b6-955a-4cb3-827e-a005f79bb648',
'483ecaa5-24e4-4b7d-8e7d-797a2c83c733',
'e35d28f4-1605-4ed0-8e35-607405026366',
'0c7c5a68-2f9a-4fbc-80c0-3927ad30cc36',
'a692d2cf-ea16-4467-ab2f-b1a04cc07e20',
'5395c0d0-e661-4deb-9ad1-f7d38bda7493',
'4bec2f69-77a4-45e9-b588-22df12698637',
'525072e9-e24d-4841-9584-8bd8c6d46bcf',
'b3a23ab3-e854-438e-a8d9-971ee235e167',
'0bbc54bf-b46e-4eff-b508-b77f3e1d74f1',
'7e6f829f-d3de-4101-bf02-0cbb2498d67f',
'7f53d342-f89e-4a99-b4dd-9ac33976dc32',
'e23c3d4e-969a-49ee-92de-3f61af735cc3',
'27177a64-6989-4e49-b57e-0d50a221bb8e'
)
;


select * from r$d003_00003_products order by r$_id;
select count(*) from r$d003_00003_products;

insert into r$d003_00003_products (
  id, reference, code, codetype, name, pricebuy, pricesell,
  category,
  taxcat, attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, attributes, isvprice, isverpatrib,
  texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog, catorder, ispack,
  packquantity, packproduct, promotionid, allproducts, managestock, siteguid, sflag,
  commission, defaultptr, remotedisplay, defaultscreen, preptime, averagecost, ptroverride,
  r$_op, r$_create_dt
)
select
  id, reference, code, codetype, name, pricebuy, pricesell,
  REPLACE (category, '000', 'c107a00e-ecda-4306-a8d8-cb6bd7de3e66') category,
  '96c91776-059e-4d74-a919-05dab70658dd', attributeset_id, stockcost,
  stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, attributes, isvprice, isverpatrib,
  texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog, catorder, ispack,
  packquantity, packproduct, promotionid, allproducts, managestock, '7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c', sflag,
  0, 2, false, 1, 0, 0, false,
  'U', now()
from r$_products
where siteguid = '34892ae3-3656-4601-92a3-16ba73b14dcb'
and id in (
'258a44f3-402e-4ae2-8ca0-08e3206ff733',
'b61b7d9f-53b3-4aba-9fbd-e86f3adaa7b7',
'018a4943-8bc9-4760-bb0c-152133dbd3e3',
'b67f8e21-99e4-4f5f-8bc3-7cbc485dac91',
'43c95c0a-3f5f-4e34-8bcf-06b7216e9510',
'e7c2c8a6-85f2-485e-81cc-02080a614fc0',
'e75e73a7-8bc6-4338-8ccb-ad5e7fb7ce62',
'b0b2a4f0-7a4f-405a-b656-5a0ec27796a2',
'd25ade5d-b0e3-4a89-a7fa-9cf395ac658a',
'dae500ce-caaf-4538-bff6-4f40d70fccef',
'03b15c73-2c1d-4ef9-a2b9-4cf62dcedb8c',
'68b76b23-2235-463d-b905-4da77ad5a45c',
'd3729116-3a39-41d4-8a20-708d9ad3cf59',
'39cdbd34-c0f0-4a98-9872-6282f77844a2',
'52217ce0-8d84-4b30-8d54-825286bfbb31',
'0e66afe6-6e9a-4fa0-b7ad-1ed8307b5433',
'80368e9e-1dbd-4b6c-ab11-bac3bf53e581',
'0e0f5b40-d25d-466b-94f2-18308ca85810',
'39a63226-b22c-431d-91e4-9e8eefce28d7',
'1c418ee4-a96a-407d-a717-417fbdd69748',
'e7949cbe-0af1-4f35-9a32-b2b4a0f66617',
'251c3262-541d-4fab-b80d-4e4dc6051932',
'068325cf-4a73-4649-818c-51a40ee01619',
'd8f88937-d90b-4149-af6f-5474920f0ab2',
'd1fc239a-d1b7-4455-a37d-5b686a34c948',
'66a35193-9ae6-4723-8675-a070e96d807b',
'89117cc7-b695-40bb-b1bc-81c671c3a71b',
'e276cb7f-3d2e-4f19-989c-8bf7a126f9c5'
)
;


select taxcat, count(*)
from r$_products
where id = 'abbb9c37-ecb3-44ed-9e44-c3ccf375a0ea'
and siteguid in ('7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c', '34892ae3-3656-4601-92a3-16ba73b14dcb')
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

select taxcat, count(*) from r$_products where siteguid='7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c' group by taxcat;
select * from r$u003_00003_products order by "r$_id";

select id from r$_taxcategories where siteguid = 'ffcf5815-b7ef-4b9b-bc8f-14f6f04c59e6' and name = 'Tax Exempt';


SELECT id,reference,code,codetype,name,pricebuy,pricesell,
REPLACE (category, '000', 'ff69f552-2e4e-4c54-ac32-5a3e1db7ce1a') category,
REPLACE (taxcat, '000', '180f06fd-2518-409a-8c67-50946156bd5b') taxcat,
attributeset_id,stockcost,stockvolume,iscom,isscale,iskitchen,printkb,sendstatus, isservice,display,attributes,isvprice,isverpatrib,texttip,
warranty,image,stockunits, alias,alwaysavailable,discounted,candiscount,iscatalog,catorder,ispack,packquantity, packproduct,promotionid,
allproducts,managestock,sflag
FROM r$_products
WHERE siteguid = '34892ae3-3656-4601-92a3-16ba73b14dcb'
EXCEPT
SELECT id,reference,code,codetype,name,pricebuy,pricesell,category,taxcat, attributeset_id,stockcost,stockvolume,iscom,isscale,iskitchen,printkb,
sendstatus, isservice,display,attributes,isvprice,isverpatrib,texttip,warranty,image,stockunits, alias,alwaysavailable,discounted,candiscount,
iscatalog,catorder,ispack,packquantity, packproduct,promotionid,allproducts,managestock,sflag 
FROM r$_products 
WHERE siteguid = 'ffcf5815-b7ef-4b9b-bc8f-14f6f04c59e6'
;

SELECT id,reference,code,codetype,name,pricebuy,pricesell,category,taxcat,attributeset_id,stockcost,stockvolume,iscom,isscale,iskitchen,printkb,
sendstatus, isservice,display,attributes,isvprice,isverpatrib,texttip,warranty,image,stockunits,alias,alwaysavailable,discounted,candiscount,
iscatalog,catorder,ispack,packquantity,packproduct,promotionid,allproducts,managestock,sflag,
commission, supplier, defaultptr, remotedisplay, defaultscreen, preptime, averagecost, ptroverride
FROM r$_products 
WHERE id = 'd3729116-3a39-41d4-8a20-708d9ad3cf59'
AND siteguid in ('7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c', '34892ae3-3656-4601-92a3-16ba73b14dcb')
;

SELECT id, reference, code, codetype, name, pricebuy, pricesell, 
REPLACE (category, '000', 'c107a00e-ecda-4306-a8d8-cb6bd7de3e66') category, 
REPLACE (taxcat, '000', '96c91776-059e-4d74-a919-05dab70658dd') taxcat, attributeset_id, stockcost, stockvolume, iscom, isscale, iskitchen, printkb, 
sendstatus, isservice, display, attributes, isvprice, isverpatrib, texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, 
iscatalog, catorder, ispack, packquantity, packproduct, promotionid, allproducts, managestock, sflag,
commission, supplier, defaultptr, remotedisplay, defaultscreen, preptime, averagecost, ptroverride
FROM r$_products 
WHERE siteguid = '34892ae3-3656-4601-92a3-16ba73b14dcb' 
AND name not in ('***', 'Service Charge') 
EXCEPT 
SELECT id, reference, code, codetype, name, pricebuy, pricesell, category, taxcat, attributeset_id, stockcost, stockvolume, iscom, isscale, iskitchen, printkb, 
sendstatus, isservice, display, attributes, isvprice, isverpatrib, texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog, 
catorder, ispack, packquantity, packproduct, promotionid, allproducts, managestock, sflag,
commission, supplier, defaultptr, remotedisplay, defaultscreen, preptime, averagecost, ptroverride
FROM r$_products 
WHERE siteguid = '7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c'
;


,
commission, supplier, defaultptr, remotedisplay, defaultscreen, preptime, averagecost, ptroverride
;

select * from r$d004_products where id = '483ecaa5-24e4-4b7d-8e7d-797a2c83c733';
select * from r$d004_products where "r$_create_dt" >= '2019-04-06';
select * from r$d004_products;

select * from r$_products where siteguid = '87011394-b5a6-46bf-b332-ca2f78b569f1' and id in (
select id from r$d004_products where "r$_create_dt" >= '2019-04-06' and r$_op = 'N'
)
;

INSERT INTO r$d004_products (
id, reference, code, codetype, name, pricebuy, pricesell, category, taxcat, attributeset_id, stockcost, stockvolume,
iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, attributes, isvprice, isverpatrib, texttip, warranty,
image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog, catorder, ispack, packquantity, packproduct,
promotionid, allproducts, managestock, siteguid, sflag, r$_op, r$_create_dt ) 
SELECT id, reference, code, codetype, name, pricebuy, pricesell, REPLACE (category, '000', '000') category, REPLACE (taxcat, '000', '000') taxcat,
attributeset_id, stockcost, stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, attributes,
isvprice, isverpatrib, texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount,
iscatalog, catorder, ispack, packquantity, packproduct, promotionid, allproducts, managestock, '87011394-b5a6-46bf-b332-ca2f78b569f1', sflag, 'N', now()
FROM r$_products
WHERE id in ('f9e13fda-a763-4018-9646-2c74f3c37444','8c5143eb-5aca-4034-8dc6-d89201d135c4','e2325e09-33b4-4bf7-80f1-eea01010383e',
'4f1765f5-2cfe-42f0-8264-3ec09d5b1261','263de228-d622-4d15-a5a3-74ea399f799f','fe602649-18a2-4b8f-8890-f41d02a08500',
'fe610bf3-9ddc-4b09-b414-72337499de51','0ac8bb91-fe7b-45a3-94fe-e0e13fabb08a','d434b38e-a492-439e-9106-761ce9c61665',
'31d645d5-848c-45cc-ae69-01a5f717973c','2af69e9a-40ba-4b95-b4a0-09dd51b3e99c','29e446b6-955a-4cb3-827e-a005f79bb648',
'483ecaa5-24e4-4b7d-8e7d-797a2c83c733','e35d28f4-1605-4ed0-8e35-607405026366','0c7c5a68-2f9a-4fbc-80c0-3927ad30cc36',
'a692d2cf-ea16-4467-ab2f-b1a04cc07e20','5395c0d0-e661-4deb-9ad1-f7d38bda7493','4bec2f69-77a4-45e9-b588-22df12698637',
'525072e9-e24d-4841-9584-8bd8c6d46bcf','b3a23ab3-e854-438e-a8d9-971ee235e167','0bbc54bf-b46e-4eff-b508-b77f3e1d74f1',
'7e6f829f-d3de-4101-bf02-0cbb2498d67f','7f53d342-f89e-4a99-b4dd-9ac33976dc32','e23c3d4e-969a-49ee-92de-3f61af735cc3',
'27177a64-6989-4e49-b57e-0d50a221bb8e')
AND siteguid = '34892ae3-3656-4601-92a3-16ba73b14dcb'
;