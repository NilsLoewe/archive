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
