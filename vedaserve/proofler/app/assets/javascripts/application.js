// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.canvasResize
//= require jquery.exif
//= require jquery-ui
//= require best_in_place
//= require video
//= require flat-ui-pro
//= require jquery.scrollTo
//= require jquery.slimscroll.min
//= require formValidation
//= require bootstrap
//= require bootstrap-tour
//= require modals
//= require star-rating
//= require uservoice
//= require intro
//= require data-confirm-modal
//= require_tree .

$(document).ready(function () {
  Proofler.setup();
  jQuery('.best_in_place').best_in_place();
});
