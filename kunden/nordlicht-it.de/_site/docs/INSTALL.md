nordlicht-it.de
==========

Diese Webseite wird mit dem 'static page generator' jekyll generiert. Dieses Dokument
beschreibt die Installation und die Benutzung von jekyll, sowie das 'markdown' Format 
mit dem Webseiten erstellt und modifiziert werden.



## Installation von jekyll

Der 'static page generator' jekyll ist in ruby implementiert, es muss daher eine aktuelle
ruby Version installiert sein. Minimale Anforderung ist ruby 1.9.

Auf der offiziellen Webseite kann ein installer für alle gängigen Betriebssysteme heruntergeladen werden:

	* https://www.ruby-lang.org/de/
	* https://www.ruby-lang.org/de/downloads/
	
Ein Paket das alle Abhängigkeiten für Windows enthält findet sich unter:
	
	* http://railsinstaller.org/en

Jekyll steht als 'ruby gem' zur Verfügung. In einer Konsole kann jekyll mit dem einfachen Befehl

	$ gem install jekyll
	
installiert werden. Zusammen mit jekyll werden alle abhängigen Pakete mit installiert.

Alle weiteren Informationen zu jekyll sind auf der offiziellen Webseite des Projekts dokumentiert:

	* http://jekyllrb.com/



## Benutzung von jekyll

Im Verzeichnis des Webseitenprojekts kann ein lokaler Webserver mit der aktuellen Version
der Webseite mit dem folgenden Kommando in einer Konsole gestartet werden:

	$ jekyll serve --watch
	
Die Webseite steht im Browser unter dem Pfad http://127.0.0.1:4000 zur Verfügung. Die Formulare
funktionieren hier allerdings nicht, da die der Server nur statische Seiten ausliefern kann. Um die
Funktion der Formulare zu testen, muss entweder der Produktivserver oder eine lokale Installation
eines "echten" Webservers verwendet werden.


Um die Seite für einen Upload auf den externen Webserver zu generieren, muss

	$ jekyll build
	
ausgeführt werden. Die generierte Webseite liegt dann im ./_site Verzeichnis des Projekts.



## Konfiguration der Webseite

In der Datei '_config.yml' müssen die folgenden Einstellungen getätigt werden:

title: Der Titel der Webseite
email: Standard Email-Empfänger
description: Der Text, der im google Suchergebnis angezeigt werden soll


Für die Email Formulare muss in der jeweiligen Datei die Empfänger-Adresse angegeben werden:

	$to = "" // this is your Email address

	* mailer-rueckruf.php
	* mailer-anfrage.php
	* mailer-bogner.php
	* mailer-fietzek.php
	* mailer-fandi.php
