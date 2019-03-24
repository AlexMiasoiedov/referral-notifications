(function () {
  class Follow {
      constructor () {
        this.followBtn = $('.btn-follow');
      }
      setEventListeners () {
        if (this.followBtn.length) {
          this.followBtn.forEach(addFollowLisener)
        }

      }
      addFollowLisener (followBtn) {
        // add async request
      }
  }

  var follow = new Follow();
})()