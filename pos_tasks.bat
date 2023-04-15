@echo off

if [%POS_HOME%] == [] SET POS_HOME=C:\ffba-pos
cd /d %POS_HOME% & node build/admin.js --run 2>>pos_admin.err >>pos_admin.out & node build/main.js --run 2>>pos_main.err >>pos_main.out
