;;; UPDATE ;;;


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
sc999-001
xxx999_999xxx_x9x9x9
d1fc239a-d1b7-4455-a37d-5b686a34c948
d25ade5d-b0e3-4a89-a7fa-9cf395ac658a
;


insert into r$d003_00003_products (
    id, reference, code, codetype, "name", pricebuy, pricesell, category, taxcat, attributeset_id, stockcost,
    stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, "attributes", isvprice, isverpatrib,
    texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog, catorder, ispack,
    packquantity, packproduct, promotionid, allproducts, managestock, siteguid, sflag,
    commission, defaultptr, remotedisplay, defaultscreen, preptime, averagecost, ptroverride,
    r$_op, r$_create_dt
) select
    id, reference, code, codetype, "name", pricebuy, pricesell, category, '96c91776-059e-4d74-a919-05dab70658dd', attributeset_id, stockcost,
    stockvolume, iscom, isscale, iskitchen, printkb, sendstatus, isservice, display, "attributes", isvprice, isverpatrib,
    texttip, warranty, image, stockunits, alias, alwaysavailable, discounted, candiscount, iscatalog, catorder, ispack,
    packquantity, packproduct, promotionid, allproducts, managestock, '7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c', sflag,
    0, 2, false, 1, 0, 0, false,
    'U', now()
from r$_products
where siteguid = '99999'
    and id in (
        'sc999-001',
        'xxx999_999xxx_x9x9x9',
        'd1fc239a-d1b7-4455-a37d-5b686a34c948',
        'd25ade5d-b0e3-4a89-a7fa-9cf395ac658a'
    )
;


update r$d003_00003_products set category = 'ff69f552-2e4e-4c54-ac32-5a3e1db7ce1a' where category = '000'
;
