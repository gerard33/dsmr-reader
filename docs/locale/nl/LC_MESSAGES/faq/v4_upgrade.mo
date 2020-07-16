��    *      l  ;   �      �  (   �     �  !   �  &     #   ;     _  	   u  )     e   �  :        J     Z     q  >   �     �  �   �  n   Z  �   �     x  $   �     �  %   �  �   �  %   �  L   �  �   �  _   �	  �   �	  T   �
  8   �
       �   +  w   �  �   =  �   �  1   �  C   �  �     �   �     a  )     �  �  0   M  "   ~  #   �  (   �  #   �       	   -  ,   7  d   d  B   �          "     9  ;   V     �  �   �  s   &  �   �     U  &   m     �  *   �  �   �     e  J   �  �   �  k   m  �   �  `   �  A        Y  �   o  �   4  �   �  �   �  2   @  >   s  �   �  �   L     =  +   \                  $                             #      %           )                    
   (         "      '                                                              *              	          !      &    1. Update to the latest ``v3.x`` version 2. Install ``python3-psycopg2`` 3. Switch DSMR-reader to ``v4.x`` 4. Migrate ``settings.py`` to ``.env`` 5. Generate your own ``SECRET_KEY`` 6. Drop ``dsmr_mqtt`` 7. Deploy :doc:`See here for instructions<update>`. :doc:`See the changelog<../changelog>`, for ``v4.x releases`` and higher. Check them before updating! Also, the other processes should be running as well again. Apply changes:: Backwards incompatible Check the configuration with:: Check whether the script updated your ``.env`` file properly:: Contents DSMR-reader ``v4.x`` is backwards incompatible with ``3.x``. You will have to manually upgrade to make sure it will run properly. DSMR-reader ``v4.x`` lives in a different branch, to prevent any users from unexpectedly updating to ``v4.x``. DSMR-reader started with a ``settings.py`` for your local settings. This has some disadvantages, especially regarding today's industry standards and how Docker works as well. Execute the following:: Finally, execute the deploy script:: For example:: Great. You should now be on ``v4.x``! If you find any differences (e.g. different database credentials or host), update the ``.env`` file accordingly. The format should be straight forward. If you run into the following error:: If you're getting any errors, you can revert to the old version by running:: If you're using Docker, you can probably just install the ``v4.x`` version of the Docker container without having to perform any of the steps below. If you're using PostgreSQL, the default for DSMR-reader, install the following system package:: If you've installed Python ``3.6`` or higher manually and the default Python version is below ``3.6``, make sure to specify it in the ``virtualenv`` command above. Is ``dsmr_mqtt`` listed? If **not listed**, skip this chapter. Otherwise remove it:: It should display the key generated when you execute it. List of changes Not all previously supported settings are also available in ``.env``. See :doc:`Env Settings for the latest list of env vars supported<../env_settings>`. Now check the settings you were using in ``dsmrreader/settings.py.BACKUP``. Compare them with the defaults in ``.env``. Please note that ``DSMRREADER_PLUGINS`` is now a comma separated list. Chances are however very slim that you were using ``DSMRREADER_PLUGINS`` at all (advanced users only). Previous versions had a hardcoded value for ``SECRET_KEY``. This was fine while running DSMR-reader in your home network, but it is not recommended for public facing instances. Revert the ``psycopg2`` installation above with:: The ``dsmr_mqtt`` process has been merged with to ``dsmr_backend``. Therefor the configuration has been migrated to a ``.env`` file and system env vars are now supported as well. Follow these steps to migrate:: To prevent some users from forgetting to set a custom secret key, DSMR-reader now simply requires everyone to generate a unique ``SECRET_KEY`` locally during installation (or when upgrading). Upgrading to DSMR-reader v4.x You should not see ``dsmr_mqtt`` anymore. Project-Id-Version: DSMR Reader
Report-Msgid-Bugs-To: Dennis Siemensma <github@dennissiemensma.nl>
Last-Translator: Dennis Siemensma <github@dennissiemensma.nl>
Language: nl
Language-Team: Dennis Siemensma <github@dennissiemensma.nl>
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.8.0
X-Generator: Poedit 2.0.6
 1. Update naar de meeste recente ``v3.x`` versie 2. Installeer ``python3-psycopg2`` 3. Wissel DSMR-reader naar ``v4.x`` 4. Migreer ``settings.py`` naar ``.env`` 5. Genereer je eigen ``SECRET_KEY`` 6. Verwijder ``dsmr_mqtt`` 7. Deploy :doc:`Zie hier voor de instructies<update>`. :doc:`Zie de changelog<../changelog>`, voor ``v4.x releases`` en hoger. Bekijk ze voordat je update! Daarnaast zouden de andere processing nu weer goed moeten draaien. Pas wijzigingen toe:: Backwards incompatible Bekijk de configuratie net:: Controleer of het script je ``.env`` goed heeft aangepast:: Inhoudsopgave DSMR-reader ``v4.x`` is backwards incompatible met ``3.x``. Je zult handmatig moeten upgraden om ervoor te zorgen dat het goed werkt. DSMR-reader ``v4.x`` leeft in een aparte branch, om te voorkomen dat gebruikers per ongeluk upgraden naar ``v4.x``. DSMR-reader is begonnen met een ``settings.py`` voor je lokale instellingen. Dit heeft wat nadelen, helemaal gezien de standaarden vandaag de dag en tevens in het licht hoe Docker werkt. Voer het volgende uit:: Tot slot, voer het deploy-script uit:: Bijvoorbeeld:: Mooi! Je zou nu op ``v4.x`` moeten zitten! Als je verschillen vindt (bijvoorbeeld andere database-gegevens), werkt dan het ``.env`` bestand bij. Het formaat zou recht toe recht aan moeten zijn. Als je de volgende fout ziett:: Als je tegen fouten aanloopt, dan kun je terug naar de vorige versie met:: Indien je Docker gebruikt, kun je vermoedelijk gewoon de ``v4.x`` versie van de Docker container gebruiken, zonder onderstaande stappen te hoeven uitvoeren. Wanneer je PostgreSQL gebruikt, de standaard voor DSMR-reader, installeer dan de volgende systeem package:: Als je ooit Python ``3.6`` of hoger handmatig hebt geinstalleerd, en de standaard Python-versie op het systeem is lager dan ``3.6``, zorg er dan voor dat je dit expliciet opgeeft in het ``virtualenv`` commando hierboven. Wordt ``dsmr_mqtt`` getoond? Zo niet, sla de rest van dit hoofdstuk over. Zo ja, verwijder het:: Het zou de gegenereerde key moeten tonen wanneer je het uitvoert. Lijst van wijzigingen Niet alle instellingen zijn nog steeds of onder dezelfde naam beschikbaar in de nieuwe ``.env``. Zie :doc:`Env-instellingen voor de meest recente lijst van ondersteunde env vars<../env_settings>`. Bekijk nu je instellingen in ``dsmrreader/settings.py.BACKUP`` die je tot nu toe gebruikte. Vergelijk ze met de standaardinstellingen in ``.env``. N.B.: ``DSMRREADER_PLUGINS`` is nu een komma-gescheiden lijst. De kans is overigens zeer klein dat je uberhaupt ``DSMRREADER_PLUGINS`` tot nu toe hebt gebruikt (alleen voor geavanceerde gebruikers). Vorige versies hadden een vaste waarde voor ``SECRET_KEY``. Dit was prima voor DSMR-reader binnen je eigen netwerk, maar niet wanneer het publiekelijk op Internet bereikbaar is. Zet de vorige ``psycopg2`` installatie terug met:: Het ``dsmr_mqtt`` proces is samengevoegd met ``dsmr_backend``. Daarom is de configuratie voortaan via een ``.env`` bestand en is er ook standaardondersteuning voor systeem env vars. Volg deze stappen om te migreren:: Om te voorkomen dat sommige gebruikers in die situatie vergeten om handmatig een eigen key in te stellen, vereist DSMR-reader vanaf nu dat iedereen een eigen ``SECRET_KEY`` genereert. Ofwel tijdens de installatie ofwel tijdens het upgraden. Upgraden naar DSMR-reader v4.x Je zou ``dsmr_mqtt`` niet meer moeten zien. 