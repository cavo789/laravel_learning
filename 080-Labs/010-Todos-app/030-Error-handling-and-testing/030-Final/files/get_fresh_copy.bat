@ECHO OFF
CLS

ECHO START at %DATE% - %TIME%

REM Path to 7-zip (if not present on your system, please download it)
SET ZIP="C:\Program Files\7-Zip\7z.exe"

REM Current folder
SET TARGET=%cd%\

call ::fnCopy
call ::fnZip

GOTO FINISH

REM ------------------------------------------------------------------------

:fnCopy

ECHO    Copy files...

SET SOURCE="C:\Christophe\Repository\laravel_todos\"

call ::fnCopyRoot %SOURCE% "%TARGET%"
call ::fnCopyApp %SOURCE% "%TARGET%"
call ::fnCopyDatabase %SOURCE% "%TARGET%"
call ::fnCopyPublic %SOURCE% "%TARGET%"
call ::fnCopyResources %SOURCE% "%TARGET%"
call ::fnCopyRoutes %SOURCE% "%TARGET%"
call ::fnCopyTests %SOURCE% "%TARGET%"

GOTO:EOF

REM ------------------------------------------------------------------------
REM - Copy from application's root folder

:fnCopyRoot

SET SRC=%~1
SET SRC=%SRC:"=%

SET TGT=%~2
SET TGT=%TGT:"=%

ECHO       get from %SRC%

COPY %SRC%.env "%TGT%" 

GOTO:EOF

REM ------------------------------------------------------------------------
REM - Copy from application's /app folder

:fnCopyApp

SET SRC=%~1app\
SET SRC=%SRC:"=%
SET TGT=%~2app\
SET TGT=%TGT:"=%

ECHO       get from %SRC%

IF EXIST "%TGT%" RMDIR /S /Q "%TGT%" > nul

MKDIR "%TGT%" > nul
COPY "%SRC%Todo.php" "%TGT%"

MKDIR "%TGT%\Console\Commands" > nul
ECHO          get from %SRC%Console\Commands\
COPY "%SRC%Console\Commands\clear.php" "%TGT%Console\Commands\"
COPY "%SRC%Console\Commands\populate.php" "%TGT%Console\Commands\"

MKDIR "%TGT%\Http\Controllers" > nul
ECHO          get from %SRC%Controllers\
COPY "%SRC%Http\Controllers\TodoController.php" "%TGT%Http\Controllers\"

MKDIR "%TGT%\Http\Requests" > nul
ECHO          get from %SRC%Http\Requests\
COPY "%SRC%Http\Requests\TodoRequest.php" "%TGT%Http\Requests\"

MKDIR "%TGT%\Providers"
ECHO          get from %SRC%Providers\
COPY "%SRC%Providers\AppServiceProvider.php" "%TGT%Providers\"

MKDIR "%TGT%\Repositories"
ECHO          get from %SRC%Repositories\
COPY "%SRC%Repositories\TodoRepository.php" "%TGT%Repositories\"
COPY "%SRC%Repositories\TodoRepositoryInterface.php" "%TGT%Repositories\"

GOTO:EOF

REM ------------------------------------------------------------------------

:fnCopyDatabase

SET SRC=%~1database\
SET SRC=%SRC:"=%
SET TGT=%~2database\
SET TGT=%TGT:"=%

ECHO       get from %SRC%

IF EXIST "%TGT%" RMDIR /S /Q "%TGT%" > nul

MKDIR "%TGT%\migrations" > nul
ECHO          get from %SRC%migrations
COPY "%SRC%migrations\2018_08_01_000000_create_todos_table.php" "%TGT%\migrations\"

GOTO:EOF

REM ------------------------------------------------------------------------

:fnCopyPublic

SET SRC=%~1public\
SET SRC=%SRC:"=%
SET TGT=%~2public\
SET TGT=%TGT:"=%

ECHO       get from %SRC%

IF EXIST "%TGT%" RMDIR /S /Q "%TGT%" > nul

MKDIR "%TGT%\images\errors" > nul
ECHO          get from %SRC%images\errors
COPY "%SRC%images\errors\error_404_data.json" "%TGT%\images\errors\"

GOTO:EOF

REM ------------------------------------------------------------------------

:fnCopyResources

SET SRC=%~1resources\
SET SRC=%SRC:"=%
SET TGT=%~2resources\
SET TGT=%TGT:"=%

ECHO       get from %SRC%

IF EXIST "%TGT%" RMDIR /S /Q "%TGT%" > nul

MKDIR "%TGT%\views" > nul
ECHO          get from %SRC%views
COPY "%SRC%views\create.blade.php" "%TGT%\views"
COPY "%SRC%views\edit.blade.php" "%TGT%\views"
COPY "%SRC%views\master.blade.php" "%TGT%\views"
COPY "%SRC%views\index.blade.php" "%TGT%\views"
COPY "%SRC%views\show.blade.php" "%TGT%\views"


MKDIR "%TGT%\views\buttons" > nul
ECHO          get from %SRC%views\buttons
COPY "%SRC%views\buttons\add.blade.php" "%TGT%\views\buttons"
COPY "%SRC%views\buttons\back.blade.php" "%TGT%\views\buttons"
COPY "%SRC%views\buttons\delete.blade.php" "%TGT%\views\buttons"
COPY "%SRC%views\buttons\edit.blade.php" "%TGT%\views\buttons"
COPY "%SRC%views\buttons\show.blade.php" "%TGT%\views\buttons"

MKDIR "%TGT%\views\errors" > nul
ECHO          get from %SRC%views\errors
COPY "%SRC%views\errors\404.blade.php" "%TGT%\views\errors"
GOTO:EOF

REM ------------------------------------------------------------------------

:fnCopyRoutes

SET SRC=%~1routes\
SET SRC=%SRC:"=%
SET TGT=%~2routes\
SET TGT=%TGT:"=%

ECHO       get from %SRC%

IF EXIST "%TGT%" RMDIR /S /Q "%TGT%" > nul

MKDIR "%TGT%" > nul

COPY "%SRC%web.php" "%TGT%"

GOTO:EOF

REM ------------------------------------------------------------------------

:fnCopyTests

SET SRC=%~1tests\
SET SRC=%SRC:"=%
SET TGT=%~2tests\
SET TGT=%TGT:"=%

ECHO       get from %SRC%Feature

IF EXIST "%TGT%" RMDIR /S /Q "%TGT%" > nul

MKDIR "%TGT%Feature" > nul

COPY "%SRC%Feature\TodoControllerTest.php" "%TGT%Feature\"

GOTO:EOF

REM ------------------------------------------------------------------------
REM ------------------------------------------------------------------------
REM ------------------------------------------------------------------------

:fnZip

ECHO    Make todos.zip...

IF EXIST todos.zip DEL todos.zip

REM Don't take .bat files in the ZIP
%ZIP% a -r todos.zip "*.*" -x!*.bat > nul

GOTO:EOF

REM ------------------------------------------------------------------------

:FINISH

ECHO.
ECHO End at %DATE% - %TIME%

:QUIT




