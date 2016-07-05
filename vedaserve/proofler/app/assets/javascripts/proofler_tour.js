var ProoflerTour = function () {
  function basicTour() {
    return new Tour({
      name: 'basic',
      orphan: true,
      steps: [
        {
          title: "Moin, willkommen beim proofler!",
          content: "<p>Um gute Entscheidungen zu treffen empfehlen wir, JA/NEIN Entscheidungen zu vermeiden und stattdessen dem proofler-Prozess zu folgen.</p><br> <p>Hier eine kurze Einführung in den proofler, bei der Du zugleich einige Grundlagen lernst, gute Entscheidungen zu treffen.</p>",
          orphan: true
        },
        {
          element: "#progressGather",
          title: "Optionen sammeln und beschreiben",
          placement: "bottom",
          content: "<p><b>Die erste Phase besteht daraus, passende Optionen zu finden und diese durch Kriterien zu beschreiben.</b></p><br><p><i>Beim Pilzesammeln wirft man ja auch erst alle Pilze in einen Korb, um sie zu Hause in Ruhe zu sichten.</i></p>"
        },
        {
          element: "#progressRate",
          title: "Optionen bewerten",
          placement: "bottom",
          content: "<p><b>In der zweiten Phase bewertest Du die Optionen und Kriterien rational und mit Deinem Bauchgefühl.</b></p><br><p><i>Pilze die im Wald ganz toll aussahen findest Du jetzt vielleicht gar nicht mehr so gut. Vielleicht sagt Dein Bestimmungsbuch auch, dass sie giftig sind.</i></p>"
        },
        {
          element: "#progressDecide",
          title: "Entscheiden",
          placement: "bottom",
          content: "<p><b>In der letzten Phase berechnet der proofler basierend auf Deinen Angaben die beste Option. Du wirst dann schnell erkennen, ob dies auch Dein Favorit war.</b></p>"
        },
        {
          element: "#toggle_newoption",
          title: "Starte mit der ersten Option",
          placement: "right",
          content: "<p><b>Optionen sind die Auswahlmöglichkeiten, zwischen denen Du Dich später entscheiden wirst.</b></p> <br><p><i>Wenn Du ein neues Auto kaufen willst, wäre eine Option der <b>Audi A4</b> den Du bei mobile.de gesehen hast, eine andere Option wäre der <b>BMW 320i</b> von Deinem Kumpel Daniel.</i></p><br><p><b>Lege nun die erste Option an!</b></p>"
        }
      ]});
  }

  function criteriaTour() {
    return new Tour({
      name: 'criteria',
      orphan: true,
      steps: [
        {
          element: ".js-new-fact",
          title: "Kriterien anlegen",
          placement: "right",
          content: "<p><b>Entscheidungskriterien sind Merkmale, die die Optionen beschreiben und vergleichbar machen. Kriterien gelten für alle Optionen, unabhängig bei welcher Option Du sie anlegst. </b></p> <br><p><i>Für die Autosuche wären vergleichbare Kriterien z.B. <b>&quot;Kilometerleistung&quot;, &quot;TÜV neu&quot;</b> und <b>&quot;Anzahl der Vorbesitzer&quot;.</b> Du recherchierst dann für alle Optionen (BMW 320i, Audi A4, ...) die jeweiligen Daten.</i></p> <br> <p><b>Lege nun das erste Kriterium an!</b></p>"
        }
      ]});
  }

  function setup() {
    var tour;

    if ($('#dashboard-gather').length > 0) {
      if ($(".option").length == 0) {
        tour = basicTour();
      } else if ($(".option").length == 1 && $(".option-fact").length == 0) {
        tour = criteriaTour();
      }

      if (tour) {
        tour.init();
        tour.start();
      }
    }

    return tour;
  }

  return {
    setup: setup
  };
}();
