---
layout: page
title: Home
header: Der Löwenrudel Blog
---
{% include JB/setup %}


Dies ist der Blog von [Friederike][1] und [Nils Löwe][2]. Wir schreiben über unsere gemeinsamen Projekte als [Löwe Software][3], unsere Erfahrungen mit
Selbst- und Zeitmanagement, sowie über alle weiteren Themen die wir spannend genug finden um sie mit der Welt teilen zu wollen. 

Viel Spass beim Stöbern
<br>
Rike & Nils

<div class="row">
  <div class="col-sm-10">

    <h4>Letzte Beiträge</h4>

    {% for post in site.posts limit: 5 %}
      <h5>{{ post.date | date_to_string }}: <a href="{{ post.url }}">{{ post.title }}</a></h5>
      <p>
      {{ post.content | strip_html | truncatewords:42}}
      <a href="{{ post.url }}">weiterlesen</a><br><br>
      </p>
    {% endfor %}
  </div>

  <div class="blog-1">
    <div class="col-sm-2 links">
      <div class="tags">
        <h6>Kategorien</h6>
        {% assign categories_list = site.categories %}
        {% include JB/categories_list %}
      </div>
    </div>
  </div>
</div>

[1]: http://friederike-loewe.de
[2]: http://nils-loewe.de
[3]: http://loewe-software.de
