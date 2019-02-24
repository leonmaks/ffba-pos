DELETE
  products
  eltapos_001 (3)
;

siteguid:   2a502e42-f359-4174-8a5a-46118f4637a6
;

select id from r$_products where siteguid = '2a502e42-f359-4174-8a5a-46118f4637a6'
EXCEPT
select id from r$_products where siteguid = '99999'
;
5b757c0e-6499-421c-ba63-31344a048e7c
0b8343a2-3019-4974-a798-c164a82c978b
837fc139-002b-4c69-8bc0-80a08ca39b02
202f49b7-7ce1-4dfc-aca2-ce6ebbd0d738
964f757c-b05e-4332-bd4a-9314ec07fa90
e9b4513a-27ee-46c7-8188-48382ab5e599
6764a42b-6c7d-4fe1-8dab-319ee4420877
b6c4e858-d722-4834-99b5-703bc4cd49d6
7a0072be-3518-40f5-87fc-6e8d3d3526d1
500d0696-3123-4fa0-a260-963aa77c0119
d76c2ae6-117d-42cc-99fc-5ab7e90fd8ab
bfa45e01-9ac9-4633-9093-4c0a55aa7e8e
2f634aca-63ab-4924-aad5-bee53124a50a
28f9c7d8-4213-40e6-bd82-432387913fb5
b0ad7702-5035-4081-810e-4adbf86280a1
5a4cdd16-b10f-4646-bb75-8e9b13101eb8
f734365f-a402-48f7-963b-a33751e3f03e
a708466a-de17-48fd-98e7-d595f08bed7c
95ea1123-9b0c-4bd6-89dc-48c6bf6b30f2
f52ac4c3-cc47-4d7b-a7ac-88ccc94c7550
f63afd14-72f1-41bd-ad86-108bd29ad5ef
ae5ede00-0e7f-422a-bf1c-2f67ab802ae4
9a6ab7ca-7d14-4941-a2ca-a9f87177cc46
f812e201-a8f5-4356-b34f-700320e9c6d9
;


;;; stockcurrent ;;;

insert into r$d003_stockcurrent (
  location, product, attributesetinstance_id, units, sflag, siteguid, "r$_op", "r$_create_dt"
)
select
  location, product, attributesetinstance_id, units, sflag, siteguid, 'D', now()
from r$_stockcurrent
where siteguid = '2a502e42-f359-4174-8a5a-46118f4637a6'
  and product in (
    '5b757c0e-6499-421c-ba63-31344a048e7c',
    '0b8343a2-3019-4974-a798-c164a82c978b',
    '837fc139-002b-4c69-8bc0-80a08ca39b02',
    '202f49b7-7ce1-4dfc-aca2-ce6ebbd0d738',
    '964f757c-b05e-4332-bd4a-9314ec07fa90',
    'e9b4513a-27ee-46c7-8188-48382ab5e599',
    '6764a42b-6c7d-4fe1-8dab-319ee4420877',
    'b6c4e858-d722-4834-99b5-703bc4cd49d6',
    '7a0072be-3518-40f5-87fc-6e8d3d3526d1',
    '500d0696-3123-4fa0-a260-963aa77c0119',
    'd76c2ae6-117d-42cc-99fc-5ab7e90fd8ab',
    'bfa45e01-9ac9-4633-9093-4c0a55aa7e8e',
    '2f634aca-63ab-4924-aad5-bee53124a50a',
    '28f9c7d8-4213-40e6-bd82-432387913fb5',
    'b0ad7702-5035-4081-810e-4adbf86280a1',
    '5a4cdd16-b10f-4646-bb75-8e9b13101eb8',
    'f734365f-a402-48f7-963b-a33751e3f03e',
    'a708466a-de17-48fd-98e7-d595f08bed7c',
    '95ea1123-9b0c-4bd6-89dc-48c6bf6b30f2',
    'f52ac4c3-cc47-4d7b-a7ac-88ccc94c7550',
    'f63afd14-72f1-41bd-ad86-108bd29ad5ef',
    'ae5ede00-0e7f-422a-bf1c-2f67ab802ae4',
    '9a6ab7ca-7d14-4941-a2ca-a9f87177cc46',
    'f812e201-a8f5-4356-b34f-700320e9c6d9'
  )
;


;;; stockdiary ;;;

select * from r$d003_stockdiary
;

insert into r$d003_stockdiary (
  id, datenew, reason, location, product, attributesetinstance_id, units, price, appuser, siteguid, sflag, "r$_op", "r$_create_dt"
)
select
  id, datenew, reason, location, product, attributesetinstance_id, units, price, appuser, siteguid, sflag, 'D', now()
from r$_stockdiary
where siteguid = '2a502e42-f359-4174-8a5a-46118f4637a6'
  and product in (
    '5b757c0e-6499-421c-ba63-31344a048e7c',
    '0b8343a2-3019-4974-a798-c164a82c978b',
    '837fc139-002b-4c69-8bc0-80a08ca39b02',
    '202f49b7-7ce1-4dfc-aca2-ce6ebbd0d738',
    '964f757c-b05e-4332-bd4a-9314ec07fa90',
    'e9b4513a-27ee-46c7-8188-48382ab5e599',
    '6764a42b-6c7d-4fe1-8dab-319ee4420877',
    'b6c4e858-d722-4834-99b5-703bc4cd49d6',
    '7a0072be-3518-40f5-87fc-6e8d3d3526d1',
    '500d0696-3123-4fa0-a260-963aa77c0119',
    'd76c2ae6-117d-42cc-99fc-5ab7e90fd8ab',
    'bfa45e01-9ac9-4633-9093-4c0a55aa7e8e',
    '2f634aca-63ab-4924-aad5-bee53124a50a',
    '28f9c7d8-4213-40e6-bd82-432387913fb5',
    'b0ad7702-5035-4081-810e-4adbf86280a1',
    '5a4cdd16-b10f-4646-bb75-8e9b13101eb8',
    'f734365f-a402-48f7-963b-a33751e3f03e',
    'a708466a-de17-48fd-98e7-d595f08bed7c',
    '95ea1123-9b0c-4bd6-89dc-48c6bf6b30f2',
    'f52ac4c3-cc47-4d7b-a7ac-88ccc94c7550',
    'f63afd14-72f1-41bd-ad86-108bd29ad5ef',
    'ae5ede00-0e7f-422a-bf1c-2f67ab802ae4',
    '9a6ab7ca-7d14-4941-a2ca-a9f87177cc46',
    'f812e201-a8f5-4356-b34f-700320e9c6d9'
  )
;


;;; ticketlines ;;;

select max(r$_id) from r$d003_ticketlines
;

insert into r$d003_ticketlines (
  ticket, line, product, attributesetinstance_id, units, price, taxid, "attributes", refundqty, siteguid, sflag, "r$_op", "r$_create_dt"
)
select
  ticket, line, product, attributesetinstance_id, units, price, taxid, "attributes", refundqty, siteguid, sflag, 'D', now()
from r$_ticketlines
where siteguid = '2a502e42-f359-4174-8a5a-46118f4637a6'
  and product in (
    '5b757c0e-6499-421c-ba63-31344a048e7c',
    '0b8343a2-3019-4974-a798-c164a82c978b',
    '837fc139-002b-4c69-8bc0-80a08ca39b02',
    '202f49b7-7ce1-4dfc-aca2-ce6ebbd0d738',
    '964f757c-b05e-4332-bd4a-9314ec07fa90',
    'e9b4513a-27ee-46c7-8188-48382ab5e599',
    '6764a42b-6c7d-4fe1-8dab-319ee4420877',
    'b6c4e858-d722-4834-99b5-703bc4cd49d6',
    '7a0072be-3518-40f5-87fc-6e8d3d3526d1',
    '500d0696-3123-4fa0-a260-963aa77c0119',
    'd76c2ae6-117d-42cc-99fc-5ab7e90fd8ab',
    'bfa45e01-9ac9-4633-9093-4c0a55aa7e8e',
    '2f634aca-63ab-4924-aad5-bee53124a50a',
    '28f9c7d8-4213-40e6-bd82-432387913fb5',
    'b0ad7702-5035-4081-810e-4adbf86280a1',
    '5a4cdd16-b10f-4646-bb75-8e9b13101eb8',
    'f734365f-a402-48f7-963b-a33751e3f03e',
    'a708466a-de17-48fd-98e7-d595f08bed7c',
    '95ea1123-9b0c-4bd6-89dc-48c6bf6b30f2',
    'f52ac4c3-cc47-4d7b-a7ac-88ccc94c7550',
    'f63afd14-72f1-41bd-ad86-108bd29ad5ef',
    'ae5ede00-0e7f-422a-bf1c-2f67ab802ae4',
    '9a6ab7ca-7d14-4941-a2ca-a9f87177cc46',
    'f812e201-a8f5-4356-b34f-700320e9c6d9'
  )
;


select max(r$_id) from r$d003_products
;

select count(*) from r$d003_products;
select max(r$_id) from r$d003_products;

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
  packquantity, packproduct, promotionid, allproducts, managestock, siteguid, sflag,
  'D', now()
from r$_products
where siteguid = '2a502e42-f359-4174-8a5a-46118f4637a6'
  and id in (
    '5b757c0e-6499-421c-ba63-31344a048e7c',
    '0b8343a2-3019-4974-a798-c164a82c978b',
    '837fc139-002b-4c69-8bc0-80a08ca39b02',
    '202f49b7-7ce1-4dfc-aca2-ce6ebbd0d738',
    '964f757c-b05e-4332-bd4a-9314ec07fa90',
    'e9b4513a-27ee-46c7-8188-48382ab5e599',
    '6764a42b-6c7d-4fe1-8dab-319ee4420877',
    'b6c4e858-d722-4834-99b5-703bc4cd49d6',
    '7a0072be-3518-40f5-87fc-6e8d3d3526d1',
    '500d0696-3123-4fa0-a260-963aa77c0119',
    'd76c2ae6-117d-42cc-99fc-5ab7e90fd8ab',
    'bfa45e01-9ac9-4633-9093-4c0a55aa7e8e',
    '2f634aca-63ab-4924-aad5-bee53124a50a',
    '28f9c7d8-4213-40e6-bd82-432387913fb5',
    'b0ad7702-5035-4081-810e-4adbf86280a1',
    '5a4cdd16-b10f-4646-bb75-8e9b13101eb8',
    'f734365f-a402-48f7-963b-a33751e3f03e',
    'a708466a-de17-48fd-98e7-d595f08bed7c',
    '95ea1123-9b0c-4bd6-89dc-48c6bf6b30f2',
    'f52ac4c3-cc47-4d7b-a7ac-88ccc94c7550',
    'f63afd14-72f1-41bd-ad86-108bd29ad5ef',
    'ae5ede00-0e7f-422a-bf1c-2f67ab802ae4',
    '9a6ab7ca-7d14-4941-a2ca-a9f87177cc46',
    'f812e201-a8f5-4356-b34f-700320e9c6d9'
  )
;
