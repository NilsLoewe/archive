<?php
include "content.inc";

function logos()
{
	return "<div align=center><img src=\"./img/logos.jpg\" alt=\"Logos\" width=\"770\"></div>";
}

function slideshow()
{
	return "<div align=center><img src=\"./img/slide.jpg\" alt=\"Isuzu\" width=\"710\"></div>";
}

function hline()
{
	return "<div align=center><img src=\"./img/hor_line.jpg\" alt=\"Line\" width=\"770\"></div>";
}

function navi()
{
	$menu = "";

	$menu .= link_pid(1,  "Home",1);
	$menu .= link_pid(2,  "Unternehmen",1);
	$menu .= link_pid(3,  "Historie",2);
	$menu .= link_pid(4,  "Impressum",2);
	$menu .= link_pid(5,  "Karriere",2);
	$menu .= link_pid(6,  "Kontakt",2);
	$menu .= link_pid(7,  "&Ouml;ffnungszeiten",2);
	$menu .= link_pid(8,  "Anfahrt",2);
	$menu .= link_pid(9,  "Werkstatt",1);
	//$menu .= link_pid(10, "Service",2);
	//$menu .= link_pid(11, "Notdienst",2);

	return $menu;	
}

function foot()
{
	return "Thomas Geth&ouml;ffer | Franz-Kruckenberg-Stra&szlig;e 13 | 25436 Uetersen | Tel.: 04122 / 92 77 - 0 | Fax: 04122 / 92 77 - 20 | www.gethoeffer-daf.de";
}

?>
