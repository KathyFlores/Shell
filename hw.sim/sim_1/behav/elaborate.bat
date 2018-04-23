@echo off
set xv_path=E:\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 1a508f0eb90346b5aca1655d3b823e3b -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip --snapshot cputst_behav xil_defaultlib.cputst xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
