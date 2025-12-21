# Mgunzip

Uno script batch per Windows che automatizza l'estrazione di archivi (`.7z`, `.zip`, etc.) e, opzionalmente, sposta il contenuto estratto su un altro dispositivo, eliminando i file originali.

## Funzionamento

Lo script opera in un ciclo continuo, chiedendo all'utente di inserire un'azione:

1.  **Ricerca dell'archivio**: Cerca i file che corrispondono al nome o al pattern fornito (es. `MioArchivio.7z`, `Progetto*.zip`) all'interno di una cartella predefinita: `C:\Users\User\Downloads\Telegram Desktop`.
2.  **Estrazione**: Per ogni archivio trovato, crea una nuova cartella con lo stesso nome dell'archivio (senza estensione) ed estrae lì tutto il suo contenuto.
3.  **Copia e Pulizia (Opzionale)**:
    *   Se viene specificato un percorso di destinazione (es. un drive `D:`), lo script copia la cartella estratta in quella posizione.
    *   Dopo la copia, elimina sia la cartella temporanea creata nella directory di origine sia l'archivio originale.
    *   Se non viene specificato alcun percorso, i file estratti rimangono semplicemente nella cartella di origine e l'archivio originale non viene cancellato.

## Prerequisiti

1.  **Sistema Operativo**: Windows.
2.  **7-Zip**: È necessario che [7-Zip](https://www.7-zip.org/) sia installato sul sistema e che il suo eseguibile (`7z.exe`) sia accessibile dalla riga di comando (ovvero, la sua cartella di installazione deve essere aggiunta alla variabile d'ambiente `PATH` di sistema).

## Utilizzo

1.  Eseguire il file `mgunzip.bat`.
2.  Quando richiesto, inserire il **nome del file** o un **pattern** per trovare gli archivi da processare. Ad esempio:
    *   `MioArchivio.7z` per un file specifico.
    *   `Epic*.7z` per tutti i file che iniziano con "Epic" e hanno estensione ".7z".
3.  Quando richiesto, inserire il **percorso del dispositivo di destinazione** dove copiare i file estratti (es. `D`).
    *   **Lasciare vuoto e premere Invio** se non si desidera spostare i file e si vuole solo estrarli nella cartella di origine.
4.  Per terminare lo script, digitare `exit` e premere Invio al primo prompt.

## Nota importante

La cartella di origine degli archivi è impostata staticamente all'interno dello script. Se i tuoi file si trovano in un percorso diverso, dovrai modificare la seguente riga nel file `mgunzip.bat`:

```batch
set "SOURCE_DIR=C:\Users\User\Downloads\Telegram Desktop"
```