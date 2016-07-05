var Proofler = function () {
  // Adjusts the height of all .js-eq-height-target elements to the height of .js-eq-height-source
  function eqHeight() {
    $('.js-eq-height').each(function (index, item) {
      var $item = $(item),
          sourceHeight = $item.find('.js-eq-height-source').height(),
          $targets = $item.find('.js-eq-height-target');

      $targets.each(function (index, target) {
        var $target = $(target);
        if (sourceHeight > $target.height()) {
          $target.height(sourceHeight);
        }
      });
    });
  }

  function setupSpinner() {
    $('.js-spinner').each(function () {
      // add the overlay with loading image to the page
      var $over = $('<div class="overlay">' +
            '<img id="loading" src="/assets/spinner.gif" width="200%">' +
            '</div>'),
          $spinner = $(this);
      $over.appendTo('body');

      // click on the overlay to remove it
      $over.click(function() {
        $(this).remove();
      });

      setTimeout(function(){
        $over.remove();
        $('.js-spinner-show').removeClass('hide');
      }, 3000);
    });
  }

  function newFact() {
    $('.js-new-fact').click(function () {
      var $this = $(this), id = $this.data('option-id');
      $('#newfact' + id).removeClass('hide');
      $('html,body').scrollTo($this, 200);
    });
  }

  function newOption() {
    $('.js-new-option').click(function () {
      $('#addoption').toggle('show');
      $('#newoption').toggle('show');
    });
  }

  function assignmentUpdate() {
    $('.js-assignment').blur(function () {
      var $this = $(this), id = $this.data('assignment-id');
      $("#edit_assignment_" + id).submit();
      jQuery('#check' + id).show();
      setTimeout(function(){
        jQuery('#check' + id).fadeOut();
      }, 600);
    });
    $('.js-assignment').on('input', function () {
      var $this = $(this), id = $this.data('assignment-id');
      jQuery('#check' + id).hide();
    });
  }

  function newComment() {
    $('.js-new-comment').click(function () {
        var $this = $(this), id = $this.data('option-id');
        $('#newcomment' + id).toggle('show');
        $('html,body').scrollTo($this, 200);
    });
  }

  function newGlobalComment() {
    $('.js-new-global-comment').click(function () {
      var $this = $(this), id = $this.data('option-id');
      $('#newglobalcomment').toggle('show');
      $('html,body').scrollTo($this, 200);
    });
  }

  function clientPictureResize() {
    $('input#original_post_picture').change(function () {
      var file = this.files[0];
      $('canvas').remove();
      $.canvasResize(file, {
        width   : 800,
        crop    : false,
        quality : 80,
        callback: function (data, width, height) {
          $('input#image_file').val(data);
        }
      });
    });
  }

  // http://getbootstrap.com/javascript/#dropdowns
  function setupDropdown() {
    $('.dropdown-toggle').dropdown();
  }

  function setupTour() {
    ProoflerTour.setup();
  }

  function scrollToForm() {
    $("#lp-start-link").click(function() {
      $('html,body').scrollTo(document.getElementById('lp-form'), 800);
      $("#decision_admin_attributes_name").focus();
    });
  }

  function prepareDecisionCar() {
    $('#btn-prepare-car').click(function () {
      var $this = $(this), id = $this.data('lp-frame-content');
      clearButtons();
      $('#lp-frame-content').attr('src', 'assets/laptop_frame_car.png');
      $('#btn-prepare-car').addClass('btn-pressed');
      $('#decision_title').val($('#btn-prepare-car').text().trim());
      setupFormHeading($('#btn-prepare-car').text().trim());
      addTemplateData("Audi", "Kilometerleistung", "TÜV", "Vorbesitzer", "Scheckheft", "PS")
    });
  }

  function prepareDecisionUni() {
    $('#btn-prepare-uni').click(function () {
      var $this = $(this), id = $this.data('lp-frame-content');
      clearButtons();
      $('#lp-frame-content').attr('src', 'assets/laptop_frame_uni.png');
      $('#btn-prepare-uni').addClass('btn-pressed');
      $('#decision_title').val($('#btn-prepare-uni').text().trim());
      setupFormHeading($('#btn-prepare-uni').text().trim());
      addTemplateData("Uni Hamburg", "Ranking auf Topuniv.", "Studiengebühren p.m.", "Netzwerk", "Reputation", "Entfernung -> Heimat")
    });
  }

  function prepareDecisionMedical() {
    $('#btn-prepare-medical').click(function () {
      var $this = $(this), id = $this.data('lp-frame-content');
      clearButtons();
      $('#lp-frame-content').attr('src', 'assets/laptop_frame_medical.png');
      $('#btn-prepare-medical').addClass('btn-pressed');
      $('#decision_title').val($('#btn-prepare-medical').text().trim());
      setupFormHeading($('#btn-prepare-medical').text().trim());
      addTemplateData("Schön Klinik", "Behandlungsfälle p.a.", "Verweildauer", "Platz auf weisser Liste", "Entfernung -> Heimat", "Zuzahlung")
    });
  }

  function prepareDecisionHR() {
    $('#btn-prepare-hr').click(function () {
      var $this = $(this), id = $this.data('lp-frame-content');
      clearButtons();
      $('#lp-frame-content').attr('src', 'assets/laptop_frame_people.png');
      $('#btn-prepare-hr').addClass('btn-pressed');
      $('#decision_title').val($('#btn-prepare-hr').text().trim());
      setupFormHeading($('#btn-prepare-hr').text().trim());
      addTemplateData("Bernd Beispiel", "Abschluss", "Note", "Aktueller Arbeitgeber", "Berufserfahrung", "Gehaltsvorstellung")
    });
  }

  function prepareDecisionProduct() {
    $('#btn-prepare-product').click(function () {
      var $this = $(this), id = $this.data('lp-frame-content');
      clearButtons();
      $('#lp-frame-content').attr('src', 'assets/laptop_frame_product.png');
      $('#btn-prepare-product').addClass('btn-pressed');
      $('#decision_title').val($('#btn-prepare-product').text().trim());
      setupFormHeading($('#btn-prepare-product').text().trim());
      addTemplateData("Wirtschaftsmagazin", "Anzeigenformat", "Dauer", "Kosten", "erscheint", "Auflage pro Quartal")
    });
  }

  function clearDecision() {
    $('#btn-clear').click(function () {
      var $this = $(this), id = $this.data('lp-frame-content');
      clearButtons();
      $('#lp-frame-content').attr('src', 'assets/laptop_frame_clear.png');
      $('#btn-clear').addClass('btn-pressed');
      $('#decision_title').val("");
      clearFormHeading();
    });
  }

  function addTemplateData(option, fact1, fact2, fact3, fact4, fact5) {
    clearTemplateData();
    $('.decision-template').append('<input name="decision[option]" id="decision_option" value="' + option + '" type="hidden">');
    $('.decision-template').append('<input name="decision[facts[fact1]]" id="decision_facts_name1" value="' + fact1 + '" type="hidden">');
    $('.decision-template').append('<input name="decision[facts[fact2]]" id="decision_facts_name2" value="' + fact2 + '" type="hidden">');
    $('.decision-template').append('<input name="decision[facts[fact3]]" id="decision_facts_name3" value="' + fact3 + '" type="hidden">');
    $('.decision-template').append('<input name="decision[facts[fact4]]" id="decision_facts_name4" value="' + fact4 + '" type="hidden">');
    $('.decision-template').append('<input name="decision[facts[fact5]]" id="decision_facts_name5" value="' + fact5 + '" type="hidden">');
  }

  function clearTemplateData() {
    $('.decision-template').empty();
  }

  function setupFormHeading(title) {
    $('#form-title').hide();
    $('#form-heading').text(title);
    $('#form-heading').show();
  }

  function clearFormHeading() {
    $('#form-title').show();
    $('#form-heading').hide();
  }

  function clearButtons() {
    $('#btn-prepare-car').removeClass('btn-pressed');
    $('#btn-prepare-uni').removeClass('btn-pressed');
    $('#btn-prepare-medical').removeClass('btn-pressed');
    $('#btn-prepare-hr').removeClass('btn-pressed');
    $('#btn-prepare-product').removeClass('btn-pressed');
    $('#btn-clear').removeClass('btn-pressed');
  }

  function disableDecisionCreateButton() {
    $("#new_decision").submit(function () {
      $('#create_decision').prop('disabled', true);
    });
  }

  function disableOptionCreateButton() {
    $("#new_option").submit(function () {
      $('#new-option').prop('disabled', true);
      $('#waitforoption').show();
      $('#newoption').hide();
    });
  }



  function setup() {
    eqHeight();
    setupSpinner();
    newFact();
    newComment();
    newOption();
    assignmentUpdate();
    newGlobalComment();
    clientPictureResize();
    setupDropdown();
    setupTour();
    scrollToForm();
    prepareDecisionCar();
    prepareDecisionUni();
    prepareDecisionMedical();
    prepareDecisionHR();
    prepareDecisionProduct();
    clearDecision();
    disableDecisionCreateButton();
    disableOptionCreateButton();
  }

  // functions that can be called externally
  return {
    setup: setup
  };
}();
