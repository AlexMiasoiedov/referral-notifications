App.notifications = App.cable.subscriptions.create("NotificationsChannel", {
  connected: function() {
    //code
  },
  disconnected: function() {
    //code
  },
  received: function(data) {
    var notificationBlock = $('.user-notifications');

    if (notificationBlock.length && data.body.length) {
      var notification = $(`
        <div class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-delay="15000">
          <div class="toast-header">
            <strong class="mr-auto"></strong>
            <small class="time-ago"></small>
            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="toast-body">
          </div>
        </div>`);

      notification.find('strong.mr-auto').append(data.action.charAt(0).toUpperCase() + data.action.substr(1));
      notification.find('small.time-ago').append(data.ago + " ago");
      notification.find('.toast-body').append(data.body);
      notification.attr('id', data.id);

      notificationBlock.prepend(notification);

      $(notification).toast('show')

      $('#' + data.id).on('hidden.bs.toast', function () {
        $(this).remove();
      })
    }
  }
});
