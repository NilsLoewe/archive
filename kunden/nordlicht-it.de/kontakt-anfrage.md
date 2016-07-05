---
layout: page-2
title: Leistungsanfrage
menu: kontakt
permalink: /kontakt/anfrage/
---

Wenn Sie uns eine Anfrage senden wollen, die bestimmte Leistungen oder dessen Umfang und Konditionen betrifft, f&uuml;llen Sie bitte dieses Formular aus.

Sie k&ouml;nnen unsere Mitarbeiter auch pers&ouml;nlich erreichen, indem Sie im Hauptmen&uuml; unter "Kontakt" den Mitarbeiter ausw&auml;hlen, dem Sie eine Nachricht schicken m&ouml;chten.

Selbstverst&auml;ndlich d&uuml;rfen Sie uns auch gerne jederzeit telefonisch kontaktieren, damit wir Ihr Anliegen schnell und pers&ouml;nlich bearbeiten k&ouml;nnen.

<form name="contactform" method="post" action="/mailer-anfrage.php" class="form-horizontal" role="form">
  <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label">Name:</label>
    <div class="col-sm-10">
      <input type="textfield" class="form-control" name="name" id="inputName" placeholder="">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputEmail" class="col-sm-2 control-label">E-Mail</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" name="email"  id="inputEmail" placeholder="">
    </div>
  </div>

<div class="form-group">
    <label for="inputTime" class="col-sm-2 control-label">Thema:</label>
    <div class="col-sm-10">
      <select multiple class="form-control" name="select">
        <option>Nicht spezifiziert</option>
        <option>Projekt</option>
        <option>E-Commerce</option>
        <option>IT-Consulting</option>
        <option>CMS-/Webdesign</option>
        <option>Storage / Backup</option>
        <option>Business Security</option>
        <option>Netzwerksicherheit</option>
        <option>Kooperationsleistung</option>
      </select>
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputTopic" class="col-sm-2 control-label">Nachricht:</label>
    <div class="col-sm-10">
      <textarea class="form-control" rows="4" name="topic" is="inputTopic"></textarea>
    </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" value="Absenden" class="btn btn-primary">Absenden</button>
    </div>
  </div>
</form>

