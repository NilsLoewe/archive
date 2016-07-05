---
layout: post
title: "Legacy Code und der demographische Wandel"
description: ""
category: "Software Engineering"
tags: ["Legacy Code", "Embedded Software"]
---

Fachlich beschäftige ich mich gerade mit zwei sehr spannenden Themen: Ich entwickle einerseits seit mehreren Jahren Embedded Software in C, hier ist die Entwicklung der Tools oft Jahre hinter der "modernen" Software zurück, zusätzlich sind in größeren Firmen komplexe Prozesse zu berücksichtigen und Normen zu beachten. Agile Softwareentwicklung ist in der Praxis noch wenig etabliert. Technisch ist Embedded Software ein absolut spannendes Thema, so nah wie hier kommt man bei Web- oder Desktopsoftware niemals an die letzten Bits heran. Auf der anderen Seite entwickle ich als Gründer eines Startups eine Ruby on Rails Webapplikation die sich mit Marktrecherchen und der Aufbereitung von Wissen befasst.

Durch das stetige Wechseln zwischen beiden Tätigkeiten, kann ich seit einer Weile einige spannende Erkenntnisse zwischen den beiden Welten austauschen. Während die Fachdomänen in der Embedded Software sich um wirklich technische Probleme (z.B. Gasmesstechnik oder Klimasteuergeräte) drehen, zielen die modernen Webanwendungen eher auf Problemstellungen des täglichen Lebens ab. Die Herangehensweisen um zu einem guten Kundennutzen zu kommen sind völlig andere als in der Embedded Software. Im Webumfeld sind agile Verfahren und moderne Sprachen und Tools viel weiter etabliert, daher ist es hier viel leichter, neue Technologien auszuprobieren und neue Erfahrungen zu sammeln.

Ein Thema ist mir allerdings regelmäßig in beiden Domänen wieder über den Weg gelaufen: Tests. In der "alten Welt" werden die Prozesse noch stark durch Wasserfälle oder V-Modelle getrieben, hier wird klassischerweise am Ende der Entwicklung eine hundertprozentige Testabdeckung angestrebt. Im Webumfeld hat sich in den modernen, agilen Prozessen der Testdriven Ansatz durchgesetzt. Gerade bei Ruby on Rails gehört TDD zum guten Ton, so dass es gar nicht mehr die Trennung zwischen Softwareentwickler und Tester gibt. Für die Embedded Software habe ich gerade das sehr geniale Buch "<a href="http://www.amazon.de/gp/product/193435662X/ref=as_li_ss_tl?ie=UTF8&amp;camp=1638&amp;creative=19454&amp;creativeASIN=193435662X&amp;linkCode=as2&amp;tag=wwwnilsloewed-21">Test Driven Development for Embedded C</a>" gefunden, die modernen Ansätze lassen sich mit relativ wenig Aufwand auch im klassischen Projektumfeld verwenden.

Vom Thema Testing ist es nicht mehr weit zu Legacy Code. Legacy Code sehe ich mittlerweile als Äquivalent des demographischen Wandels in der Softwareentwicklung. Jeden Tag entsteht neue Software und wir pflegen jeden Tag alte Systeme. Die Fähigkeiten zum Testen und zum Umgang mit Legacy Code sehe ich Schlüsselkompetenzen zum langfristigen Erfolg als Softwareentwickler.
