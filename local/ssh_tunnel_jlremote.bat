
@echo off
setlocal
set port=9753
set remote_username=romain.ligneul
set remote_hostname=10.69.168.62
for /f "tokens=* usebackq" %%i in (`powershell -command "ssh %remote_username%@%remote_hostname% 'tail -1 ~/.jupyternode.txt'"`) do set node=%%i

:: Read the node from the temporary file
set /p node=<node.txt

:: Delete the temporary file
: : del node.txt

set url=http://localhost:%port%

:: Construct and run the SSH command
set cmd=ssh -CNL 8888:%node%:%port% %remote_username%@%remote_hostname%
echo Running '%cmd%'
%cmd%

endlocal