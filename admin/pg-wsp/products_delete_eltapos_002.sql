DELETE
  products
  eltapos_002 (4)
;

siteguid:   87011394-b5a6-46bf-b332-ca2f78b569f1
;

select id from r$_products where siteguid = '87011394-b5a6-46bf-b332-ca2f78b569f1'
EXCEPT
select id from r$_products where siteguid = '99999'
;
76b70f5e-c305-4027-8e1b-1005f2d32945
244e3a41-9288-4b94-9948-5f034c6fc147
5b757c0e-6499-421c-ba63-31344a048e7c
3b73e029-f379-49fe-8808-3cdea992560d
837fc139-002b-4c69-8bc0-80a08ca39b02
202f49b7-7ce1-4dfc-aca2-ce6ebbd0d738
e9b4513a-27ee-46c7-8188-48382ab5e599
6764a42b-6c7d-4fe1-8dab-319ee4420877
b6c4e858-d722-4834-99b5-703bc4cd49d6
500d0696-3123-4fa0-a260-963aa77c0119
bfa45e01-9ac9-4633-9093-4c0a55aa7e8e
2f634aca-63ab-4924-aad5-bee53124a50a
6d3e7266-f5f7-4eb1-8553-6e09b2cff6e7
28f9c7d8-4213-40e6-bd82-432387913fb5
b0ad7702-5035-4081-810e-4adbf86280a1
653c28ac-213c-4372-b670-dc9c3427ea8f
5a4cdd16-b10f-4646-bb75-8e9b13101eb8
faf90016-8cd9-4af0-a0bc-430eb22d84eb
a708466a-de17-48fd-98e7-d595f08bed7c
95ea1123-9b0c-4bd6-89dc-48c6bf6b30f2
41147ca9-6934-4155-9280-6b54474309e5
2b1f6eba-ff24-4a5f-8b79-1ec0da89ef3e
519faa03-e890-4306-8bc8-d16233961c06
adc2ce57-b972-4078-a4bf-6df1ce511fe1
f63afd14-72f1-41bd-ad86-108bd29ad5ef
94f2be7c-5298-4fcc-8f3d-1ae5e8d2915b
ae5ede00-0e7f-422a-bf1c-2f67ab802ae4
;


;;; stockcurrent ;;;

select max(r$_id) from r$d004_stockcurrent
;

insert into r$d004_stockcurrent (
  location, product, attributesetinstance_id, units, sflag, siteguid, "r$_op", "r$_create_dt"
)
select
  location, product, attributesetinstance_id, units, sflag, siteguid, 'D', now()
from r$_stockcurrent
where siteguid = '87011394-b5a6-46bf-b332-ca2f78b569f1'
  and product in (
'76b70f5e-c305-4027-8e1b-1005f2d32945',
'244e3a41-9288-4b94-9948-5f034c6fc147',
'5b757c0e-6499-421c-ba63-31344a048e7c',
'3b73e029-f379-49fe-8808-3cdea992560d',
'837fc139-002b-4c69-8bc0-80a08ca39b02',
'202f49b7-7ce1-4dfc-aca2-ce6ebbd0d738',
'e9b4513a-27ee-46c7-8188-48382ab5e599',
'6764a42b-6c7d-4fe1-8dab-319ee4420877',
'b6c4e858-d722-4834-99b5-703bc4cd49d6',
'500d0696-3123-4fa0-a260-963aa77c0119',
'bfa45e01-9ac9-4633-9093-4c0a55aa7e8e',
'2f634aca-63ab-4924-aad5-bee53124a50a',
'6d3e7266-f5f7-4eb1-8553-6e09b2cff6e7',
'28f9c7d8-4213-40e6-bd82-432387913fb5',
'b0ad7702-5035-4081-810e-4adbf86280a1',
'653c28ac-213c-4372-b670-dc9c3427ea8f',
'5a4cdd16-b10f-4646-bb75-8e9b13101eb8',
'faf90016-8cd9-4af0-a0bc-430eb22d84eb',
'a708466a-de17-48fd-98e7-d595f08bed7c',
'95ea1123-9b0c-4bd6-89dc-48c6bf6b30f2',
'41147ca9-6934-4155-9280-6b54474309e5',
'2b1f6eba-ff24-4a5f-8b79-1ec0da89ef3e',
'519faa03-e890-4306-8bc8-d16233961c06',
'adc2ce57-b972-4078-a4bf-6df1ce511fe1',
'f63afd14-72f1-41bd-ad86-108bd29ad5ef',
'94f2be7c-5298-4fcc-8f3d-1ae5e8d2915b',
'ae5ede00-0e7f-422a-bf1c-2f67ab802ae4'
  )
;


;;; stockdiary ;;;

select count(*), max(r$_id) from r$d004_stockdiary
;

insert into r$d004_stockdiary (
  id, datenew, reason, location, product, attributesetinstance_id, units, price, appuser, siteguid, sflag, "r$_op", "r$_create_dt"
)
select
  id, datenew, reason, location, product, attributesetinstance_id, units, price, appuser, siteguid, sflag, 'D', now()
from r$_stockdiary
where siteguid = '87011394-b5a6-46bf-b332-ca2f78b569f1'
  and product in (
'76b70f5e-c305-4027-8e1b-1005f2d32945',
'244e3a41-9288-4b94-9948-5f034c6fc147',
'5b757c0e-6499-421c-ba63-31344a048e7c',
'3b73e029-f379-49fe-8808-3cdea992560d',
'837fc139-002b-4c69-8bc0-80a08ca39b02',
'202f49b7-7ce1-4dfc-aca2-ce6ebbd0d738',
'e9b4513a-27ee-46c7-8188-48382ab5e599',
'6764a42b-6c7d-4fe1-8dab-319ee4420877',
'b6c4e858-d722-4834-99b5-703bc4cd49d6',
'500d0696-3123-4fa0-a260-963aa77c0119',
'bfa45e01-9ac9-4633-9093-4c0a55aa7e8e',
'2f634aca-63ab-4924-aad5-bee53124a50a',
'6d3e7266-f5f7-4eb1-8553-6e09b2cff6e7',
'28f9c7d8-4213-40e6-bd82-432387913fb5',
'b0ad7702-5035-4081-810e-4adbf86280a1',
'653c28ac-213c-4372-b670-dc9c3427ea8f',
'5a4cdd16-b10f-4646-bb75-8e9b13101eb8',
'faf90016-8cd9-4af0-a0bc-430eb22d84eb',
'a708466a-de17-48fd-98e7-d595f08bed7c',
'95ea1123-9b0c-4bd6-89dc-48c6bf6b30f2',
'41147ca9-6934-4155-9280-6b54474309e5',
'2b1f6eba-ff24-4a5f-8b79-1ec0da89ef3e',
'519faa03-e890-4306-8bc8-d16233961c06',
'adc2ce57-b972-4078-a4bf-6df1ce511fe1',
'f63afd14-72f1-41bd-ad86-108bd29ad5ef',
'94f2be7c-5298-4fcc-8f3d-1ae5e8d2915b',
'ae5ede00-0e7f-422a-bf1c-2f67ab802ae4'
  )
;


;;; ticketlines ;;;

select max(r$_id) from r$d004_ticketlines
;

insert into r$d004_ticketlines (
  ticket, line, product, attributesetinstance_id, units, price, taxid, "attributes", refundqty, siteguid, sflag, "r$_op", "r$_create_dt"
)
select
  ticket, line, product, attributesetinstance_id, units, price, taxid, "attributes", refundqty, siteguid, sflag, 'D', now()
from r$_ticketlines
where siteguid = '87011394-b5a6-46bf-b332-ca2f78b569f1'
  and product in (
'76b70f5e-c305-4027-8e1b-1005f2d32945',
'244e3a41-9288-4b94-9948-5f034c6fc147',
'5b757c0e-6499-421c-ba63-31344a048e7c',
'3b73e029-f379-49fe-8808-3cdea992560d',
'837fc139-002b-4c69-8bc0-80a08ca39b02',
'202f49b7-7ce1-4dfc-aca2-ce6ebbd0d738',
'e9b4513a-27ee-46c7-8188-48382ab5e599',
'6764a42b-6c7d-4fe1-8dab-319ee4420877',
'b6c4e858-d722-4834-99b5-703bc4cd49d6',
'500d0696-3123-4fa0-a260-963aa77c0119',
'bfa45e01-9ac9-4633-9093-4c0a55aa7e8e',
'2f634aca-63ab-4924-aad5-bee53124a50a',
'6d3e7266-f5f7-4eb1-8553-6e09b2cff6e7',
'28f9c7d8-4213-40e6-bd82-432387913fb5',
'b0ad7702-5035-4081-810e-4adbf86280a1',
'653c28ac-213c-4372-b670-dc9c3427ea8f',
'5a4cdd16-b10f-4646-bb75-8e9b13101eb8',
'faf90016-8cd9-4af0-a0bc-430eb22d84eb',
'a708466a-de17-48fd-98e7-d595f08bed7c',
'95ea1123-9b0c-4bd6-89dc-48c6bf6b30f2',
'41147ca9-6934-4155-9280-6b54474309e5',
'2b1f6eba-ff24-4a5f-8b79-1ec0da89ef3e',
'519faa03-e890-4306-8bc8-d16233961c06',
'adc2ce57-b972-4078-a4bf-6df1ce511fe1',
'f63afd14-72f1-41bd-ad86-108bd29ad5ef',
'94f2be7c-5298-4fcc-8f3d-1ae5e8d2915b',
'ae5ede00-0e7f-422a-bf1c-2f67ab802ae4'
  )
;


;;; products ;;;

select max(r$_id) from r$d004_products
;

select count(*) from r$d004_products;

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
    packquantity, packproduct, promotionid, allproducts, managestock, siteguid, sflag,
    'D', now()
from r$_products
where siteguid = '87011394-b5a6-46bf-b332-ca2f78b569f1'
  and id in (
'76b70f5e-c305-4027-8e1b-1005f2d32945',
'244e3a41-9288-4b94-9948-5f034c6fc147',
'5b757c0e-6499-421c-ba63-31344a048e7c',
'3b73e029-f379-49fe-8808-3cdea992560d',
'837fc139-002b-4c69-8bc0-80a08ca39b02',
'202f49b7-7ce1-4dfc-aca2-ce6ebbd0d738',
'e9b4513a-27ee-46c7-8188-48382ab5e599',
'6764a42b-6c7d-4fe1-8dab-319ee4420877',
'b6c4e858-d722-4834-99b5-703bc4cd49d6',
'500d0696-3123-4fa0-a260-963aa77c0119',
'bfa45e01-9ac9-4633-9093-4c0a55aa7e8e',
'2f634aca-63ab-4924-aad5-bee53124a50a',
'6d3e7266-f5f7-4eb1-8553-6e09b2cff6e7',
'28f9c7d8-4213-40e6-bd82-432387913fb5',
'b0ad7702-5035-4081-810e-4adbf86280a1',
'653c28ac-213c-4372-b670-dc9c3427ea8f',
'5a4cdd16-b10f-4646-bb75-8e9b13101eb8',
'faf90016-8cd9-4af0-a0bc-430eb22d84eb',
'a708466a-de17-48fd-98e7-d595f08bed7c',
'95ea1123-9b0c-4bd6-89dc-48c6bf6b30f2',
'41147ca9-6934-4155-9280-6b54474309e5',
'2b1f6eba-ff24-4a5f-8b79-1ec0da89ef3e',
'519faa03-e890-4306-8bc8-d16233961c06',
'adc2ce57-b972-4078-a4bf-6df1ce511fe1',
'f63afd14-72f1-41bd-ad86-108bd29ad5ef',
'94f2be7c-5298-4fcc-8f3d-1ae5e8d2915b',
'ae5ede00-0e7f-422a-bf1c-2f67ab802ae4'
  )
;
