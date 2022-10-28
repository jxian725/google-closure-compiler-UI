@echo off
setlocal EnableDelayedExpansion
echo ^|    Google Closure Compiler    ^|
echo --------------------------------------
set /p "compilerType=Manual compilation? Y/N: "
if %compilerType%==Y set type=manual
if %compilerType%==y set type=manual
if %compilerType%==N set type=auto
if %compilerType%==n set type=auto
if %type%==manual (
echo java -jar compiler.jar --compilation_level SIMPLE --js ^<hello.js^> --js_output_file ^<hello.min.js^>
cmd /K "cd %CD%"
) else (
cls
echo ^|    Google Closure Compiler    ^|
echo --------------------------------------
set compileLevel=SIMPLE
:prompt_input_file
echo Javascript File Path to be compiled
set /p "inputPath=: "
if NOT exist !inputPath! (
    echo File does not exists!
	echo;
	goto prompt_input_file
)
echo;
echo Compilation Level ^(WHITESPACE_ONLY/SIMPLE/ADVANCED/BUNDLE^) ^| default:!compileLevel!
set /p "compileLevel=Enter a level or just ENTER for default: "
echo;
echo Compiling... Please wait...
echo;
java -jar compiler.jar --compilation_level !compileLevel! --js !inputPath! --js_output_file output.min.js
echo Compiled successfully!
pause
)