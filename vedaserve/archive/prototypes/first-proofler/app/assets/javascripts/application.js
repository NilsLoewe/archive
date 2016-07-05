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
//= require alert
//= require_tree .
//= require jquery.quickflip.min
//= require flatui-checkbox

$(function () {
  $('.quickflip-wrapper').quickFlip();

  //$(".accordion").accordion({ header: "h3", heightStyle: "content" });
  $(".accordion").accordion({
    header: "h3",
    heightStyle: "content",
    activate: function(event, ui) {
        $.cookie('saved_index', null);
        $.cookie('saved_index', $(".accordion")
                .accordion("option", "active"));
    },
    active: parseInt($.cookie('saved_index')),
    collapsible: true
  });

  // TODO: Kann man das einfacher haben?
  $(".accordion2").accordion({
    header: "h3",
    heightStyle: "content",
    activate: function(event, ui) {
        $.cookie('saved_index2', null);
        $.cookie('saved_index2', $(".accordion2")
                .accordion("option", "active"));
    },
    active: parseInt($.cookie('saved_index2')),
    collapsible: true
  });

  $(function() {
    //for bootstrap 3 use 'shown.bs.tab' instead of 'shown' in the next line
    $('a[data-toggle="tab"]').on('click', function (e) {
      //save the latest tab; use cookies if you like 'em better:
      localStorage.setItem('lastTab', $(e.target).attr('href'));
    });

    //go to the latest tab, if it exists:
    var lastTab = localStorage.getItem('lastTab');

    if (lastTab) {
      $('a[href="'+lastTab+'"]').click();
    }
  });

  function removeDebugPanels() {
    $('.debug-panel').remove();
    $('.debug-colors').remove();
    $('.debug_dump').remove();
  }

  $(".js-remove-debug-panels").click(function () {
    if (confirm("Removing debug panels from current session")) {
      sessionStorage.setItem("remove-debug-panels", true);
      removeDebugPanels();
    }
  });

  if (sessionStorage.getItem("remove-debug-panels")) {
    removeDebugPanels();
  }
});

$(document).ready(function () {
  function selectQuestion() {
    $('.front').click(function () {
      $(this).parents('.question').toggleClass('checked');
    });
  }

  function frontBackToggle() {
    $('.js-animate-toggle').click(function () {
      var $parent = $(this).parents('.js-animate');

      // start animateion
      $parent.find('.js-animate-target').toggleClass('slide');

      // make sure that there is only one opened element
      $parent.addClass('current');
      $('.js-animate').not('.current').find('.js-animate-target').removeClass('slide');
      $parent.removeClass('current');
    });
  }

  selectQuestion();
  frontBackToggle();
});
