class Event::FollowJob < ApplicationJob
  queue_as :default

  def perform(follow_id)
    follow = Follow.find(follow_id)

    event_params = {
      user_id: follow.follower.id,
      eventable_id: follow.id,
      eventable_type: follow.class,
      action: follow.status,
      data: {
        follower_email: follow.follower.email,
        following_email: follow.following.email
      }
    }

    Event.create(event_params)
  end
end
