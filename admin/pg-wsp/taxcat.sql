;;; taxcat ;;;

7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c

select taxcat, count(*)
from r$_products
where siteguid = '7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c'
group by taxcat
;
96c91776-059e-4d74-a919-05dab70658dd    78
;

select * from r$u003_00003_taxcategories
;
96c91776-059e-4d74-a919-05dab70658dd    Tax Exempt
cb8d9b64-0966-436c-a5ad-abe0543953e5    Tax Standard
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
    packquantity, packproduct, promotionid, allproducts, managestock, siteguid, sflag,
    commission, defaultptr, remotedisplay, defaultscreen, preptime, averagecost, ptroverride,
    'U', now()
from r$_products
where siteguid = '7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c'
    and taxcat = 'cb8d9b64-0966-436c-a5ad-abe0543953e5'
;
