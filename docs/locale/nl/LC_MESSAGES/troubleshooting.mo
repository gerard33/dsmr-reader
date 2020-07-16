��    '      T  5   �      `  `   a  	   �  l   �     9  x   O     �     �  (   �       |   
  
   �  �   �  �   "  M   �     �  C        T  @   \  %   �  F   �  -   
  '   8  w   `  
   �  �   �  t   f	  '   �	     
     
  5    
  *   V
  .   �
  (   �
  +   �
  -        3     D     X    n  p   w     �  �   �     r  f   �     �     �  .   �     -  �   ;  
   �  �   �  �   �  Q   <     �  ?   �     �  Q   �  $   E  >   j  8   �  (   �  �     
   �  �   �  j   K  $   �     �     �  O   �  *   K  .   v  (   �  +   �  -   �     (     9     M                                        '                                      %                           !   
   "      	          $             &                                 #    After editing the file, all processes need to be restarted. To do this, you can either execute:: All done! Any processes listed, should have the status ``RUNNING``. Stale or crashed processes can be restarted with:: Appplication / Django Are you unable to resolve your problem or do you need any help? :doc:`More information can be found here<contributing>`. Backend Contact Contains application logging, if enabled Contents DSMR-reader technically consists of these processes (some may or may not be used by you) and they are watched by Supervisor: Datalogger If anything happens to fail or malfunction, please follow the steps below first to provide some background information when reporting an issue. If the processes do run, but you cannot find an error, (e.g.: things seem to hang or tend to be slow), there might be another issue at hand. If this does not resolve your issue, check the logfiles for more information: It should now be:: Lists any internal errors regarding the Django framework it's using Logging Make sure you are ``dsmr`` user by executing ``sudo su - dsmr``. Now remove the ``#`` from this line:: Open the ``dsmrreader/settings.py`` file and look for the code below:: Or go back to the **sudo user** and execute:: Or to restart them all simultaneously:: Please note that any errors in there are most likely regarding rejected telegrams and are unlikely causing your issue:: Supervisor The DEBUG-logging is disabled by default, to reduce writes on the filesystem. You can enable the logging by following these steps: The application has its own logfiles as well. You can find them in the ``logs`` directory inside the project folder. The logfiles are by default located in: Troubleshooting Webinterface You can view the status of all processes by running:: ``/home/dsmr/dsmr-reader/logs/django.log`` ``/home/dsmr/dsmr-reader/logs/dsmrreader.log`` ``/var/log/supervisor/dsmr_backend.log`` ``/var/log/supervisor/dsmr_datalogger.log`` ``/var/log/supervisor/dsmr_webinterface.log`` ``dsmr_backend`` ``dsmr_datalogger`` ``dsmr_webinterface`` Project-Id-Version: DSMR Reader 1.x
Report-Msgid-Bugs-To: 
Last-Translator: 
Language: nl
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.8.0
 Na het bewerken van het bestand zul je alle processen moeten herstarten. Om dit te doen, voer het volgende uit:: Klaar! Elk proces dat getoond wordt zou de status ``RUNNING`` moeten hebben. Hangende of gecrashde processen kunnen herstart worden met:: Appplicatie / Django Kom je er toch niet uit of heb je hulp nodig? :doc:`Meer informatie kun je hier vinden<contributing>`. Backend Contact Bevat applicatie-logging, wanneer ingeschakeld Inhoudsopgave DSMR-reader bestaat technisch uit deze processen (sommigen zullen wel of niet in je eigen situatie gebruikt worden) en ze worden beheerd door Supervisor: Datalogger Wanneer er iets lijkt mis te gaan, volg de onderstaande stappen eerst, voordat je een issue aanmaakt. Hiermee kun je wat meer achtergrondinformatie aanleveren. Wanneer de processen lijken te draaien, maar je kunt geen fout vinden (bijvoorbeeld als telegrammen hangen of de verwerking traag lijkt), dan is er waarschijnlijk iets anders aan de hand. Wanneer dit niet je probleem oplost, bekijk de logbestanden voor meer informatie: Het zou nu dit moeten zijn:: Bevat interne foutmeldingen over het gebruikte Django framework Logging Zorg ervoor dat je ``dsmr`` gebruiker bent door ``sudo su - dsmr`` uit te voeren. Verwijder nu de ``#`` uit de regel:: Open ``dsmrreader/settings.py`` en zoek de onderstaande code:: Of ga terug naar de **sudo gebruiker** en voer dit uit:: Of herstart ze allemaal tegelijkertijd:: N.B.: Waarschijnlijk staan er in de meeste gevallen fouten in die verder niets te maken hebben met jouw probleem, maar met afgewezen telegrammen:: Supervisor De DEBUG-logging is standaard uitgeschakeld, om het aantal schrijfacties op het bestandssysteem te beperken. Je kunt het inschakelen door deze stappen te volgen: De applicatie heeft ook eigen logfiles. Je kunt deze vinden in de ``logs`` directory binnen de projectmap.  De logbestanden staan standaard in: Hulp bij problemen Webinterface Je kunt de status van alle processen bekijken door het volgende uit te voeren:: ``/home/dsmr/dsmr-reader/logs/django.log`` ``/home/dsmr/dsmr-reader/logs/dsmrreader.log`` ``/var/log/supervisor/dsmr_backend.log`` ``/var/log/supervisor/dsmr_datalogger.log`` ``/var/log/supervisor/dsmr_webinterface.log`` ``dsmr_backend`` ``dsmr_datalogger`` ``dsmr_webinterface`` 