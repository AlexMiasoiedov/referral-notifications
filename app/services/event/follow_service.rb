class Event::FollowService
  def initialize(follower, following, action = 'follow')
    @follower = follower
    @following = following
    @action = action
  end

  def call
    follow = @follower.followings.find_or_initialize_by(following_id: @following.id)
    follow.data = { follower_email: @follower.email, following_email: @following.email }
    follow.status = @action

    Event::FollowJob.perform_later(follow.id) if (follow.new_record? || follow.changed?) && follow.save
  end
end
