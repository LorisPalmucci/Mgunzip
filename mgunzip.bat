@echo off
setlocal enabledelayedexpansion

set "DEF_DIR=C:\Users\User\Downloads\Telegram Desktop"
set "SOURCE_DIR=!DEF_DIR!"

:loop
echo.
echo Percorso di ricerca attuale: !SOURCE_DIR!
set /p "change_path=Vuoi cambiarlo? (s/n, default n): "
if /i "!change_path!"=="s" (
    set /p "new_path=Inserisci il nuovo percorso: "
    if defined new_path set "SOURCE_DIR=!new_path!"
)

echo.
set /p "archivio_pattern=Inserisci nome file/pattern (es. Epic*.7z) o "exit" per uscire: "
if /i "!archivio_pattern!"=="exit" goto :fine

set /p "device=Inserisci il path del device di destinazione (lascia vuoto per non copiare): "

REM Itera su tutti i file che corrispondono al pattern inserito
FOR %%F IN ("!SOURCE_DIR!\!archivio_pattern!") DO (
    echo.
    echo --- Processando: "%%~nxF" ---

    REM Ottiene il nome del file senza estensione per usarlo come nome della cartella
    set "FOLDER_NAME=%%~nF"
    set "OUTPUT_DIR=%SOURCE_DIR%\!FOLDER_NAME!"

    echo  - Estrazione in: "!OUTPUT_DIR!"
    if not exist "!OUTPUT_DIR!" (
        mkdir "!OUTPUT_DIR!"
    )

    REM Estrae l'archivio nella cartella appena creata
    7z x "%%~fF" -o"!OUTPUT_DIR!" -y

    if !errorlevel! equ 0 (
        echo   [SUCCESSO] Estrazione completata.

        REM Se e' stato inserito un device, procede con la copia
        if not "!device!"=="" (
            set "DEST_DIR=!device!:\!FOLDER_NAME!"
            echo  - Copia in: "!DEST_DIR!"
            xcopy "!OUTPUT_DIR!" "!DEST_DIR!" /E /I /Y
            if !errorlevel! equ 0 (
                echo   [SUCCESSO] Copia completata.
            ) else (
                echo   [ERRORE] Copia fallita.
            )
            rmdir "!OUTPUT_DIR!" /s /q
            del "%%~fF" /q
            if !errorlevel! equ 0 (
                echo   [SUCCESSO] Eliminazione completata.
            ) else (
                echo   [ERRORE] Eliminazione fallita.
            )
        )
    ) else (
        echo   [ERRORE] Estrazione fallita.
    )
)
echo -----------------------------------------
goto loop

:fine
echo Completato!
pause