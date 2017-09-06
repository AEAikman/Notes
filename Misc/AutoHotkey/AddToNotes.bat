:: AddToNotes.bat 
:: Aaron Aikman
:: 2/17/2017

:: For quickly adding notes to a text file in the designated path using Launchy
:: The first word entered will indicate which file to write to
:: If you want the text file to open upon completion, type op for the second word
:: If you do not want two new lines in the text file, type nn for the second or third word
:: If you want a newline, type newline
:: If the file does not exist, it will be created
:: Many symbols do not work
:: Some symbols that do work include . # ! / \
:: Unfortunately, you can't include the name of the Notes file in the note because Batch can't do basic incrementation

@ECHO OFF

call :subr %*
exit /b

:subr

set numberNewlines=2
if %2==nn (set numberNewlines=1)
if %3==nn (set numberNewlines=1)
set notePath=Z:\InProd\Ozzy\artists\Aaron\Text\Notes\%1.txt

for /L %%i IN (1,1,%numberNewlines%) do (ECHO. >> %notePath%)


if not %2==op (
	if not %2==nn (
		for %%A in (%*) do (
			IF NOT %%A==%1 (
				IF %%A==newline (
					ECHO. >> %notePath%
				)
				IF NOT %%A==newline (
					<NUL set /p= %%A >> %notePath%
				)
			)
		)
	)
	if %2==nn (
		for %%A in (%*) do (
			IF NOT %%A==%1 (
				IF NOT %%A==%2 (
					IF %%A==newline (
						ECHO. >> %notePath%
					)
					IF NOT %%A==newline (
						<NUL set /p= %%A >> %notePath%
					)
				)
			)
		)
	)
)

if %2==op (
	if not %3==nn (
		for %%A in (%*) do (
			IF NOT %%A==%1 (
				IF NOT %%A==%2 (
					IF %%A==newline (
						ECHO. >> %notePath%
					)
					IF NOT %%A==newline (
						<NUL set /p= %%A >> %notePath%
					)
				)
			)
		)
	)
	
	if %3==nn (
		for %%A in (%*) do (
			IF NOT %%A==%1 (
				IF NOT %%A==%2 (
					IF NOT %%A==%3 (
						IF %%A==newline (
							ECHO. >> %notePath%
						)
						IF NOT %%A==newline (
							<NUL set /p= %%A >> %notePath%
						)
					)
				)
			)
		)
	)
	start %notePath%
) 

rem for %%A in (%*) do (IF NOT %%A==%1 (<NUL set /p= %%A >> %notePath%))



rem pause
exit /b