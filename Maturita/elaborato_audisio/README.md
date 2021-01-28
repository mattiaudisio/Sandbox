# Audisio Mattia 5C

__*ESAME DI STATO DI ISTITUTO TECNICO INDUSTRIALE*__ <br />
CORSO DI ORDINAMENTO <br />
__Indirizzo__: INFORMATICA <br />
__Tema di__: INFORMATICA GENERALE, SISTEMI E RETI <br />

Il Ministero dell'Ambiente commissiona lo sviluppo di un nuovo Sistema Informativo per censire la
fauna e la flora presenti nei vari parchi naturali di ciascuna regione. Le informazioni della fauna da
raccogliere riguardano l'ordine di appartenenza (mammiferi, rettili, uccelli, etc...), la specie
(scoiattolo, volpe, orso, vipera, falco, aquila, etc...), il numero di esemplari adulti e cuccioli (con
distinzione maschio, femmina). La flora viene distinta in alberi (quercia, faggio, acacia, etc...),
arbusti (lavanda, rosmarino, rododendro, etc...) e piante erbacee (fragola di bosco, margherita,
primula, etc...) ed è necessario catalogarle.<br />
In ciascun parco, un responsabile (guardia parco) raccoglie le informazioni attraverso
un’interfaccia web tramite il dispositivo mobile in dotazione e, dopo avere acquisito i dati dalle
maschere di immissione, li invia al sistema centrale della Regione per la memorizzazione nel
database regionale.<br />
Il candidato, ___formulate le opportune ipotesi aggiuntive___, realizzi:<br />
 • Un’analisi della realtà di riferimento, completa dello schema funzionale dell'architettura
 proposta (a livello locale e regionale), evidenziandone le principali componenti, le
 caratteristiche hardware e software, i protocolli necessari, la tecnologia utilizzata per la
 trasmissione delle informazioni e le tecniche per garantire la sicurezza perimetrale dei dati.<br />
 • Un piano opportuno di indirizzamento locale e per la comunicazione tra le sedi.<br />
 • Uno schema concettuale ed uno schema logico del database.<br />
 • La definizione delle relazioni e le seguenti interrogazioni espresse in linguaggio SQL,__opportunamente commentate in ogni loro parte__:<br />
 1. Visualizzare l'elenco di tutti gli esemplari di fauna, ordinati per specie, presenti nei  vari parchi.<br />
 2. Visualizzare quante specie diverse di pino sono presenti in ciascun parco.<br />
 3. Visualizzare il nome della specie di animale con il più alto numero di esemplari censiti nei vari parchi della regione.<br />
 
La codifica in PHP (HTML-CSS-JS) di:<br />
 • form di autenticazione (login) del guardia parco all’interfaccia web;<br />
 • una pagina per la visualizzazione del risultato di una query a scelta tra quelle proposte.<br />
 
 # Sviluppo della rete
Ipotizzando la difficoltà di una connessione di rete permanente nelle aree dei parchi naturali si
ipotizza che nel dispositivo mobile sia presente un applicazione Android, scritta in java, dove ogni
guardia, tramite due form, uno per l’inserimento di un nuovo animale ed uno per l'inserimento di
una nuova pianta, produca un file XML locale.<br />
Visto che il dispositivo mobile in dotazione serve principalmente per acquisire i dati, si può
ipotizzare che sia un dispositivo Android di vecchia generazione, per questo motivo può avere un
sistema operativo Android 7.00 o inferiori con una memoria da 16 GB.<br />
Oltre ad un dispositivo mobile, la guardia potrebbe avere un notebook su cui inviare, tramite il
protocollo Bluetooth, il file XML, per poi inviarlo al sistema centrale della Regione, dove le
informazioni verranno salvate all’interno del database.<br />
Come portatile si può pensare ad un computer di fascia medio-bassa con 4GB di RAM, 500GB di
Hard Disk e come processore un Intel Core i7 di 8th generazione con sopra Ubuntu e si può
ipotizzare l’utilizzo di FileZilla per il trasferimento dei file, utilizzando così il protocollo FTP.
Un altro sistema per inoltrare il file al sistema centrale può essere via mail, proteggendo la mail con
una firma digitale, in modo da verificare l’autenticità del mittente e impedendo così un’eventuale
alterazione del database da parte di utenti non autorizzati.<br />
Per la costruzione di questo schema di rete si è deciso di prendere in considerazione la prima
soluzione.<br />
All’interno dei parchi, vista la presenza di un unico computer, si può pensare all’installazione di uno
switch Cisco a 8 porte collegato ad un router Cisco con funzionalità di NAT, in modo che
all’indirizzo IP privato del computer (192.168.20.2) sia associato un indirizzo IP pubblico
(75.122.49.16), e Firewall, in modo che tutti i pacchetti in entrata ed uscita siano controllati, ed
all’occorrenza, filtrati.<br />
All’interno del parco, l’indirizzo di rete è il 192.168.20.0, il broadcast è il 192.168.20.255
mentre il gateway è il 192.168.20.254.<br />
All’interno del sistema centrale della Regione, lo schema di rete, si può suddividere in 2 gruppi, il
primo dov’è presente una LAN con le postazioni degli operatori, ed il secondo dove è collocata la
DMZ, al cui interno sono presenti i server HTTP, FTP ed il server a cui è collegato il database.
La LAN è collegata al router tramite uno switch Cisco a 24 porte, visto anche il maggior numero di
computer, mentre il router è un router Cisco con funzionalità di NAT e Firewall.<br />
Per i computer si può pensare a dei PC desktop con una CPU Intel Core i7 di 9th generazione con
4G di RAM e 500GB di Hard Disk con sopra Ubuntu.<br />
Per i server, si può optare di utilizzare 3 server con 2 Hard Disk da un 1TB l’uno mentre, per gli
indirizzi IP, si è scelto di dare l’indirizzo 202.168.30.1 al server che ospita il database, l’indirizzo
202.168.30.100 al server FTP, mentre invece l’indirizzo 202.168.30.200 è stato assegnato al server
HTTP che permette ai vari utenti di raggiungere l’interfaccia web tramite un qualsiasi motore di
ricerca.<br />
All’interno del sistema centrale della Regione, l’indirizzo di rete è il 202.168.30.0, il
broadcast è il 202.168.30.255 mentre il gateway è il 202.168.30.254.<br />
Si è scelto di inserire anche il database all’interno della DMZ perché, al suo interno, vengono
salvate anche le mail e le password delle guardie e, nonostante la cifratura in hash che viene fatta
alle password prima di caricarle sul database, si è optato, per evitare eventuali furti di mail
password, di inserirlo all’interno della DMZ.<br />

![ ](https://github.com/mattiaudisio/prjScuola/blob/master/Maturita/elaborato_audisio/img/01.PNG)

# Diagramma E/R
*premessa*:
 - La relazione Parco-GuardiaParco è stata resa una relazione 1-N perché si è ipotizzato che, all’interno di un parco, possano lavorare più guardie ma che solamente una è adibita all’invio dei dati
- La relazione Parco-Fauna e la relazione Parco-Flora sono state rese delle relazioni 1-N perché si è ipotizzato che un determinato tipo di animali o un determinato tipo di pianta possono vivere o si possono trovare all’interno di un solo parco

![ ](https://github.com/mattiaudisio/prjScuola/blob/master/Maturita/elaborato_audisio/img/02.PNG)

__*Valori che assumono alcuni attributi*__<br />
sesso:  *F* = femmina *M* = maschio<br />
sessoGuardia: *F* = femmina *M* = maschio<br />
eta: *A* = adulto *C* = cucciolo<br />
nomeOrdine: *mammiferi rettili uccelli*<br />
stagioneFioritura: *primavera estate autunno inverno*<br />

# Schema Logico
Parco (__codiceParco__,nomeParco);<br />
Fauna (__codiceFauna__,specie,eta,sesso, *codiceOrdine, codiceParco*);<br />
Ordine (__codiceOrdine__,nomeOrdine);<br />
Flora (__codiceFlora__,nome,categoria,stagioneFioritura,*codiceParco*);<br />
GuardiaParco
(__codGuardia__,nomeGuardia,cognomeGuardia,anniGuardia,sessoGuardia,mailGuard
ia,passwordGuardia,*codiceParco*);<br />

# Creazione database

__*DDL*__<br />
create table parchi_audisio;<br />
use parchi_audisio;<br />
create table if not exists Parchi(<br />
 codiceParco varchar(10) not null,<br />
 nomeParco varchar(100) null,<br />
 primary key(codiceParco)<br />
);<br />
create table if not exists GuardiaParco(<br />
 codGuardia varchar(10) not null,<br />
 nomeGuardia varchar(50) null,<br />
 cognomeGuardia varchar(50) null,<br />
 anniGuardia int null,<br />
 sessoGuardia varchar(10) null,<br />
 mailGuardia varchar(50) null,<br />
 passwordGuardia varchar(100) null,<br />
 codiceParco varchar(10) not null,<br />
 primary key(codGuardia)<br />
);<br />
create table if not exists Fauna(<br />
 codiceFauna varchar(10) not null,<br />
 specie varchar(100) null,<br />
 eta varchar(10) null,<br />
 sesso varchar(10) null,<br />
 codiceOrdine varchar(10) not null,<br />
 codiceParco varchar(10) not null,<br />
 primary key(codiceFauna)<br />
);<br />
create table if not exists Ordine(<br />
 codiceOrdine varchar(10) not null,<br />
 nomeOrdine varchar(100) null,<br />
 primary key(codiceOrdine)<br />
);<br />
create table if not exists Flora(<br />
 codiceFlora varchar(10) not null,<br />
 nome varchar(100) null,<br />
 categoria varchar(10) null,<br />
 stagioneFioritura varchar(100) null,<br />
 codiceParco varchar(10) not null,<br />
 primary key(codiceFlora)<br />
);<br />
alter table GuardiaParco add foreign key (codiceParco) references Parchi(codiceParco);<br />
alter table Flora add foreign key (codiceParco) references Parchi(codiceParco);<br />
alter table Fauna add foreign key (codiceParco) references Parchi(codiceParco);<br />
alter table Fauna add foreign key (codiceOrdine) references Ordine(codiceOrdine);<br />
__*DML*__<br />
use parchi_audisio;<br />
insert into Parchi (codiceParco,nomeParco) values<br />
 ('Parcho1','Gran Paradiso'),<br />
 ('Parcho2','Val Grande'),<br />
 ('Parcho3','Val Troncea'),<br />
 ('Parcho4','Lanca di San Michele'),<br />
 ('Parcho5','Monviso');<br />
insert into GuardiaParco (codGuardia,nomeGuardia,cognomeGuardia,anniGuardia,sessoGuardia,mailGuardia,passwordGuardia,codiceParco) values<br />

('Guardia1','Marco','Longo',30,'M','guardia1@mail.com','ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f','Parcho1'),<br />
('Guardia2','Luca','Rossi',29,'M','guardia2@mail.com','ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f','Parcho2'),<br />
('Guardia3','Stefano','Verdi',49,'M','guardia3@mail.com','ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f','Parcho3'),<br />
('Guardia4','Lorenzo','Giolitti',41,'M','guardia4@mail.com','ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f','Parcho4'),<br />
('Guardia5','Giacomo','Saba',56,'M','guardia5@mail.com','ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f','Parcho5');<br />

insert into Ordine (codiceOrdine,nomeOrdine) values<br />
 ('ordine1','mammiferi'),<br />
 ('ordine2','rettili'),<br />
 ('ordine3','uccelli');<br />
 
insert into Fauna (codiceFauna,specie,eta,sesso,codiceOrdine,codiceParco) values<br />
 ('Fauna1','scoiattolo','A','M','ordine1','Parcho1'),<br />
 ('Fauna2','volpe','C','F','ordine1','Parcho2'),<br />
 ('Fauna3','orso','A','M','ordine1','Parcho3'),<br />
 ('Fauna4','vipera','C','F','ordine2','Parcho4'),<br />
 ('Fauna5','falco','A','M','ordine3','Parcho5');<br />

insert into Flora (codiceFlora,nome,categoria,stagioneFioritura,codiceParco) values<br />
 ('Flora1',' pino','piante','primavera','Parcho1'),<br />
 ('Flora2','pino','piante','autunno','Parcho2'),<br />
 ('Flora3','pino','piante','estate','Parcho3'),<br />
 ('Flora4','pino','alberi','inverno','Parcho4'),<br />
 ('Flora5','pino','arbusti','autunno','Parcho5');<br />

# Query sql
__1) Visualizzare l'elenco di tutti gli esemplari di fauna, ordinati per specie, presenti nei vari parchi__<br /><br />
select Fauna.specie, Parchi.nomeParco<br />
from Fauna, Parchi<br />
where Parchi.codiceParco = Fauna.codiceParco<br />
order by Fauna.specie;<br />

__2) Visualizzare quante specie diverse di pino sono presenti in ciascun parco__<br /><br />
select Parchi.nomeParco, count(Flora.codiceFlora) as numPini<br />
from Flora, Parchi<br />
where Parchi.codiceParco = Flora.codiceParco<br />
and Flora.nome = “pino"<br />
group by Parchi.nomeParco;<br />

__3) Visualizzare il nome della specie di animale con il più alto numero di esemplari censiti nei vari parchi della regione__<br /><br />
create view numeroEsemplari(parco,specie,numero) as<br />
select Parchi.nomeParco, Fauna.specie, count(Parchi.nomeParco)<br />
from Fauna, Parchi<br />
where Parchi.codiceParco = Fauna.codiceParco<br />
group by Parchi.nomeParco, Fauna.specie;<br />
select specie,parco<br />
from numeroEsemplari<br />
where numero = (select max(numero));<br />

# Codice

Il sito, tolta la parte grafica che viene strutturata su un template di boostrap, si basa su 4 pagine, che corrispondono alla pagina index.php, alla pagina query.php, in cui viene mostrata la query, la pagina login.php, in cui l’utente può effettuare il login,e la pagina profilo.php in cui vengono mostrate le informazioni dell’utente che ha effettuato il login.<br />
Oltre a queste pagine, il sito viene gestito tramite 2 file, il primo, accedi.php, che viene richiamato dopo che viene effettuato il login e interroga il database per vedere se la mail e la password inserite sono presenti e, se non sono presenti, rimanda l’utente alla pagina di login, altrimenti lo manda alla pagina profilo.php, mentre invece la seconda,logout.php, permette all’utente di effettuare il login dal proprio account, ed una Classe, la Classe connesione presente nel file connessione.php, con cui,
tramite la funzione apriConnessione, riusciamo a connetterci al server per interrogarlo.<br /><br />

__accedi.php__
```
<?
  include_once(__DIR__.'/connessione.php');

  $connessione = Connessione::apriConnessione();

  if(isset($_POST['login'])){
    if(!empty($_POST['mailGuardia']) || !empty($_POST['passwordGuardia'])){
      $mail = $_POST['mailGuardia'];
      $password = hash('sha256',$_POST['passwordGuardia']);
      $queryLogin = $connessione->query("SELECT GuardiaParco.codGuardia FROM GuardiaParco WHERE GuardiaParco.mailGuardia='$mail' AND GuardiaParco.passwordGuardia='$password'");
      if($queryLogin -> num_rows){
        while ($riga = $queryLogin -> fetch_assoc()){
          session_start();
          $_SESSION['codFiscaleGuardia'] = $riga['codGuardia'];
          header('location:profilo.php');
        }
      }else{
        header('location: login.php');
      }
    }else{
      header('location: login.php');
    }
  }
?>
```
![ ](https://github.com/mattiaudisio/prjScuola/blob/master/Maturita/elaborato_audisio/img/03.PNG)
![ ](https://github.com/mattiaudisio/prjScuola/blob/master/Maturita/elaborato_audisio/img/04.PNG)
![ ](https://github.com/mattiaudisio/prjScuola/blob/master/Maturita/elaborato_audisio/img/05.PNG)
![ ](https://github.com/mattiaudisio/prjScuola/blob/master/Maturita/elaborato_audisio/img/06.PNG)