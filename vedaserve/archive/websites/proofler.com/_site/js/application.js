  var handleHashChange = (function () {
    var modalData = [
      {
        hash: 'confirm',
        header: 'Schau nach Deinen Mails!',
        body: '<p>Wir haben Dir gerade eine Email mit einem Bestätigungslink geschickt. Bitte bestätige mit diesem Link, dass Du unseren Newsletter empfangen möchtest.</p>'
      },
      {
        hash: 'thanks',
        header: 'Geschafft!',
        body: '<p>Sobald es spannende Neuigkeiten gibt, bist Du unter den Ersten, die es erfahren!</p>'
      },
      {
        hash: 'imprint',
        header: 'Impressum',
        body: '<p><b>Vedaserve GmbH</b><br>c/o HAW Hamburg - GründungsService<br>Alexanderstrasse 1<br>20099 Hamburg</p>'+
              '<p><b>Vertreten durch:</b><br>Sebastian Pioch und Nils Löwe</p>'+
              '<p><b>Kontakt:</b><br>E-Mail: <a href=mailto:moin@proofler.com>moin@proofler.com</a></p>'+
              '<p><b>Registereintrag:</b><br>Eintragung im Handelsregister: Hamburg<br>Registernummer: HRB 127018</p>'+
              '<p><b>Umsatzsteuer-ID:</b><br>Steuernummer gemäß §27a Umsatzsteuergesetz:<br>46/766/02289<br>Finanzamt Hamburg</p><p>'+
              '<h3>Haftungsausschluss</h3>'+
              '<h4>1. Inhalt des Onlineangebotes</h4>'+
              '<p>Der Autor übernimmt keinerlei Gewähr für die Aktualität, Korrektheit, Vollständigkeit oder Qualität der bereitgestellten Informationen. Haftungsansprüche gegen den Autor, welche sich auf Schäden materieller oder ideeller Art beziehen, die durch die Nutzung oder Nichtnutzung der dargebotenen Informationen bzw. durch die Nutzung fehlerhafter und unvollständiger Informationen verursacht wurden, sind grundsätzlich ausgeschlossen, sofern seitens des Autors kein nachweislich vorsätzliches oder grob fahrlässiges Verschulden vorliegt. Alle Angebote sind freibleibend und unverbindlich. Der Autor behält es sich ausdrücklich vor, Teile der Seiten oder das gesamte Angebot ohne gesonderte Ankündigung zu verändern, zu ergänzen, zu löschen oder die Veröffentlichung zeitweise oder endgültig einzustellen.</p>'+
              '<h4>2. Verweise und Links</h4>'+
              '<p>Bei direkten oder indirekten Verweisen auf fremde Webseiten (”Hyperlinks”), die außerhalb des Verantwortungsbereiches des Autors liegen, würde eine Haftungsverpflichtung ausschließlich in dem Fall in Kraft treten, in dem der Autor von den Inhalten Kenntnis hat und es ihm technisch möglich und zumutbar wäre, die Nutzung im Falle rechtswidriger Inhalte zu verhindern. Der Autor erklärt hiermit ausdrücklich, dass zum Zeitpunkt der Linksetzung keine illegalen Inhalte auf den zu verlinkenden Seiten erkennbar waren. Auf die aktuelle und zukünftige Gestaltung, die Inhalte oder die Urheberschaft der verlinkten/verknüpften Seiten hat der Autor keinerlei Einfluss. Deshalb distanziert er sich hiermit ausdrücklich von allen Inhalten aller verlinkten /verknüpften Seiten, die nach der Linksetzung verändert wurden. Diese Feststellung gilt für alle innerhalb des eigenen Internetangebotes gesetzten Links und Verweise sowie für Fremdeinträge in vom Autor eingerichteten Gästebüchern, Diskussionsforen, Linkverzeichnissen, Mailinglisten und in allen anderen Formen von Datenbanken, auf deren Inhalt externe Schreibzugriffe möglich sind. Für illegale, fehlerhafte oder unvollständige Inhalte und insbesondere für Schäden, die aus der Nutzung oder Nichtnutzung solcherart dargebotener Informationen entstehen, haftet allein der Anbieter der Seite, auf welche verwiesen wurde, nicht derjenige, der über Links auf die jeweilige Veröffentlichung lediglich verweist.</p>'+
              '<h4>3. Urheber- und Kennzeichenrecht</h4>'+
              '<p>Der Autor ist bestrebt, in allen Publikationen die Urheberrechte der verwendeten Bilder, Grafiken, Tondokumente, Videosequenzen und Texte zu beachten, von ihm selbst erstellte Bilder, Grafiken, Tondokumente, Videosequenzen und Texte zu nutzen oder auf lizenzfreie Grafiken, Tondokumente, Videosequenzen und Texte zurückzugreifen. Alle innerhalb des Internetangebotes genannten und ggf. durch Dritte geschützten Marken- und Warenzeichen unterliegen uneingeschränkt den Bestimmungen des jeweils gültigen Kennzeichenrechts und den Besitzrechten der jeweiligen eingetragenen Eigentümer. Allein aufgrund der bloßen Nennung ist nicht der Schluss zu ziehen, dass Markenzeichen nicht durch Rechte Dritter geschützt sind! Das Copyright für veröffentlichte, vom Autor selbst erstellte Objekte bleibt allein beim Autor der Seiten. Eine Vervielfältigung oder Verwendung solcher Grafiken, Tondokumente, Videosequenzen und Texte in anderen elektronischen oder gedruckten Publikationen ist ohne ausdrückliche Zustimmung des Autors nicht gestattet.</p>'+
              '<h4>4. Datenschutz</h4>'+
              '<p>Sofern innerhalb des Internetangebotes die Möglichkeit zur Eingabe persönlicher oder geschäftlicher Daten (Emailadressen, Namen, Anschriften) besteht, so erfolgt die Preisgabe dieser Daten seitens des Nutzers auf ausdrücklich freiwilliger Basis. Die Inanspruchnahme und Bezahlung aller angebotenen Dienste ist – soweit technisch möglich und zumutbar – auch ohne Angabe solcher Daten bzw. unter Angabe anonymisierter Daten oder eines Pseudonyms gestattet. Die Nutzung der im Rahmen des Impressums oder vergleichbarer Angaben veröffentlichten Kontaktdaten wie Postanschriften, Telefon- und Faxnummern sowie Emailadressen durch Dritte zur Übersendung von nicht ausdrücklich angeforderten Informationen ist nicht gestattet. Rechtliche Schritte gegen die Versender von sogenannten Spam-Mails bei Verstössen gegen dieses Verbot sind ausdrücklich vorbehalten.</p>'+
              '<h4>5. Rechtswirksamkeit dieses Haftungsausschlusses</h4>'+
              '<p>Dieser Haftungsausschluss ist als Teil des Internetangebotes zu betrachten, von dem aus auf diese Seite verwiesen wurde. Sofern Teile oder einzelne Formulierungen dieses Textes der geltenden Rechtslage nicht, nicht mehr oder nicht vollständig entsprechen sollten, bleiben die übrigen Teile des Dokumentes in ihrem Inhalt und ihrer Gültigkeit davon unberührt.</p>'
      },
      {
        hash: 'vedaserve',
        header: 'Vedaserve',
        body: '<p>Der Proofler ist das erste Produkt der Vedaserve GmbH aus Hamburg. Sie wurde im März 2013 von Nils Löwe und Sebastian Pioch gemeinsam mit Jan Ahrens und Wolfgang von Geramb gegründet.</p> <p align=center><table border="0" align=center><tr><td><img src="../img/loewe.png" width=150px></td><td><img src="../img/pioch.png" width=150px></td></tr><tr><td>Nils Löwe</td><td>Sebastian Pioch</td></tr><tr><td><a href=mailto:loewe@proofler.com>loewe@proofler.com</a></td><td><a href=mailto:pioch@proofler.com>pioch@proofler.com</a></td></tr></table></p><p>Seid ab 2015 dabei, wenn mit dem proofler Entscheidungen wissensbasiert getroffen werden und Eure Intuition trotzdem gebraucht wird.</p>'
      },
      {
        hash: 'privacy',
        header: 'Datenschutz',
        body: '<p>Diese Website nutzt die Open-Source-Software Piwik für die statistische Auswertung von Besucherzugriffen. <a href="http://de.piwik.org/blog/2011/03/unabhangiges-landeszentrum-datenschutz-uld-piwik-datenschutzkonform-einsetzbar/" target="_blank">Piwik ist datenschutzkonform konfiguriert</a>, Daten werden anonymisiert gespeichert werden. Die zu diesem Zweck verwendeten  „Sitzungs-Cookies” sind Textdateien, die nur temporär auf Ihrem Computer gespeichert werden. Sobald der Webbrowser geschlossen wird, werden sie wieder gelöscht. Sie können die Datenerfassung durch Piwik am Ende dieser Seite deaktivieren. Sofern Ihr Browser die "Do-Not-Track"-Technik unterstützt und Sie diese aktiviert haben, wird ihr Besuch automatisch ignoriert.</p><p>Die von Piwik erfassten Daten werden nicht und niemals auf andere Server übertragen oder an Dritte weitergegeben, sondern in anonymisierter Form dazu verwendet, unser Angebot zu verbessern. IP-Adressen werden in Piwik ohne das letzte Tupel gespeichert. Wir wissen, aus welchem Netz eine Anfrage kam, nicht jedoch von welchem Rechner.</p><p>Durch die Nutzung dieser Website erklären Sie sich mit der Bearbeitung der über Sie erhobenen Daten durch Piwik in der zuvor beschriebenen Art und Weise und zu dem zuvor benannten Zweck einverstanden.</p>'
      }
    ];

    $('#modalContainer').modal({show: false});

    return function handleHashChange() {
      modalData.forEach(function (modal) {
        if (window.location.hash == ("#"+modal.hash)) {
          _paq.push(['trackPageView', 'modal/'+modal.hash]);
          window.location.hash = '';
          $('#myModalLabel').text(modal.header);
          $('#modalContainer .modal-body').html(modal.body);
          $('#modalContainer').modal("show");
        }
      });
    }
  })();

  $(document).ready(function () {
    handleHashChange();
  });

  $(window).on("hashchange", function () {
    handleHashChange();
  });
