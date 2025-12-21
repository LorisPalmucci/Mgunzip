# Mgunzip

Uno script batch per Windows che automatizza l'estrazione di archivi (`.7z`, `.zip`, etc.) e, opzionalmente, sposta il contenuto estratto su un altro dispositivo, eliminando i file originali.

## Funzionamento

Lo script opera in un ciclo continuo, chiedendo all'utente di inserire un'azione:

1.  **Scelta del Percorso**: All'inizio di ogni ciclo, lo script mostra il percorso di ricerca attuale e chiede all'utente se desidera cambiarlo.
2.  **Ricerca dell'archivio**: Cerca i file che corrispondono al nome o al pattern fornito (es. `MioArchivio.7z`, `Progetto*.zip`) all'interno della cartella di ricerca selezionata.
3.  **Estrazione**: Per ogni archivio trovato, crea una nuova cartella con lo stesso nome dell'archivio (senza estensione) ed estrae lì tutto il suo contenuto.
4.  **Copia e Pulizia (Opzionale)**:
    *   Se viene specificato un percorso di destinazione (es. un drive `D:`), lo script copia la cartella estratta in quella posizione.
    *   Dopo la copia, elimina sia la cartella temporanea creata nella directory di origine sia l'archivio originale.
    *   Se non viene specificato alcun percorso, i file estratti rimangono semplicemente nella cartella di origine e l'archivio originale non viene cancellato.

## Prerequisiti

1.  **Sistema Operativo**: Windows.
2.  **7-Zip**: È necessario che [7-Zip](https://www.7-zip.org/) sia installato sul sistema e che il suo eseguibile (`7z.exe`) sia accessibile dalla riga di comando (ovvero, la sua cartella di installazione deve essere aggiunta alla variabile d'ambiente `PATH` di sistema).

## Utilizzo

Lo script si avvia in un ciclo interattivo:

1.  Eseguire il file `mgunzip.bat`.
2.  Lo script mostrerà il **percorso di ricerca attuale** e chiederà se si desidera cambiarlo.
    *   Digitare `s` e premere Invio per specificare un nuovo percorso per questa sessione.
    *   Premere Invio (o digitare `n`) per usare il percorso attuale.
3.  Inserire il **nome del file** o un **pattern** per trovare gli archivi da processare (es. `MioArchivio.7z`, `Epic*.7z`).
4.  Inserire il **percorso del dispositivo di destinazione** dove copiare i file estratti (es. `D`).
    *   Lasciare vuoto e premere Invio se non si desidera spostare i file.
5.  Il ciclo ricomincia. Per terminare, digitare `exit` quando viene richiesto il nome del file.

## Nota importante

Il percorso di ricerca predefinito è impostato all'inizio dello script. Se si desidera cambiare questo valore di default in modo permanente, è possibile modificare la seguente riga nel file `mgunzip.bat`:

```batch
set "DEF_DIR=C:\Users\User"
```
