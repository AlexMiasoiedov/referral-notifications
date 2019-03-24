class Event::FollowJob < ApplicationJob
  queue_as :default

  def perform(follower, following)
    event_params = {
      user_id: follower.id,
      eventable_id: following.id,
      eventable_type: following.class,
      action: 'follow',
      data: {
        follower_email: follower.email,
        following_email: following.email
      }
    }

    Event.create(event_params)
  end
end
