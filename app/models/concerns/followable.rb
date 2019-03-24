module Followable
  extend ActiveSupport::Concern

  def follow?(following)
    self.events.where("events.eventable_id = ? AND events.eventable_type = ? AND events.action = 'follow'", following.id, following.class).any?
  end
end