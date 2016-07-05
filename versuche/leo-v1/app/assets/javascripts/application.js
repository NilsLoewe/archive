// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.ui.all
//= require jquery.cookie
//= require jquery.modal
//= require rest_in_place
//= require_tree .

  $(function(){
    var act = 0;
    // Accordion
    $("#accordion").accordion({
      header: "h3",
      heightStyle: "content",
      activate: function(event, ui) {
          $.cookie('saved_index', null);
          $.cookie('saved_index', $("#accordion")
                  .accordion("option", "active"));
      },
      active: parseInt($.cookie('saved_index')),
      collapsible: true
    });

    $("#accordion2").accordion({
      header: "h3",
      heightStyle: "content"
    });

    //hover states on the static widgets
    $('#dialog_link, ul#icons li').hover(
    function() { $(this).addClass('ui-state-hover'); },
    function() { $(this).removeClass('ui-state-hover'); }
    );
  });
