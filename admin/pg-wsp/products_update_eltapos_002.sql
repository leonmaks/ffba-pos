UPDATE
  products
  eltapos_002 (4)
;

siteguid:   87011394-b5a6-46bf-b332-ca2f78b569f1


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
  siteguid = '87011394-b5a6-46bf-b332-ca2f78b569f1'
;
'xxx999_999xxx_x9x9x9',
'b61b7d9f-53b3-4aba-9fbd-e86f3adaa7b7',
'1c418ee4-a96a-407d-a717-417fbdd69748',
'285e52e3-683d-4237-9a8d-258c9f55e00e',
'b67f8e21-99e4-4f5f-8bc3-7cbc485dac91',
'b3792191-dede-4d04-84e2-8b881b378ff7',
'd25ade5d-b0e3-4a89-a7fa-9cf395ac658a',
'b0b2a4f0-7a4f-405a-b656-5a0ec27796a2',
'80368e9e-1dbd-4b6c-ab11-bac3bf53e581',
'39cdbd34-c0f0-4a98-9872-6282f77844a2',
'251c3262-541d-4fab-b80d-4e4dc6051932',
'39a63226-b22c-431d-91e4-9e8eefce28d7',
'e75e73a7-8bc6-4338-8ccb-ad5e7fb7ce62',
'89117cc7-b695-40bb-b1bc-81c671c3a71b',
'66a35193-9ae6-4723-8675-a070e96d807b',
'e276cb7f-3d2e-4f19-989c-8bf7a126f9c5',
'258a44f3-402e-4ae2-8ca0-08e3206ff733',
'e7c2c8a6-85f2-485e-81cc-02080a614fc0',
'd8f88937-d90b-4149-af6f-5474920f0ab2',
'e7949cbe-0af1-4f35-9a32-b2b4a0f66617',
'68b76b23-2235-463d-b905-4da77ad5a45c',
'0e66afe6-6e9a-4fa0-b7ad-1ed8307b5433'
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
  'U', now()
from r$_products
where siteguid = '99999'
  and id in (
'xxx999_999xxx_x9x9x9',
'b61b7d9f-53b3-4aba-9fbd-e86f3adaa7b7',
'1c418ee4-a96a-407d-a717-417fbdd69748',
'285e52e3-683d-4237-9a8d-258c9f55e00e',
'b67f8e21-99e4-4f5f-8bc3-7cbc485dac91',
'b3792191-dede-4d04-84e2-8b881b378ff7',
'd25ade5d-b0e3-4a89-a7fa-9cf395ac658a',
'b0b2a4f0-7a4f-405a-b656-5a0ec27796a2',
'80368e9e-1dbd-4b6c-ab11-bac3bf53e581',
'39cdbd34-c0f0-4a98-9872-6282f77844a2',
'251c3262-541d-4fab-b80d-4e4dc6051932',
'39a63226-b22c-431d-91e4-9e8eefce28d7',
'e75e73a7-8bc6-4338-8ccb-ad5e7fb7ce62',
'89117cc7-b695-40bb-b1bc-81c671c3a71b',
'66a35193-9ae6-4723-8675-a070e96d807b',
'e276cb7f-3d2e-4f19-989c-8bf7a126f9c5',
'258a44f3-402e-4ae2-8ca0-08e3206ff733',
'e7c2c8a6-85f2-485e-81cc-02080a614fc0',
'd8f88937-d90b-4149-af6f-5474920f0ab2',
'e7949cbe-0af1-4f35-9a32-b2b4a0f66617',
'68b76b23-2235-463d-b905-4da77ad5a45c',
'0e66afe6-6e9a-4fa0-b7ad-1ed8307b5433'
  )
;
