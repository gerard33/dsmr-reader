��    f      L  �   |      �  t   �  �   	     �	     �	  G   
  c   U
  W   �
  �     )   	     3     H     _  S   o     �  �   �    �  �   �     t     �     �     �     �  !   �     �  $        ,     =  %   Y  2    C   �     �  �     �   �    Z     t  =   �     �  2   �        e   /     �  >  �  9   �  �   *  �   �  I   W  �   �  L   U  �   �  $   #  ?   H  #   �  P   �  ~   �  E   |  �   �  r   �  �         �     �  4   �  K     /   _  W   �  w   �  ;  _  R   �   l   �   Q   [!  �   �!  �   �"  =   :#  1   x#  z   �#  �   %$  �   �$  E   �%  S   &      e&  "   �&  �   �&     X'  "   l'  [   �'  r   �'  �   ^(  �   �(  g   �)  �   *  �   �*  Q  r+  �   �,  �   Q-  s   �-  S   \.  i   �.  1   /  �   L/  �   �/    d0     ~1  �  �1  y   :3    �3     �4     �4  K   �4  q   ;5  Z   �5  "  6  )   +7     U7     e7     |7  `   �7     �7  �   8  �   �8  �   �9     m:     :     �:     �:     �:  "   �:     �:     ;      ;     1;  /   M;  a  };  9   �<     =  �   /=  �   �=  �   �>     ~?  V   �?     �?  7   @     <@  s   Z@     �@  �  �@  ?   �B  �   �B  �   cC  K   aD  �   �D  \   YE  �   �E  1   DF  .   vF     �F  k   �F  �   .G  Y   �G  �   H  k   �H  �   "I     �I     �I  9   �I  k   1J  -   �J  i   �J  �   5K    �K  r   �L  ^   9M  Y   �M  �   �M  �   �N  I   �O  1   �O  �   P  �   �P  �   �Q  N   xR  ]   �R  +   %S  (   QS  z   zS  #   �S  "   T  m   <T  �   �T  �   5U  �   �U  i   yV  �   �V  �   ~W    QX  �   hY  �   Z  �   �Z  f   d[  �   �[  E   Y\  �   �\  b   Q]  ?  �]  !   �^         A   :   M   G   Q                  '      D   $   ;          Z       `                W   "   ]      L              b   9   E          c   3   @   S   +      8               X          6       0                  ?      O   =   f      _       F   5          /      T   J      &      P       C           *       H      2       <      ^   
   (   N      ,              K   4   a   d       R                          I   >           )      .   	         U   1   B   V   !   #      \   e   -   [   Y          7   %    (!) Ignore any '*could not change directory to "/root": Permission denied*' errors for the following three commands. (!) Note: **Installation of the requirements below might take a while**, depending on your Internet connection, RaspberryPi speed and resources (generally CPU) available. Nothing to worry about. :] (Option A.) PostgreSQL (Option B.) MySQL/MariaDB **Basic Linux knowledge for deployment, debugging and troubleshooting** **Minimal 100 MB of disk space on RaspberryPi (card)** (for application installation & virtualenv). **OPTIONAL**: Remove the default Nginx vhost (*only when you do not use it yourself*):: **OPTIONAL**: You may skip this section as it's not required for the application to install. However, if you have never read your meter's P1 telegram port before, I recommend to perform an initial reading to make sure everything works as expected. **PostgreSQL 9+ or MySQL / MariaDB 5.5+** **Python 3.3 / 3.4** **RaspberryPi 2 or 3** **Raspbian OS** **Smart Meter** with support for **at least DSMR 4.0/4.2** and **P1 telegram port** **Smart meter P1 data cable** *If you have no idea what to choose, I generally advise to pick PostgreSQL, as it has builtin support for (local) timezone handling (required for DST transitions).* *The reason for splitting the webserver chapter in two steps, is because the application requires the directory created above to exist. And Nginx requires the application to exist (cloned) before running (and to copy its virtual hosts file), resulting in an dependency loop.* *We will now prepare the webserver, Nginx. It will serve all application's static files directly and proxy any application requests to the backend, Gunicorn controlled by Supervisor, which we will configure later on.* 1. Database backend 10. Supervisor 2. Dependencies 3. Application user 4. Webserver/Nginx (part 1) 5. Clone project code from Github 6. Virtualenv 7. Application configuration & setup 8. Bootstrapping 9. Webserver/Nginx (part 2) Activate virtualenv & cd to project:: Although it's just a folder inside our user's homedir, it's very effective as it allows us to keep dependencies isolated or to run different versions of the same package on the same machine. `More information about this subject can be found here <http://docs.python-guide.org/en/latest/dev/virtualenvs/>`_. Can be purchased online and they cost around 15 tot 20 Euro's each. Clone the repository:: Copy application vhost, *it will listen to any hostname* (wildcard), but you may change that if you feel like you need to. It won't affect the application anyway:: Create a new virtualenv, we usually use the same name for it as the application or project. Note that it's important to specify **python3** as the default interpreter:: Create an application superuser. Django will prompt you for a password. The credentials generated can be used to access the administration panel inside the application. Alter username and email if you prefer other credentials, but email is not (yet) used in the application anyway. Create database user:: Create database, owned by the database user we just created:: Create database:: Create folder for the virtualenv(s) of this user:: Create user inside application:: Create user with homedir. The application code and virtualenv will reside in this directory as well:: Dependencies & requirements Did everything install without fatal errors? If either of the database clients refuses to install due to missing files/configs, make sure you've installed ``postgresql-server-dev-all`` (for **PostgreSQL**) or ``libmysqlclient-dev`` (for **MySQL**) earlier in the process, when you installed the database server itself. Did you choose PostgreSQL? Then execute these two lines:: Django will copy all static files to a separate directory, used by Nginx to serve statics. Therefor it requires (write) access to it:: Does Postgres not start due to locales? Try: ``dpkg-reconfigure locales``.  Still no luck? Try editing ``/etc/environment``, add ``LC_ALL="en_US.utf-8"`` and reboot. Each job has it's own configuration file, so make sure to copy them all:: Earlier in this guide you had to choose for either **(A.) PostgreSQL** or **(B.) MySQL/MariaDB**. Our application needs to know which backend used in order to communicate with it. Either proceed to the next heading for a test reading or continue at step 5. Enter these commands (listed after the ``>``). It will ask Supervisor to recheck its config directory and use/reload the files:: Example of everything running well:: Execute this to initialize the database we've created earlier:: Flush privileges to activate them:: Go back to ``root``/``sudo-user`` to config webserver (press ``CTRL + D`` once). I also advice to put the ``cd ~/dsmr-reader`` in there as well, which will cd you directly inside the project folder on login. I highly recommend *PostgreSQL* due to builtin support for timezones. Install MariaDB. You can also choose to install the closed source MySQL, as they should be interchangeable anyway. ``libmysqlclient-dev`` is required for the virtualenv installation later in this guide. Install PostgreSQL, ``postgresql-server-dev-all`` is required for the virtualenv installation later in this guide. Install ``cu``. The CU program allows easy testing for your DSMR serial connection. It's very basic but also very effective to simply test whether your serial cable setup works properly. :: Install database:: Installation It just really helps if you know what you are doing. Let Nginx verify vhost syntax and reload Nginx when ``configtest`` passes:: Login to ``supervisorctl`` management console:: Make sure you are still acting as ``dsmr`` user (if not then enter: ``sudo su - dsmr``) More disk space is required for storing all reader data captured (optional). I generally advise to use a 8+ GB SD card. Now *activate* the environment. It effectively directs all aliases for software installed in the virtualenv to the binaries inside the virtualenv. I.e. the Python binary inside ``/usr/bin/python`` won't be used when the virtualenv is activated, but ``/home/dsmr/.virtualenvs/dsmrreader/bin/python`` will be instead. Now is the time to clone the code from the repository into the homedir we created. Now it's time to bootstrap the application and check whether all settings are good and requirements are met. Now login as the user we have just created, to perform our very first reading! :: Now we configure `Supervisor <http://supervisord.org/>`_, which is used to run our application's web interface and background jobs used. It's also configured to bring the entire application up again after a shutdown or reboot. Now you'll have to install several utilities, required for the Nginx webserver, Gunicorn application server and cloning the application code from the Github repository:: Or did you choose MySQL/MariaDB? Execute these two commands:: Or test with ``cu`` for **DSMR 2.2** (untested):: Our user also requires dialout permissions. So allow the user to perform a dialout by adding it to the ``dialout`` group:: Please note that due to Supervisor's output buffering **it might take a minute or two before you see any output**. You should see similar output as the ``cu``-command printed earlier in the installation process. Prepare static files for webinterface. This will copy all static files to the directory we created for Nginx earlier in the process. It allows us to have Nginx serve static files outside our project/code root. RaspberryPi 1 should work decently, but I do not actively support it. Recommended and tested with, but any OS satisfying the requirements should do fine. Set password for database user:: Set privileges for database user:: Since you have shell access you may reset your user's password at any time (in case you forget it). Just enter this for a password reset: ``./manage.py changepassword admin`` Sync static files:: Test with ``cu`` for **DSMR 4+**:: Tested so far with Landis+Gyr E350, Kaifa. Telegram port looks like an RJ11 (phone) socket. The ``base.txt`` contains requirements which the application needs anyway, no matter which backend you've choosen. The application runs as ``dsmr`` user by default. This way we do not have to run the application as ``root``, which is a bad practice anyway. The application stores by default all readings taken from the serial cable. Depending on your needs, you can choose for either (Option A.) **PostgreSQL** (Option B.) **MySQL/MariaDB**. The dependencies our application uses are stored in a separate environment, also called **VirtualEnv**. The installation guide may take about *half an hour max* (for raspberryPi 2/3), but it greatly depends on your Linux skills and whether you need to understand every step described in this guide. The readings will take 90+ %% of the disk space. I plan however to add some kind of retention to it later, keeping the data (of many years) far below the 500 MB. Therefor I created two default (Django-)settings files you can copy, one for each backend. The application will also need the appropriate database client, which is not installed by default. For this I also created two ready-to-use requirements files, which will also install all other dependencies required, such as the Django framework. This may take a few seconds. When finished, you should see a new folder called ``dsmr-reader``, containing a clone of the Github repository. Three processes should be started or running. Make sure they don't end up in ``ERROR`` or ``BACKOFF`` state, so refresh with '``status``' a few times. To exit cu, type "``q.``", hit Enter and wait for a few seconds. It should exit with the message ``Disconnected.``. Want to check whether the datalogger works? Just tail it's log in supervisor with:: Want to quit supervisor? ``CTRL + C`` to stop tail and ``CTRL + D`` once to exit supervisor command line. When still in ``supervisorctl``'s console, type:: You might want to put the ``source ~/.virtualenvs/dsmrreader/bin/activate`` command above in the user's ``~/.bashrc`` (logout and login to test). You now should have everything up and running! We're almost done, but only need to check a just few more things in the next chapters. You now should see something similar to ``Connected.`` and a wall of text and numbers *within 10 seconds*. Nothing? Try different BAUD rate, as mentioned above. You might also check out a useful blog, `such as this one (Dutch) <http://gejanssen.com/howto/Slimme-meter-uitlezen/>`_. Your first reading (optional) Project-Id-Version: DSMR Reader 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2016-04-06 20:19+0200
PO-Revision-Date: 2016-04-06 20:24+0100
Last-Translator: Dennis Siemensma <dsmr@dennissiemensma.nl>
Language-Team: Dennis Siemensma <dsmr@dennissiemensma.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.2.0
Language: nl
X-Generator: Poedit 1.5.4
 (!) Negeer voor de volgende drie commando's de foutmelding: '*could not change directory to "/root": Permission denied*'. (!) let op: **De installatie van de volgende afhankelijkheden kan enige tijd in beslag nemen**. Dit varieert en is sterk afhankelijk van de snelheid van je Internet-verbinding en je raspberryPi. Je hoeft je dus niet zorgen te maken wanneer dit lang lijkt te duren. :] (Keuze A.) PostgreSQL (Keuze B.) MySQL/MariaDB **Basiskennis Linux voor het uitrollen en mogelijk debuggen van problemen** **Miminaal 100 MB schijfruimte vereist op RaspberryPi (SD-kaart)** (ten behoeve van de applicatie en virtualenv). **OPTIONEEL**: Verwijder de standaard vhost van Nginx wanneer je deze niet zelf gebruikt:: **OPTIONEEL**: Je kunt deze stap overslaan wanneer je al eerder een (test)meting hebt gedaan met je slimme meter. Ik raad het dus vooral aan als je nog nooit eerder je P1-poort hebt uitgelezen. Hiermee verzeker je jezelf ook dat de applicatie straks dezelfde toegang heeft voor de metingen. **PostgreSQL 9+ of MySQL / MariaDB 5.5+** **Raspbian OS** **RaspberryPi 2 of 3** **Raspbian OS** **Slimme meter** met ondersteuning voor **ten minste DSMR 4.0/4.2** en een **P1 telegram poort** **Slimme meter P1 data kabel** *Als je geen idee hebt wat je moet kiezen, dan adviseer ik doorgaans om PostgreSQL te kiezen. Dit vanwege de uitstekende ingebouwde ondersteuning voor tijdzones (nodig voor zomer-/wintertijd).* *Het configureren van de webserver kan alleen in twee stappen, omdat de applicatie de bovenstaande map nodig heeft, maar Nginx heeft weer de applicatie eerst nodig. Hiermee krijg je een kip-ei verhaal.* *We configureren vervolgens de webserver (Nginx). Deze serveert alle statische bestanden en geeft alle applicatie-verzoeken door naar de backend, waar Gunicorn draait onder Supervisor. Deze stellen we later in.* 1. Databaseopslag 10. Supervisor 2. Afhankelijkheden 3. Applicatiegebruiker 4. Webserver/Nginx (deel 1) 5. Kloon project code vanaf Github 6. Virtualenv 7. Applicatieconfiguratie 8. Initialisatie 9. Webserver/Nginx (deel 2) Activeer virtualenv & wissel map naar project:: Dit is allemaal erg handig, ondanks dat het feitelijk niets meer voorstelt dan een aparte map binnen de homedir van onze gebruiker. Hierdoor kunnen we namelijk meerdere versie van software op hetzelfde systeem installeren, zonder dat dat elkaar bijt. Meer informatie `kan hier gevonden worden <http://docs.python-guide.org/en/latest/dev/virtualenvs/>`_. Je kunt deze online bestellen voor ongeveer 15 a 20 Euro. Kloon de repository:: Kopieer de vhost voor de applicatie. Deze luistert standaard naar *elke hostname* (wildcard), maar dat is natuurlijk naar eigen wens aan te passen.:: Maak een nieuwe virtualenv aan. Het is gebruikelijk om hiervoor dezelfde naam te gebruiken als die van de applicatie of het project. Let op dat je voor dit project aangeeft dat **python3** de gewenste standaardversie voor Python is:: Maak een gebruiker aan binnen de applicatie. Django vraagt je om een wachtwoord te kiezen. Met deze gegevens (standaard gebruikersnaam is 'admin') kun je het beheerderspaneel binnen de applicatie gebruiken. Creëer databasegebruiker:: Creëer database, met als eigenaar de databasegebruiker die we net hebben aangemaakt:: Creëer database:: Maak map aan voor de virtualenv(s) van deze gebruiker:: Creëer applicatiegebruiker:: Maak een aparte gebruiker aan met eigen homedir. De code voor de applicatie en virtualenv zetten we later hier in:: Afhankelijkheden & vereisten Zonder problemen alles kunnen installeren? Mocht een van de database clients niet willen installeren wegens missende bestanden, controleer dan of je eerder tijdens de installatie het volgende hebt gedaan. Als het goed is heb je ``postgresql-server-dev-all`` (voor **PostgreSQL**) of ``libmysqlclient-dev`` (voor **MySQL**) geïnstalleerd, tegelijkertijd met de databaseserver. Die zijn namelijk hiervoor nodig. Heb je gekozen voor PostgreSQL? Voer dan deze twee regels uit:: Django kopieert alle statische bestanden naar een aparte map, die weer door Nginx gebruikt wordt. Daarom heeft Django er tevens (schrijf)toegang toe nodig:: Start PostgreSQL niet wegens een fout in 'locales'? Probeer dan het volgende: ``dpkg-reconfigure locales``. Werkt het nog steeds niet? Open dan dit bestand `/etc/environment``, voeg onderaan de regel ``LC_ALL="en_US.utf-8"`` toe en herstart het systeem. Elk process heeft zijn eigen configuratiebestand, dus kopieer ze allemaal:: Eerder tijdens de installatie moest je kiezen voor ofwel **(A.) PostgreSQL** ofwel **(B.) MySQL/MariaDB**. De applicatie moet ook weten met welke variant hij communiceert. Ga ofwel door naar het volgende hoofdstuk voor een testmeting of ga direct door naar stap 5. Voer de volgende commando's in (degene na de ``>``). Dit zorgt ervoor dat Supervisor zijn eigen configuratie opnieuw controleert en toepast:: Voorbeeld van wanneer alles naar behoren draait:: Voer dit uit om de database te initialiseren:: Pas de databaserechten toe:: Ga terug naar de ``root``/``sudo-gebruiker`` om de webserver in te stellen (druk eenmalig op ``CTRL + D``). Ik raad je aan om ``cd ~/dsmr-reader`` er ook in op te nemen, zodat je telkens bij het inloggen als deze gebruiker in de juist map zit. Ik raad **PostgreSQL** sterk aan wegens de goede ingebouwde ondersteuning voor tijdzones. Installeer MariaDB. Je kunt er ook voor kiezen om het closed-source MySQL te installeren. Wat je ook kiest, ``libmysqlclient-dev`` is later nodig voor de virtualenv. Installeer PostgreSQL. ``postgresql-server-dev-all`` is nodig voor het installeren van de virtuelenv later. Installeer ``cu``. Met dit programmaatje kunnen we vrij gemakkelijk de DSMR-verbinding testen naar je slimme meter toe. Erg handig om te kijken of dat überhaupt al lekker werkt. Installeer database:: Installatie Het scheelt eenmaal een hoop wanneer je weet wat je doet. Laat Nginx controleren of je geen typefouten hebt gemaakt en herlaad Nginx wanneer de ``configtest`` lukt:: Wissel naar ``supervisorctl`` beheerconsole:: Zorg ervoor dat je nog steeds ingelogd bent als ``dsmr``-gebruiker (zo niet, typ dan: ``sudo su - dsmr``) Meer schijfruimte is nodig voor het opslaan van alle metingen (optioneel). Over het algemeen adviseer ik minimaal een 8 GB SD-kaart. Tijd om de omgeving te *activeren*. Hierdoor worden diverse aliassen voor software binnen deze omgeving veranderd naar die van de virtualenv. Voor bijvoorbeeld Python wordt niet meer ``/usr/bin/python``gebruikt, maar ``/home/dsmr/.virtualenvs/dsmrreader/bin/python``. Nu kunnen we de code van de applicatie van Github downloaden en in de homedir zetten die we net aangemaakt hebben. Tijd om te kijken of alles goed is ingesteld. We gaan de applicatie proberen te initialiseren. Log nu in als de gebruiker die we zojuist hebben aangemaakt voor de eerste testmeting! :: We gaan nu `Supervisor <http://supervisord.org/>`_ configureren, die gebruikt wordt om de applicatie en achtergrondprocessen te draaien. Tevens zorgt Supervisor ervoor dat deze processen bij het (opnieuw) opstarten automatisch draaien. Tijd om diverse tools te installeren. Deze zijn nodig voor de Nginx webserver, de Gunicorn applicatieserver en voor het binnenhalen van de code van de applicatie vanaf Github:: Of heb je gekozen voor MySQL/MariaDB? Voer dan deze twee commando's uit:: Of test met ``cu`` voor **DSMR 2.2** (ongetest):: De gebruiker heeft ook toegang nodig om de kabel te kunnen uitlezen. Hiervoor voegen de we gebruiker toe aan de groep ``dialout``:: Doordat Supervisor de **logbestanden buffert** kan het een minuut of twee duren voordat je daadwerkelijk wat terugziet. Uiteindelijk zou je ongeveer dezelfde lap tekst moeten zien als toen we handmatig gemeten hebben met het ``cu``-programma. Prepareer statische bestanden voor de webinterface. Dit kopieert alle statische bestanden in de map die we eerder tijdens de installatie voor Nginx hebben aangemaakt. Het zorgt ervoor dat Nginx deze bestanden kan hosten buiten de code-bestanden. RaspberryPi 1 zou redelijk moeten werken, maar ik ondersteun deze niet actief. Aanbevolen en mee getest, al zou elk OS die dezelfde vereisten ondersteunt prima moeten zijn. Stel wachtwoord in voor databasegebruiker:: Stel rechten in voor databasegebruiker:: Wachtwoord ooit vergeten? Via de command line kun je je wachtwoord hiermee aanpassen: ``./manage.py changepassword admin`` Synchroniseer statische bestanden:: Test met ``cu`` voor **DSMR 4+**:: Tot nu toe getest met Landis+Gyr E350, Kaifa. Telegram poort ziet er uit als een RJ11 (telefoon) aansluiting. Het bestande``base.txt`` bevat alle afhankelijkheden die de applicatie sowieso nodig heeft, ongeacht de databasekeuze die je gemaakt hebt. De applicatie draait standaard onder de gebruiker ``dsmr``. Hierdoor heeft het geen ``root``-rechten (nodig), wat over het algemeen zeer afgeraden wordt. De applicatie slaat alle metingen op in een database. Afhankelijk van je wensen en behoeftes heb je de keuze uit: (Keuze A.) **PostgreSQL** (Keuze B.) **MySQL/MariaDB**. Alle (externe) afhankelijkheden worden opgeslagen in een aparte omgeving, ook wel **VirtualEnv** genoemd. Het installeren duurt naar verwachting zo'n *half uur* (op een RaspberryPi 2/3), maar hangt natuurlijk erg af van je eigen vaardigheid op de command line. De ruwe metingen nemen ongeveer 90+ %% van de schijfruimte in gebruik. Ik bouw later overigens nog wel een optie in voor retentie, waardoor je de gegevens over meerdere jaren ruimschoots onder de 500 MB krijgt. Daarom heb ik twee standaard (Django-)configuraties gemaakt die je gewoon kan kopiëren. Daarnaast heeft elke database zijn eigen database-client nodig. Daarom heb ik ook een tweetal requirements-bestanden gemaakt, waar alles al in staat wat nodig is. Zoals bijvoorbeeld Django. Dit kan enkele seconden in beslag nemen. Als het goed is zie je hierna een map genaamd ``dsmr-reader``, met daarin een kopie van de repository zoals die op Github staat. Er draaien als het goed is altijd drie processen. Kijk goed of ze uiteindelijk niet in ``ERROR`` of ``BACKOFF`` status terecht zijn gekomen. Je kunt het overzicht verversen door ``status`` te typen. Om cu af te sluiten, typ "``q.``", druk op Enter en wacht voor een paar seconden. Het programma sluit af met de melding ``Disconnected.``. Wil je controleren of de datalogger zijn werk goed doet? Bekijk dan het logbestand in supervisor met:: Wil je uit supervisor?  Druk dan op ``CTRL + C`` om de logfile niet meer te bekijken en vervolgens op ``CTRL + D`` om uit supervisor te gaan. Typ het volgende wanneer je nog in ``supervisorctl``'s console bent:: Het is aan te raden om ``source ~/.virtualenvs/dsmrreader/bin/activate`` op te nemen in de ``~/.bashrc``van de gebruiker. Vervolgens kun je het testen door uit- en in te loggen. Alles zou nu moeten werken! We zijn bijna klaar, op een paar checks na in de komende hoofdstukken. Je zou nu iets moeten zien als ``Connected.``. Vervolgens krijg je, als het goed is, binnen tien seconden een hele lap tekst te zijn met een hoop cijfers. Werkt het niet? Probeer dan een andere BAUD-waarde, zoals hierboven beschreven. Of `kijk op een nuttig weblog <http://gejanssen.com/howto/Slimme-meter-uitlezen/>`_. Je allereerste (optionele) meting 