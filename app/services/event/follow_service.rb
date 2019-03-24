class Event::FollowService
  def initialize(follower, following)
    @follower = follower
    @following = following
  end
  
  def call
    Event::FollowJob.perform_later(@follower, @following)
  end
end
