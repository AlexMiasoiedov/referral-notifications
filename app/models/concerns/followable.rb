module Followable
  extend ActiveSupport::Concern

  def follow?(following)
    self.followings.where(following_id: following.id, status: 'follow').any?
  end
end
