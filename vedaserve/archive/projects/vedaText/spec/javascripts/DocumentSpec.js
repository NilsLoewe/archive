describe('document job queue', function () {

  beforeEach(function () {
    subscriptionSpy = jasmine.createSpyObj('subscription', ['cancel']);
    fayeSpy   = jasmine.createSpyObj('faye',   ['subscribe']);
    fayeSpy.subscribe.andReturn(subscriptionSpy);
    documentId  = '1234';
    otherDocumentId = '1337';

    callbacks = {
      done:  jasmine.createSpy('done'),
      abort: jasmine.createSpy('abort')
    };

    queue.init({
      timeout:  100,
      faye:     fayeSpy
    });

    spyOn($, 'ajax')
  });

  it('should listen using the correct faye channel', function () {
    queue.start(documentId, callbacks);

    expect(fayeSpy.subscribe).toHaveBeenCalledWith('/pdf/1234', jasmine.any(Function));
  });

  it('should listen for responses using faye when started', function () {
    queue.start(documentId, callbacks);

    expect(fayeSpy.subscribe).toHaveBeenCalled();
  });

  it('should not start any job if one already running', function () {
    queue.start(documentId, callbacks);
    queue.start(otherDocumentId, callbacks);
    queue.start(documentId, callbacks);

    expect(fayeSpy.subscribe.callCount).toBe(1);
  });

  it('should notify the server that the job can be started', function () {
    queue.start(documentId, callbacks);

    expect($.ajax).toHaveBeenCalledWith('/pdftex/1234', jasmine.any(Object));
  });

  it('should abort the job when not receiving completion message', function () {
    queue.start(documentId, callbacks);
    waits(200);

    runs(function () {
      expect(callbacks.abort).toHaveBeenCalled();
    });
  });

  it('should not abort the job if reply received', function () {
    fayeSpy.subscribe.andCallFake(function (path, callback) {
      callback();
    });

    queue.start(documentId, callbacks);

    expect(callbacks.done).toHaveBeenCalled();
    expect(callbacks.abort.callCount).toBe(0);
  });

});
