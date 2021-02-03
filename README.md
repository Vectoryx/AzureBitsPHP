# Vectoryx.github.io: Progetto TRM ( Test a Risposta Multipla)

**Nome Azienda**: AzureBits

# Contributori:
**Leonardo Montagner, Daniele Pontillo, Fabio Foltran, Mattia Pravato**

# Panoramica:
Questo progetto fu chiesto dal Prof. Voltolina come esercizio di lungo termine.

Il progetto in se serve a creare e gestire Test a Risposta Multipla utilizzando le nostre conoscenze sui database e il linguaggio SQL.

Lo rendiamo possibile collegando un programma Java grazie al connettore Java di MySQL.

---

La **Classe Utente** è una classe generale che viene descritta da diversi attributi.

**Classe Utente**:

**User name** (L'userName viene descritto da un unico valore Nome.Cognome)

**Privilegio**  (Questo descrive il potere che ha l'Utente. Ci sono tre livelli: Admin, Professore, Studente)

**Classe** (Questo è l'anno in cui si trovano gli utenti. Esso è un numero)

**Sezione** (Questa è la sezione in cui gli utenti si trovano. Essa è una lettera)

**Password** (Questa è la password che serve agli utenti per accedere ai loro rispettivi account)

---

Prossimamente potete vedere che cosa possono fare i diversi privilegi

L' Admin può

Gestire utenti (Inserire / Cancellare / Modificare);
Gestire le classi di studenti.

Il Professore può

Gestire le Domande  (Inserire / Cancellare / Modificare);
Comporre e somministrare un Test (Insieme di domande);
Verificare i risultati.

Lo Studente può

Eseguire un test
Consultare i risultati

---

La **Classe Domanda** viene descritto da:

Questito della domanda (Questo è il testo della domanda stesso. Ovviamente serve per contenerlo all'interno di una variabile)

**Risposte possibili a scelta multipla** (Abbiamo qui quante risposte possono esserci su una domanda. Da 2 in sù. Utilizziamo un array, un elenco, per tenere traccia delle risposte all'interno di ogni domanda)

**Immagine inerente alla domanda** (Se la domanda presenta l'utilizzo di un'immagine, questo serve per dare l'immagine un posto nel programma e nella sua parte grafica)

**Punteggio** (Segna quanti punti si possono assegnare ad ogni domanda. Per esempio: 1/2/3 punti)

**Difficoltà** (Semplicemente, la difficoltà che viene assegnata alla domanda. Varia tra: Facile / Media / Difficile / Molto Difficile)

**Materia** (La materia di cui fa parte la domanda)

**Classe**   --Indici per ricerca

**Argomento** (L'argomento della domanda)

---

La **Classe Test** viene descritta da:

**Domande scelte a mano** (Le domande che vengono scelte dal Professore quando vuole creare un test)

**Classe a cui somministrarlo** (Questa si spiega da sola)

**Tempo concesso** (Quanto tempo hanno gli Studenti per finire il Test. Viene misurato in minuti)

**Attivo** (Descrive se il test è visibile e somministrabile agi studenti)

**Options**

**Punteggio domande** (Questo indica se il pinteggio che si da ad ogni domanda sarà Statico o Variabile. Statico per un punteggio uguale su ogni domanda, Variabile se si decide di dare punti diversi per ogni domanda)

**Penalità errore** (Quanti punti perdono gli Studenti per aver fatto una risposta sbagliata. ((N.B. Leonardo, fai si che mettere 0 è possibile)) )

**Percentuale Sufficenza** (Misura quanti punti bisogna avere per avere la sufficenza)

**Voto massimo** (Anche questa è molto semplice da capire)

**Progressione della difficoltà delle domande**(Indica se la difficoltà delle domande sarà: Lineare quindi costante e sempre in salita / Inversa, quindi dalla più difficile alla più semplice / Random, cioè casuale)

---

#Una volta creato deve essere attivo perche gli studenti lo possano vedere e eseguire
