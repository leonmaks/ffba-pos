@echo off
rem status.bat /admin/task 190116_2000

schtasks /query /v /fo list /tn \FFBA-POS-Task
