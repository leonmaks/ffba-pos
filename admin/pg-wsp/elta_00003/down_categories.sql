;;; CATEGORIES ;;;

elta_00001 (1) 2da8b8e5-7a47-4f1f-a950-ec140dc87a72   000 --> 7a54531a-4512-4358-9851-fbef6d50d60d
elta_00002 (2) ffcf5815-b7ef-4b9b-bc8f-14f6f04c59e6   000 --> ff69f552-2e4e-4c54-ac32-5a3e1db7ce1a
elta_00003 (3) 7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c   000 --> c107a00e-ecda-4306-a8d8-cb6bd7de3e66
   << from eltapos_003 (5) 34892ae3-3656-4601-92a3-16ba73b14dcb
;


select * from r$_categories where siteguid = '2da8b8e5-7a47-4f1f-a950-ec140dc87a72' and name = 'Хлеб';
select * from r$_categories;

SELECT REPLACE (id, '000', '7a54531a-4512-4358-9851-fbef6d50d60d') id FROM r$_categories WHERE siteguid = '34892ae3-3656-4601-92a3-16ba73b14dcb'
EXCEPT
SELECT id FROM r$_categories WHERE siteguid = '2da8b8e5-7a47-4f1f-a950-ec140dc87a72'
;
SELECT REPLACE (id, '000', '7a54531a-4512-4358-9851-fbef6d50d60d') id, * FROM r$_categories WHERE siteguid = '34892ae3-3656-4601-92a3-16ba73b14dcb';

62c6de7f-bf9e-4f72-b0f0-f735b3a9073d
a13595e9-bda1-4502-8c47-38c36637662a
;

select
  p.pos_ident,
  p.pos_id,
  p.siteguid,
  p.show_order
from v$_ffba_pos p;

select id,name,parentid,texttip,catshowname,image,colour,catorder,sflag
from r$_categories
where siteguid = '34892ae3-3656-4601-92a3-16ba73b14dcb'
EXCEPT
select id,name,parentid,texttip,catshowname,image,colour,catorder,sflag
from r$_categories
where siteguid = '7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c'
;

select id,name,parentid,texttip,catshowname,image,colour,catorder,sflag,siteguid,"r$_id","r$_op","r$_create_dt"
from r$d003_00003_categories
order by "r$_id"
;

;;; UPDATE ;;;

insert into r$d003_00003_categories (id,name,parentid,texttip,catshowname,image,colour,catorder,sflag,siteguid,"r$_op","r$_create_dt")
select id,name,parentid,texttip,catshowname,image,colour,catorder,sflag, '7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c', 'U', now()
from r$_categories
where siteguid = '34892ae3-3656-4601-92a3-16ba73b14dcb'
and id in (
'541a3c62-1082-4d0a-8cba-2980c9ad43c1',
'5d575994-2e3a-4b87-bc49-176f247c92e7',
'd9747fb6-a74c-4b1f-a363-ed0b6c7c789b',
'ab758c05-f5aa-40eb-b3d1-1c62d14c52d5'
)
;

d9747fb6-a74c-4b1f-a363-ed0b6c7c789b  Горячие напитки
62c6de7f-bf9e-4f72-b0f0-f735b3a9073d  яАкция по картам
5d575994-2e3a-4b87-bc49-176f247c92e7  Выпечка сладкая
ab758c05-f5aa-40eb-b3d1-1c62d14c52d5  Фастфуд + пицца
;

select id,name,parentid,texttip,catshowname,image,colour,catorder,sflag
from r$_categories
where siteguid = '34892ae3-3656-4601-92a3-16ba73b14dcb';
and id not in (
'a13595e9-bda1-4502-8c47-38c36637662a',
'62c6de7f-bf9e-4f72-b0f0-f735b3a9073d',
'000'
)
EXCEPT
select id,name,parentid,texttip,catshowname,image,colour,catorder,sflag
from r$_categories
where siteguid = '2da8b8e5-7a47-4f1f-a950-ec140dc87a72'
;


select id,name,parentid,texttip,catshowname,image,colour,catorder,sflag,siteguid,"r$_id","r$_op","r$_create_dt"
from r$d003_00003_categories
order by "r$_id"
;

;;; UPDATE Хлеб ;;;

insert into r$d003_00003_categories (id,name,parentid,texttip,catshowname,image,colour,catorder,sflag,siteguid,"r$_op","r$_create_dt")
select 'c107a00e-ecda-4306-a8d8-cb6bd7de3e66',name,parentid,texttip,catshowname,image,colour,catorder,sflag, '7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c', 'U', now()
from r$_categories
where name = 'Хлеб'
and siteguid = '34892ae3-3656-4601-92a3-16ba73b14dcb'
;


select * from r$_categories;
select count(*) from r$_categories;


select *
from r$_categories
where name = 'Хлеб'
and siteguid = '34892ae3-3656-4601-92a3-16ba73b14dcb'
;

New categories:
  яПенсионерам  a13595e9-bda1-4502-8c47-38c36637662a
  яАкция по картам  62c6de7f-bf9e-4f72-b0f0-f735b3a9073d

Different ID:
  Хлеб  000
  000 --> 'c107a00e-ecda-4306-a8d8-cb6bd7de3e66'
;

select *
from r$_categories
where id in (
'5d575994-2e3a-4b87-bc49-176f247c92e7'
)
and siteguid in ('34892ae3-3656-4601-92a3-16ba73b14dcb', '7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c')
order by id, siteguid
;


;;; NEW CATEGORIES ;;;

insert into r$d003_00002_categories (id,name,parentid,texttip,catshowname,image,colour,catorder,sflag,siteguid,"r$_op","r$_create_dt")
select id,name,parentid,texttip,catshowname,image,colour,catorder,sflag, 'ffcf5815-b7ef-4b9b-bc8f-14f6f04c59e6', 'N', now()
from r$_categories
where siteguid = '34892ae3-3656-4601-92a3-16ba73b14dcb'
and id in (
'a13595e9-bda1-4502-8c47-38c36637662a',
'62c6de7f-bf9e-4f72-b0f0-f735b3a9073d'
)
;


select * from r$d003_00001_categories order by "r$_id";
select * from r$d003_00002_categories order by "r$_id";
select * from r$d003_00003_categories order by "r$_id";



INSERT INTO r$d004_categories (
id, name, parentid, texttip, catshowname, image, colour, catorder, siteguid, sflag, r$_op, r$_create_dt
)
SELECT id, name, parentid, texttip, catshowname, image, colour, catorder, '87011394-b5a6-46bf-b332-ca2f78b569f1', sflag, 'N', now()
FROM r$_categories
WHERE id in ('a13595e9-bda1-4502-8c47-38c36637662a','62c6de7f-bf9e-4f72-b0f0-f735b3a9073d')
AND siteguid = '34892ae3-3656-4601-92a3-16ba73b14dcb'
;

SELECT * FROM r$_categories WHERE siteguid = 'ffcf5815-b7ef-4b9b-bc8f-14f6f04c59e6'; elta_00002;
SELECT * FROM r$_categories WHERE siteguid = '7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c'; elta_00003;
SELECT * FROM r$_categories WHERE siteguid = '87011394-b5a6-46bf-b332-ca2f78b569f1'; eltapos_002
SELECT * FROM r$d004_categories;
INSERT INTO r$d004_categories ( id, name, parentid, texttip, catshowname, image, colour, catorder, siteguid, sflag, r$_op, r$_create_dt )
SELECT id, name, parentid, texttip, catshowname, image, colour, catorder, '87011394-b5a6-46bf-b332-ca2f78b569f1', sflag, 'U', now() FROM r$_categories WHERE id in ('d9747fb6-a74c-4b1f-a363-ed0b6c7c789b','5d575994-2e3a-4b87-bc49-176f247c92e7','ab758c05-f5aa-40eb-b3d1-1c62d14c52d5','000') AND siteguid = '34892ae3-3656-4601-92a3-16ba73b14dcb'
;
