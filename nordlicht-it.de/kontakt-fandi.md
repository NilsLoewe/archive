---
layout: page-2
title: Kontakt - Loai Fandi
menu: kontakt
permalink: /kontakt/fandi/
---

Wenn Sie mir pers&ouml;nlich eine Nachricht oder Anfrage senden wollen, f&uuml;llen Sie bitte dieses Formular aus.

<form name="contactform" method="post" action="/mailer-fandi.php" class="form-horizontal" role="form">
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
    <label for="inputTopic" class="col-sm-2 control-label">Thema:</label>
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