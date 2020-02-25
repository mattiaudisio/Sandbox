USE 5C_Convention;

/*
Esempio Query per Convention
Select Piano.*
From Piano
Inner join Sala On Piano.Numero=Piano.Numero
Inner join Programma On sala.nomeSala=Programma.NomeSala
Where programma.fasciaOraria='B'
*/

/*Cognome e nome dei relatori di Beintoo*/
SELECT Relatore.cognomeRel, Relatore.nomeRel
FROM Relatore, Azienda
WHERE Relatore.idAzienda='Beintoo'
AND Azienda.idAzienda = Relatore.idAzienda
ORDER BY Relatore.cognome;

/*Numero di partecipanti per ogni speech*/
SELECT Speech.titolo, Composto.nPartecipanti
FROM Speech, Programma, Composto
WHERE Programma.idSPeech = Speech.idSpeech
AND Programma.idProgramma = Composto.idProgramma
ORDER BY Speech.titolo;

/*Sapere a che piano è lo speech speech 1*/
SELECT Piano.intPiano
FROM Piano, Sala, Programma, Speech
WHERE Speech.idSpeech = `SP01`
AND Speech.idSPeech = Programma.idSpeech
AND Programma.nomeSala = Sala.nomeSala
AND Sala.nPiano = Piano.nPiano;

/*Conteggio dei partecipanti per ogni speech*/
SELECT Composto.nPartecipanti,Speech.idSpeech
FROM Programma, Speech, Composto
WHERE Composto.idProgramma = Programma.idProgramma
AND Speech.idSpeech = Programma.idProgramma
GROUP BY Speech.idSpeech;

/*
SELECT avg(nPartecipanti) AS MediaPartecipanti
FROM (SELECT COUNT(Composto.nPartecipanti) as nPartecipanti,Speech.idSpeech
FROM Programma, Speech, Composto
WHERE Composto.idProgramma = Programma.idProgramma
AND Speech.idSpeech = Programma.idProgramma
GROUP BY Speech.idSpeech) AS ConteggioPartecipanti;
*/

/*Elenco dei partecipanti dello 'Speech1' nella fascia oraria 'A' nella 'sala1' (flag arrivo nella ...)*/
SELECT Partecipante.cognomePart, Partecipante.nomePart
FROM Programma, Partecipante, Composto
WHERE Partecipante.idPart = Composto.idPart
AND Composto.idProgramma = Composto.idProgramma
AND Programma.fasciaOraria = 'A'
AND Programma.idSpeech = 'Speech1'
AND Programma.nomeSala = 'Sala1'
ORDER BY Partecipante.cognomePart ASC;