---
layout: post
title: "Ubuntu und O2 VDSL - Was tun wenn die Verbindung langsam ist?"
description: ""
category: "Ubuntu"
tags: ["Ubuntu", "VDSL", "IPv6"]
---

Seit Mittwoch bin ich stolzer Nutzer eines O2 VDSL Anschlusses. Nach der relativ langsamen 8MBit Alice DSL Leitung hatte ich mir Quantensprünge bei der Geschwindigkeit vorgestellt, leider war der erste Eindruck erstmal ernüchternd. Der O2 Speedtest ergab zwar 49.5 MBit, der Verbindungsaufbau war aber immer von sekundenlangen Verzögerungen gestört. War die Verbindung hergestellt, lief dann alles prima.

Ich habe nach den üblichen Lösungen gesucht und konnte in den diversen Threads im O2 Forum leider nichts passendes finden. In alles dort beschriebenen Fällen ergab auch der Speedtest langsame Verbindungen. Als ich heute zufällig einen älteren Rechner mit Windows hochgefahren habe war ich ziemlich überrascht, dass dieser die Verzögerungen beim Verbindungsaufau nicht hatte. Daraufhin habe ich dann den VDSL Anschluss als generelles Problem ausgeschlossen und mal gesucht, wo der Unterschied zwischen meinem Ubuntu 14.04 und dem Windows 7 Rechner liegen könnte...

Ubuntu konfiguriert standardmäßig alle Interfaces mit IPv4 und IPv6 und nutzt bevorzugt IPv6. Das ist sehr schön, sehr zukunftsweisend und leider nicht sehr hilfreich in Verbindung mit einer o2 HomeBox 6641 - die scheint ihre Probleme mit IPv6 zu haben, zumindest an meinem Anschluss.

Folgendermaßen habe ich Ubuntu das IPv6 erstmal abgewöhnt:

* sysctl.conf editieren

    _$ sudo gedit /etc/sysctl.conf_

* IPv6 für alle interfaces deaktivieren

    # IPv6 disabled
    net.ipv6.conf.all.disable_ipv6 = 1
    net.ipv6.conf.default.disable_ipv6 = 1
    net.ipv6.conf.lo.disable_ipv6 = 1

* Den Service neu starten

   _$ sudo sysctl -p_


Ohne IPv6 werden alle Verbindungen schnell hergestellt und ich habe auch wirklich das Gefühl, an einer 50MBit Leitung zu arbeiten :)
