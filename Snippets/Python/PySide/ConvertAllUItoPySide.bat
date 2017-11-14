@echo off
setlocal enabledelayedexpansion
rem pyside-uic Basic.ui > Basic.py
for %%x in (*.ui) do (
	set fullname=%%x
	echo !fullname:~0, -3!
	set pyname=!fullname:~0,-3!.py
	echo !pyname!
	pyside-uic %%x > !pyname! 
)
rem pause