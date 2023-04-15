if [%POS_HOME%] == [] SET POS_HOME=C:\ffba-pos
cd /d %POS_HOME% & node build/admin.js --run 2>>logs/pos-admin.err >>logs/pos-admin.out & node build/main.js --run 2>>logs/pos-main.err >>logs/pos-main.out
