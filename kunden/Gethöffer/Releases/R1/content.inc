<?php

function content()
{
	$content = "";

	switch ($_REQUEST["pid"])
	{
		default:
		case 1:
			$content .= "
			<h1>Willkommen auf unserer Website! </h1>
			Sie finden hier alle wichtigen Informationen &uuml;ber unser Unternehmen.<br><br>
			Sollten Sie Fragen haben, schicken Sie uns eine Email &uuml;ber das Kontaktformular!<br><br>
			<b>
			Thomas Geth&ouml;ffer<br>
			Karosserie- und Fahrzeugbau<br><br>

			LKW Verkauf - Vermietung - Reparatur<br>
			DAF Service Dealer<br><br>

			Franz-Kruckenberg-Stra&szlig;e 13<br>
			25436 Uetersen<br><br>

			Tel.: 04122 / 92 77 -0<br>
			Fax: 04122 / 92 77 -20<br><br>
			</b>
			";
			break;

		case 2:
			$content .= "
			<h1>&Uuml;ber uns</h1>
			Sehr geehrte Damen und Herren,<br><br>

			wir  m&ouml;chten Ihnen unser Unternehmen in Kurzform vorstellen und einen Einblick in unsere Gesch&auml;ftsfelder und unser Leistungsspektrum gew&auml;hren.<br><br>
			<table border=0 id=\"history\">
			<tr><td>
			1984
			</td><td>
			gr&uuml;ndete der Karosserie- und Fahrzeugbau-Meister Thomas Geth&ouml;ffer, in einer kleinen Schmiede in Uetersen, das Unternehmen.
			</td></tr>

			<tr><td>
			1989
			</td><td>
			Unterzeichnung DAF-H&auml;ndler Vertrag.
			</td></tr>

			<tr><td>
			1990
			</td><td>
			wurde das Betriebsgel&auml;nde in der Franz-Kruckenberg-Stra&szlig;e in Uetersen erworben und eine 2-bahnige LKW-Reparatur Werkstatt mit kleinem B&uuml;ro und Lager erbaut.
			</td></tr>

			<tr><td>
			1992
			</td><td>
			entstand eine Pr&uuml;fhalle mit Bremsenpr&uuml;fstand.
			</td></tr>

			<tr><td>
			2000
			</td><td>
			Erweiterung und Modernisierung B&uuml;ro und Ersatzteilelager inkl. &Ouml;lf&ouml;rderanlage.
			</td></tr>
			</table><br><br>

			Heute stellt Firma Geth&ouml;ffer ein modernes Familien-Unternehmen rund um das Nutzfahrzeug dar. Aktuell sind 19 Mitarbeiter in den drei Bereichen LKW-Verkauf, -Vermietung und -Reparatur, die das Kerngesch&auml;ft darstellen, besch&auml;ftigt. <br><br>

			Im Bereich Verkauf werden Neufahrzeuge der Marke DAF nach Kundenwunsch spezifiziert, branchenoptimierte L&ouml;sungen ausgearbeitet und individuell zusammengestellt. Zum Verkauf geh&ouml;ren auch entsprechende Finanzierungsangebote, sowie die komplette Abwicklung bis zur Erstzulassung des LKW. Gebrauchtfahrzeuge werden national wie auch international vertrieben.<br><br>

			Die LKW-Vermietung verf&uuml;gt mittlerweile &uuml;ber mehr als 40 Fahrzeuge, vom 2,6-Tonnen Kastenwagen bis hin zum 40 Tonnen Sattelzug wird alles geboten. Die Fahrzeuge laufen &uuml;berwiegend in Langzeitmietvertr&auml;gen, aber auch im Kurzzeitmietbereich bleiben keine W&uuml;nsche offen.<br><br>

			Es werden LKW und Anh&auml;nger aller Art und Hersteller repariert, gewartet und gesetzlich untersucht. Spezielle Kundenw&uuml;nsche werden angefertigt, Getriebe und Motoren &uuml;berholt, und auch Unfallsch&auml;den instandgesetzt. Ersatzteile und Zubeh&ouml;r werden marken&uuml;bergreifend vertrieben. <br><br>

			Auf dem rund 10.000 m² gro&szlig;en Gel&auml;nde, in zwei Geb&auml;uden mit insgesamt f&uuml;nf Bahnen, mehreren B&uuml;ror&auml;umen, zwei L&auml;gern, einer Metallwerkstatt und einer Waschhalle dreht sich sechsmal die Woche alles um Reparatur, Aufr&uuml;stung und Pflege von LKW.<br><br>

			<b><u>Leistungs&uuml;bersicht:</u></b><br>

			<ul>
			<li>An- und Verkauf von Nutzfahrzeugen</li>
			<li>Verkauf DAF Neufahrzeuge</li>
			<li>Leasing-, Mietkauf- und Kreditvermittlung</li>
			<li>LKW-Vermietung 2,6-40t</li>
			<li>LKW-Wartung und Reparatur aller Marken</li>
			<li>LKW-Motorreparatur</li>
			<li>Reparatur-Ersatzfahrzeug-Gestellung</li>
			<li>LKW-Getriebereparatur</li>
			<li>Reparatur und Abwicklung von Unfallsch&auml;den</li>
			<li>Ersatzteile und Zubeh&ouml;r</li>
			<li>Anh&auml;nger und Aufbauten, Wartung und Reparatur</li>
			<li>digitale Tachographen</li>
			<li>Gesetzliche Untersuchungen §19, §29 und §57b</li>
			<li>T&Uuml;V und Dekra-Station</li>
			<li>Sicherheitspr&uuml;fungen</li>
			<li>Langzeitvermietung von LKW-Parkpl&auml;tzen</li>
			</ul><br><br>
			T&Uuml;V und DEKRA Pr&uuml;fungen werden 3 mal w&ouml;chentlich in unserem Betrieb durchgef&uuml;hrt, zur Zeit Montag, Donnerstag und Freitag Vormittag.<br><br>
			
			<TABLE border=0>
			<tr><td>Stundenverrechnungssatz Mechanik   </td><td>59.50 EUR</td></tr>
			<tr><td>Stundenverrechnungssatz Karosserie </td><td>78,60 EUR</td></tr>
			</TABLE>
			<br><br>
			Wir hoffen, unser Unternehmen mit seinen umfangreichen Leistungen aufschlussreich dargestellt zu haben und w&uuml;rden uns freuen, Sie als Kunden betreuen zu d&uuml;rfen.<br>

			Hier finden Sie alle wichtigen Informationen &uuml;ber unseren Verkauf, Vermietung und unserer Werkstatt.
			";
			break;

		case 3:
			$content .= "
			<h1>Chronik 25 Jahre Geth&ouml;ffer</h1>
			Thomas Geth&ouml;ffer hatte w&auml;hrend seiner achtj&auml;hrigen Zeit als Soldat bei der Bundeswehr stets ein Ziel vor Augen, er wollte sich nach seiner Ausbildung zum staatlich gepr&uuml;ften Karosserietechniker und Fahrzeugbauermeister selbstst&auml;ndig machen und einen eigenen Betrieb in Uetersen er&ouml;ffnen.<br><br>
			Friedrich Berneke, seinerzeit Schmiedemeister und 50 Jahre in der M&uuml;hlenstra&szlig;e 9 in Uetersen selbstst&auml;ndig t&auml;tig, vermietete ihm seine Werkstatt f&uuml;r 400,-- DM im Monat. Nach der Renovierung im Mai begann am 01.06.1984 die Selbstst&auml;ndigkeit von Thomas Geth&ouml;ffer.<br><br>
			Die \"LKW-Reparatur\" stand als Fachrichtung nicht von vornherein fest. Da es in der Rosenstadt jedoch keine weitere Werkstatt dieser Art gab und der Vermieter Berneke, der Thomas am Anfang seiner Selbstst&auml;ndigkeit tatkr&auml;ftig unterst&uuml;tzte, bereits LKW-Kunden in seiner Zeit als Schmied betreute, waren Auftr&auml;ge sofort gesichert.<br><br>
			Die modernen Lastkraftwagen und Anh&auml;nger waren leider oftmals zu hoch f&uuml;r die niedrige Halle und mussten teilweise auf der Stra&szlig;e repariert werden. So wurde es dort immer enger und die Polizei fragte &ouml;fter mal an „ob sie denn auch den Verkehr regeln solle oder ob er das allein k&ouml;nne“. Da die kleine Firma immer mehr Arbeit bekam, wurde bald ein Geselle und dann ein Auszubildender (der noch heute im Unternehmen t&auml;tig ist) eingestellt, was die Verkehrsituation nicht gerade verbesserte...<br><br>
			1989 h&ouml;rte der niederl&auml;ndische Nutzfahrzeughersteller DAF durch einen Kunden von dem kleinen Unternehmen in Uetersen. Kurz darauf kam ein gro&szlig;er 7er BMW mit Chauffeur vor die alte Schmiede gefahren, der Verkaufsleiter von DAF-Deutschland stellte sich Herrn Geth&ouml;ffer vor und fragte: \"Wollen Sie etwa hier eine DAF-Vertretung er&ouml;ffnen?\"<br><br>
			Herr Geth&ouml;ffer erkl&auml;rte ihm, dass er die Absicht habe, eine neue Werkstatt zu bauen. So lud DAF ihn zur Automobilausstellung nach Frankfurt ein, wo dann der DAF-H&auml;ndlervertrag geschlossen wurde.<br><br>
			Nach knapp einj&auml;hriger Bauphase er&ouml;ffnete Thomas dann im Sommer 1990 die neue Werkstatt mit zwei Bahnen in der Franz-Kruckenberg-Stra&szlig;e 13 in Uetersen mit einem &auml;hnlichen Fest wie heute.<br><br>
			Die Teller und Gl&auml;ser waren noch nicht ganz weggepackt, da stand die Werkstatt schon voller LKW, die repariert werden wollten.<br><br>
			Um bei so viel Arbeit die Buchhaltung zu organisieren, kam noch im selben Jahr seine Ehefrau Elke ins Unternehmen und sorgte f&uuml;r Zucht und Ordnung. Sie begann fortan das Ersatzteilelager zu strukturieren und erwirkte eine Prozessoptimierung im Ablauf von Auftragserstellung bis zum Rechnungsausgang.<br><br>
			Als Herr Geth&ouml;ffer sich dann entschied nicht nur Lastwagen zu reparieren, sondern auch zu verkaufen, war das Ergebnis fast schon vorauszusehen: Es wurden 23 neue DAF- Nutzfahrzeuge in den Dienst gestellt und die neue Halle war mal wieder zu klein. So wurde 1992 entschieden eine dritte Bahn, scherzhafter Weise Halle 13 genannt, anzubauen.<br><br>
			Aber es gab, wie in vielen Unternehmen der freien Wirtschaft, H&ouml;hen und Tiefen. DAF meldete 1993 Insolvenz an und das gewachsene Unternehmen Geth&ouml;ffer hatte seine Last damit. Keiner wollte mehr DAF LKW kaufen; hau ab mit deinen „Tulpenbombern“ sagten die Kunden und so musste die Firma bis 1995 ganz kleine Br&ouml;tchen backen.<br><br>
			Dann kam Paccar ins Spiel.<br> Die amerikanische Gruppe (heute der drittgr&ouml;&szlig;te Nutzfahrzeug-Hersteller der Welt) baut Peterbilt und Kenworth LKW in den USA und kaufte DAF zu 100%.<br><br>
			Von nun an ging es mit der Marke DAF bergauf. Die Kosten f&uuml;r die finale Entwicklung des Fernverkehrs LKW „XF“ wurden bereitgestellt und eine Erfolgsgeschichte begann. Das Fahrzeug &uuml;berzeugte viele Fahrer mit seinem durchdachten Konzept und ebenso viele Unternehmer durch hohe Wirtschaftlichkeit. So konnte der Marktanteil stetig, bis heute, gesteigert werden.<br><br>
			Auch Firma Geth&ouml;ffer konnte von diesem Erfolg profitieren. Thomas Geth&ouml;ffer stellte den KFZ- und Landmaschinenmechanikermeister Tobias Wolff als Werkstattleiter ein, der ihm auch heute noch mit Rat und Tat sowie mit au&szlig;erordentlichen Fachkenntnissen und Einsatzbereitschaft zur Seite steht.<br><br>
			Sein Sohn Stefan kam 1999 ins Unternehmen. Nachdem er Werkstatt- und Lagerwesen kennengelernt hatte, wechselte er in den Verkauf, denn das war genau sein Ding. Er zog sich in sein B&uuml;ro zur&uuml;ck, studierte ein Jahr lang DAF-Trucks sowie dessen Wettbewerber und verkaufte ein paar kleine Transporter. Frau Geth&ouml;ffer fragte ihren Mann: „Was macht er den ganzen Tag, schmei&szlig; den Kerl raus“.<br><br>
			Das tat er nicht und ist heute froh dar&uuml;ber. Stefan hat mit seinen Ideen und seinem Engagement sehr zur erfolgreichen Entwicklung der Firma beigetragen. Er legte im Jahre 2001 mit zwei kleinen Lastwagen den Grundstein f&uuml;r die LKW-Vermietung. Zudem &uuml;bernahm er von seinem Vater den Verkauf von DAF Nutzfahrzeugen und begann ihn auszubauen.<br><br>
			2000 wurde beschlossen die Halle, den B&uuml;robereich und das Ersatzteilelager zu vergr&ouml;&szlig;ern, da die Kapazit&auml;ten erneut ersch&ouml;pft waren. Es wurden im Laufe der Zeit weitere Mitarbeiter im Werkstatt und B&uuml;robereich eingestellt, um das Auftragsvolumen bew&auml;ltigen zu k&ouml;nnen.<br><br>
			&Uuml;ber die Jahre kam es zu weiteren Platzproblemen: Die gestiegene Anzahl der Gro&szlig;fahrzeuge konnte auf dem kleinen Hof nicht mehr problemlos wenden beziehungsweise parken und f&uuml;r die Fahrzeuge der LKW-Vermietung sowie des –Handels war zu wenig Platz.<br><br>
			Es wurden Verhandlungen mit dem direkten Nachbarn, der Raiffeisen HaGe Nord AG, aufgenommen, die zum Jahresende 2008 eine kleine Werkstatt mit zwei Bahnen und eine gro&szlig;e Hoffl&auml;che zur Miete anbot. Trotz drohender Wirtschaftskrise wollte man sich die einmalige Chance nicht entgehen lassen.<br><br>
			Nach erfolgreicher Einigung begann die Renovierung der Werkstatt und des B&uuml;robereichs. Um eine praktikable L&ouml;sung des Parkplatzproblems umzusetzen, wurden 2009 die verf&uuml;gbaren Fl&auml;chen gepflastert. Der neue Bereich nimmt im Juni 2009 den Betrieb auf.<br><br>
			Heute stellt Firma Geth&ouml;ffer ein modernes Unternehmen rund um das Nutzfahrzeug dar. Aktuell sind 18 Mitarbeiter in den drei Bereichen LKW-Verkauf, -Vermietung und – Reparatur, die das Kerngesch&auml;ft darstellen, besch&auml;ftigt.<br><br>
			Im Bereich Verkauf werden DAF Neufahrzeuge nach Kundenwunsch spezifiziert, branchenoptimierte L&ouml;sungen ausgearbeitet und individuell zusammengestellt. Zum Verkauf geh&ouml;ren auch entsprechende Finanzierungsangebote, sowie die komplette Abwicklung bis zur Erstzulassung des LKW. Gebrauchtfahrzeuge werden national wie auch international vertrieben.<br><br>
			Die LKW-Vermietung verf&uuml;gt mittlerweile &uuml;ber mehr als 40 Fahrzeuge, vom 2,6 Tonnen Kastenwagen bis hin zum 40 Tonnen Sattelzug wird alles geboten. Die Fahrzeuge laufen &uuml;berwiegend in Langzeitmietvertr&auml;gen, aber auch im Kurzzeitmietbereich bleiben keine W&uuml;nsche offen.<br><br>
			Es werden LKW und Anh&auml;nger aller Art und Hersteller repariert, gewartet und gesetzlich untersucht. Spezielle Kundenw&uuml;nsche werden angefertigt, Getriebe und Motoren &uuml;berholt, und auch Unfallsch&auml;den instand gesetzt. Ersatzteile und Zubeh&ouml;r werden marken&uuml;bergreifend vertrieben.<br><br>
			Auf dem rund 10.000 Quadratmeter gro&szlig;en Gel&auml;nde befinden sich nunmehr diverse LKW- Parkpl&auml;tze f&uuml;r Reparatur und Handel sowie auch 15 Parkpl&auml;tze f&uuml;r Lastz&uuml;ge, die an Unternehmer ohne Stellplatz f&uuml;r Ihr Arbeitsger&auml;t, langfristig vermietet werden sollen.<br><br>
			In zwei Geb&auml;uden mit insgesamt f&uuml;nf Bahnen, mehreren B&uuml;ror&auml;umen, zwei L&auml;gern, einer Metallwerkstatt und einer Waschhalle dreht sich sechsmal die Woche alles um Reparatur, Aufr&uuml;stung und Pflege von LKW.<br><br>
			Aus Thomas Geth&ouml;ffers Traum der Selbstst&auml;ndigkeit ist in 25 Jahren ein florierendes Unternehmen herangewachsen, welches noch viele Visionen und Ziele f&uuml;r die Zukunft hat und diese gemeinsam f&uuml;r und mit seinen Kunden umsetzen m&ouml;chte.<br><br>
			Auf die n&auml;chsten 25 Jahre!

			";
			break;

		case 4:
			$content .= "
			<h1>Impressum</h1>

			<b>Thomas Geth&ouml;ffer<br>
			Karosserie- und Fahrzeugbau<br>
			Franz-Kruckenberg-Stra&szlig;e 13<br>
			25436 Uetersen<br><br>

			Tel.: 04122 / 92 77 -0<br>
			Fax: 04122 / 92 77 -20<br><br>

			Steuer-Nr.: 1311001025<br><br>

			USt.-IdNr.: DE134442995<br><br>

			Inhaber: Thomas Geth&ouml;ffer<br>
			Internet: <a href=\"http://www.gethoeffer-daf.de\">www.gethoeffer-daf.de</a></b><br><br>

			<b>Datenschutzhinweis:</b><br>
			Von Ihnen per Kontaktformular gesendete Daten werden bei uns im Hause nur f&uuml;r Kontaktzwecke eingesetzt (z.B. um Ihre Anfrage zu bearbeiten). Ihre Daten werden nicht an andere Unternehmen weitergegeben. Wenn Sie w&uuml;nschen l&ouml;schen wir Ihre Daten unverz&uuml;glich aus unserem System, senden Sie uns dazu bitte eine e-Mail.<br><br>

			<b>Disclaimer:</b><br>
			Unsere Webseiten sind urheberrechtlich gesch&uuml;tzt. Jede Verwertung zu kommerziellen oder politischen Zwecken, sei es ganz oder teilweise, auch in ver&auml;nderter Form bedarf der vorherigen Zustimmung. Zul&auml;ssig ist der Ausdruck, die Kopie oder das Herunterladen von Dateien zu Informationszwecken sowie zum Zwecke der privaten Nutzung. Die in unseren Webseiten enthaltenen Links k&ouml;nnen dazu f&uuml;hren, dass Sie auf die Webseiten Dritter gelangen. Wir weisen darauf hin, dass wir auf diese Webseiten keinen Einfluss haben, und daher auch nicht f&uuml;r deren Inhalt verantwortlich sind. Die Existenz von Links zu Webseiten Dritter stellt keine Empfehlung f&uuml;r diese Seiten, die sie betreibenden Unternehmen oder deren Produkte und Leistungen dar. Unsere Webseiten haben wir sehr sorgf&auml;ltig zusammengestellt. F&uuml;r die Richtigkeit und Vollst&auml;ndigkeit der Angaben k&ouml;nnen wir dennoch keine Haftung &uuml;bernehmen. Die Inhalte k&ouml;nnen &uuml;berdies ohne vorherige Ank&uuml;ndigung aktualisiert, erweitert, gek&uuml;rzt oder anderweitig angepasst oder ge&auml;ndert werden.
			";
			break;

		case 5:
			$content .= "
			<h1>Karriere</h1>
			Wir sind stets auf der Suche nach aufgeschlossenen und erfahrenen Personal!<br><br>

			Wer Interesse hat sich beruflich zu ver&auml;ndern, leistungsbereit ist, sich neuen Aufgaben stellen m&ouml;chte und durch ein angenehmes Betriebsklima seine pers&ouml;nliche Motivation steigert, der sollte sich gerne bei uns schriftlich bewerben.<br><br>

			Stellenangebote:<br><br>

			<b>Kraftfahrzeugmechaniker-/Mechatronikermeister Fachrichtung Nutzfahrzeuge!</b><br>
			Voraussetzungen: <br>
			<ul>
				<li>Meisterbrief</li>
				<li>F&uuml;hrerscheinklasse 2/CE</li>
				<li>gute EDV Kenntnisse</li>
				<li>g&uuml;ltige Lehrg&auml;nge f&uuml;r: AU, SP und Tacho</li>
				<li>branchen&uuml;bliche Arbeitsbereitschaft inkl. Samstagsdienst</li>
				<li>etc.</li>
			</ul>
			Beschreibung: 
			<ul>
				<li>Personalf&uuml;hrungsqualit&auml;t</li>
				<li>Umgang mit Kunden telefonisch/pers&ouml;nlich
				<li>Diagnose = Umsetzung in EDV
				<li>Werkstattplanung
				<li>Instandhaltung und &Uuml;berwachung der Mietfahrzeugflotte</li>
				<li>etc.</li>
			</ul>
			";
			break;

		case 6:
		
			// Prüfen, ob eine Anfrage gestellt wurde:
			// Vollständige Anfrage --> Email senden
		  //print_r($_REQUEST);
		  
		  if (   ($_REQUEST["betreff"] != "")
		      && ($_REQUEST["firmenname"] != "")
		      && ($_REQUEST["name"] != "")
		      && ($_REQUEST["adress"] != "")
		      && ($_REQUEST["zip"] != "")
		      && ($_REQUEST["phone"] != "")
		      && ($_REQUEST["email"] != "")
		      && ($_REQUEST["comment"] != ""))
		      {
		      	// Betreff auf 70 Zeichen pro Zeile aufteilen:
		      	$nachricht = wordwrap($_REQUEST["comment"], 70);

		      	$form_betreff 		= $_REQUEST["betreff"];
		      	$form_firmenname 	= $_REQUEST["firmenname"];
		      	$form_name 				= $_REQUEST["name"];
		      	$form_adress 			= $_REQUEST["adress"];
		      	$form_zip 				= $_REQUEST["zip"];
		      	$form_phone 			= $_REQUEST["phone"];
		      	$form_email 			= $_REQUEST["email"];
		      	$form_comment 		= $_REQUEST["comment"];
		      	
		      	// Inhalt der Mail zusammenbauen:
		      	$emailtext = "Firmenname: $form_firmenname"	. "\r\n"
											 . "Name:       $form_name"				. "\r\n"
											 . "Adresse:    $form_adress"			. "\r\n"  	
											 . "PLZ, Ort:   $form_zip"				. "\r\n"
											 . "Telefon:    $form_phone"			. "\r\n"
											 . "Email:      $form_email"			. "\r\n"
											 . "Kommentar:  $nachricht"				. "\r\n"
		      						;
		      	$header = 'From: info@gethoeffer-daf.de' 		 . "\r\n" .
    									'Reply-To: info@gethoeffer-daf.de' . "\r\n" .
    									'X-Mailer: PHP/' . phpversion();
    									
		      	// Mail senden:
		      	mail('info@gethoeffer-daf.de', "WEBSEITE: $form_betreff", $emailtext, $header);
			      $text = "<b>Ihre Kontaktanfrage wurde erfolgreich verschickt und wird schnellstmöglich beantwortet werden.</b>";
			      $noform = 1;
		      }
			// Unvollständige Anfrage --> Fehlermeldung
		  else if (($_REQUEST["betreff"] != "")
			      || ($_REQUEST["firmenname"] != "")
			      || ($_REQUEST["name"] != "")
			      || ($_REQUEST["adress"] != "")
			      || ($_REQUEST["zip"] != "")
			      || ($_REQUEST["phone"] != "")
			      || ($_REQUEST["email"] != "")
			      || ($_REQUEST["comment"] != ""))
		      {
		      
		      	$form_betreff 		= $_REQUEST["betreff"];
		      	$form_firmenname 	= $_REQUEST["firmenname"];
		      	$form_name 				= $_REQUEST["name"];
		      	$form_adress 			= $_REQUEST["adress"];
		      	$form_zip 				= $_REQUEST["zip"];
		      	$form_phone 			= $_REQUEST["phone"];
		      	$form_email 			= $_REQUEST["email"];
		      	$form_comment 		= $_REQUEST["comment"];
					
			      $text = "<b color=\"red\">Bitte füllen Sie alle Felder aus, damit Ihre Anfrage bearbeitet werden kann.</b>";
		      }
		  else
		  {
		      	$form_betreff 		= "";
		      	$form_firmenname 	= "";
		      	$form_name 				= "";
		      	$form_adress 			= "";
		      	$form_zip 				= "";
		      	$form_phone 			= "";
		      	$form_email 			= "";
		      	$form_comment 		= "";
		
			      $text = "Bitte füllen Sie alle Felder aus, damit Ihre Anfrage bearbeitet werden kann.";
		  }
		      
			$content .= "
				<h1>Kontakt</h1>

				<b>
				Thomas Geth&ouml;ffer<br>
				Karosserie- und Fahrzeugbau<br>
				Franz-Kruckenberg-Stra&szlig;e 13<br>
				25436 Uetersen<br><br>

				Tel.: 04122 / 92 77 -0  <br>
				Fax: 04122 / 92 77 -20  <br>

				www.gethoeffer-daf.de <br><br>

				<table border=0 width=\"100%\"> <tr><td>Inhaber:				</td><td> Herr 
				Thomas Geth&ouml;ffer </td><td> Tel.:	-15 </td></tr> <tr><td>Leitung 
				LKW-Verkauf & Vermietung:	</td><td> Herr Stefan Geth&ouml;ffer </td><td> 
				Tel.:	-14 </td></tr> <tr><td>Kaufm&auml;nnische 
				Gesch&auml;ftsf&uuml;hrung: 	</td><td> Herr Thomas Brinkmann </td><td> 
				Tel.: -10 </td></tr>	 <tr><td>LKW-Vermietung & &Uuml;berwachung: 
				</td><td> Herr Kay K&ouml;lln	</td><td> Tel.: -11 </td></tr>	
				<tr><td>Abwicklung Werkstatt-Auftr&auml;ge: 		</td><td> Frau Elke 
				Geth&ouml;ffer 	</td><td> Tel.: -16 </td></tr>	 <tr><td>Leitung 
				Werkstatt & Ersatzteile: 	</td><td> Herr Tobias Wolff 	</td><td> Tel.: 
				-17 </td></tr>	 <tr><td>Werkstatt: 				</td><td> Herr Tobias Wolff
				</td><td> Tel.: -18 </td></tr>	 <tr><td>LKW-Ersatzteile & Zubeh&ouml;r:
				</td><td> Herr Dieter Freiwald 	</td><td> Tel.: -19 </td></tr>	
				<tr><td>Finanzbuchhaltung: 			</td><td> Frau Elfrun Bock 	</td><td> 
				Tel.: -22 </td></tr>	 <tr><td>Qualit&auml;tsmangement: 			</td><td> 
				Frau Melanie Rudow 	</td><td> Tel.: -23 </td></tr>	
				</table></b><br><br>$text<br><br>		

				";
				
				if (!$noform)
				{
				$content .= "
					<form action=\"index.php?pid=6\" method=\"post\" target=\"_self\">
					<table border=0>
	
					 <tr>
					  <td style=\"width:100px;text-align:right;\">Betreff:</td>
					  <td><input type=\"text\" name=\"betreff\" value=\"$form_betreff\" class=\"txtField\" style=\"width:250px;\" value=\"\"></td>
					 </tr>
	
					 <tr>
					  <td style=\"width:100px;text-align:right;\">Firmenname:</td>
					  <td><input type=\"text\" name=\"firmenname\" value=\"$form_firmenname\" class=\"txtField\" style=\"width:250px;\"></td>
					 </tr>
	
					 <tr>
					  <td style=\"width:100px;text-align:right;\">Name:</td>
					  <td><input type=\"text\" name=\"name\" value=\"$form_name\" class=\"txtField\" style=\"width:250px;\"></td>
					 </tr>
	
					 <tr>
					  <td style=\"width:100px;text-align:right;\">Adresse:</td>
					  <td><input type=\"text\" name=\"adress\" value=\"$form_adress\" class=\"txtField\" style=\"width:250px;\"></td>
					 </tr>
	
					 <tr>
					  <td style=\"width:100px;text-align:right;\">PLZ & Ort:</td>
					  <td><input type=\"text\" name=\"zip\" value=\"$form_zip\" class=\"txtField\" style=\"width:250px;\"></td>
					 </tr>
	
					 <tr>
					  <td style=\"width:100px;text-align:right;\">Telefon:</td>
					  <td><input type=\"text\" name=\"phone\" value=\"$form_phone\" class=\"txtField\" style=\"width:250px;\"></td>
					 </tr>
	
					 <tr>
					  <td style=\"width:100px;text-align:right;\">Email:</td>
					  <td><input type=\"text\" name=\"email\" value=\"$form_email\" class=\"txtField\" style=\"width:250px;\"></td>
					 </tr>
	
					 <tr>
					  <td style=\"width:100px;text-align:right;vertical-align:top;padding-top:3px;\">Kommentar:</td>
					  <td><textarea rows=\"6\" name=\"comment\" class=\"txtField\" style=\"width:250px;\">$form_comment</textarea></td>
					 </tr>
	
					 <tr>
					  <td style=\"width:100px;text-align:right;\">&nbsp;</td>
					  <td><input type=\"submit\" value=\"Email senden\" class=\"button\"></td>
					 </tr>
	
					</table>
					</form>
				";
				}
			break;

		case 7:
			$content .= "
			<h1>&Ouml;ffnungszeiten:</h1>

			<br><br>
			<table border=0>
			<tr>
				<td rowspan=2 align=left><b>Montag - Freitag:</b></td>
				<td align=right><b>7.30 - 12.30 Uhr</b></td>
			</tr>
			<tr>
				<td align=right><b>13.00 - 18.00 Uhr</b></td>
			</tr>
			<tr>
				<td align=left><b>Samstag:</b></td>
				<td align=right><b>8.00 - 13.00 Uhr</b></td>
			</tr>
			</table
			";
			break;

		case 8:
			$content .= "
			<h1>So finden sie uns!</h1>

			<b>Thomas Geth&ouml;ffer<br>
			Karosserie- und Fahrzeugbau<br><br>

			Franz-Kruckenberg-Stra&szlig;e 13<br>
			25436 Uetersen<br><br></b>

			<iframe width  =\"425\" height =\"350\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=de&amp;geocode=&amp;q=Franz-Kruckenberg-Stra%C3%9Fe+13+25436+Uetersen&amp;sll=53.675511,9.680414&amp;sspn=0.037268,0.077162&amp;ie=UTF8&amp;hq=&amp;hnear=Franz-Kruckenberg-Stra%C3%9Fe+13,+25436+Uetersen,+Pinneberg,+Schleswig-Holstein,+Deutschland&amp;ll=53.686796,9.69964&amp;spn=0.037268,0.077162&amp;z=14&amp;iwloc=r0&amp;output=embed\"></iframe><br /><small><a href=\"http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=de&amp;geocode=&amp;q=Franz-Kruckenberg-Stra%C3%9Fe+13+25436+Uetersen&amp;sll=53.675511,9.680414&amp;sspn=0.037268,0.077162&amp;ie=UTF8&amp;hq=&amp;hnear=Franz-Kruckenberg-Stra%C3%9Fe+13,+25436+Uetersen,+Pinneberg,+Schleswig-Holstein,+Deutschland&amp;ll=53.686796,9.69964&amp;spn=0.037268,0.077162&amp;z=14&amp;iwloc=r0\" style=\"color:#0000FF;text-align:left\">Gr&ouml;&szlig;ere Kartenansicht</a></small>			
			";
			break;

		case 9:
			$content .= "
			<h1>Werkstatt</h1>
			Folgende Leistungen k&ouml;nnen wir Ihnen in unserer Werkstatt anbieten:<br><br>

			<ul>
			    <li>DAF Service Dealer</li>
			    <li>LKW Reparatur aller Marken</li>
			    <li>LKW Getriebereparaturen</li>
			    <li>Unfallreparatur</li>
			    <li>Ersatzteile und Zubeh&ouml;r</li>
			    <li>T&Uuml;V und Dekra Station</li>
			    <li>Gesetzliche Untersuchungen</li>
			    <li>digital Tachographen Service</li>
			    <li>Anh&auml;nger, Auflieger und Aufbauten Service</li>
			</ul><br><br>
			";
			break;

		case 10:
			$content .= "10";
			break;

		case 11:
			$content .= "11";
			break;

	}


	return $content;
}


?>
