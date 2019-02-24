;;; siteguid ;;;

select siteguid, count(*) from "r$_products"
group by siteguid
;
2a502e42-f359-4174-8a5a-46118f4637a6    93 (eltapos_001)
87011394-b5a6-46bf-b332-ca2f78b569f1    91 (eltapos_002)
34892ae3-3656-4601-92a3-16ba73b14dcb    78 (eltapos_003)

2da8b8e5-7a47-4f1f-a950-ec140dc87a72    93 (elta_00001)
ffcf5815-b7ef-4b9b-bc8f-14f6f04c59e6    93 (elta_00002)
7e1b1f6a-e7f8-4e7d-acf4-8a25604c0b3c    74 (elta_00003)

99999
;
