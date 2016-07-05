queue = (function () {
  var
    jobInProgress,
    documentId,
    callbacks,
    config,
    queue = {}
  ;

  function reset() {
    jobInProgress = false;
  };

  function notifyServer() {
    $.ajax('/pdftex/'+documentId, {});
  };

  function listen() {
    config.faye.subscribe('/pdf/' + documentId, function() {
      reset();
      callbacks.done();
    });
  };

  function aborted() {
    reset();
    callbacks.abort();
  };

  queue.init = function(c) {
    config = c;
    reset();
  };

  queue.start = function (id, cbs) {
    if (!jobInProgress) {
      var that = this;

      documentId = id;
      callbacks = cbs;
      jobInProgress = true;

      listen();
      notifyServer();

      setTimeout(function () {
        if (jobInProgress) {
          aborted();
        }
      }, config.timeout);
    }
  };

  return queue;
})();

// the jQuery binding and modal handling is not tested and therefore not
// part of the initial queue object definition
queue.setup = function (faye) {
  queue.init({
    faye:    faye,
    timeout: 3000
  });

  $('.export-btn').button();
  $('.export-btn').each(function () {
    $(this).click(function () {
      var
        $btn = $(this),
        doneCB = function () {
          $('#export-result').modal();
          $btn.button('reset');
        },
        abortCB = function () {
          $('#export-timeout').modal();
          $btn.button('reset');
        }
      ;

      documentId = $btn.data('document-id');
      queue.start(documentId, {
        done:  doneCB,
        abort: abortCB
      });
      $btn.button('loading');
    });
  });
}
