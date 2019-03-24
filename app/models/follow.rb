class Follow < ApplicationRecord
  include ActiveModel::Dirty
  VALID_STATUSES = %w(follow unfollow black_list)

  belongs_to :follower, class_name: "User"
  belongs_to :following, class_name: "User"

  validates :status, inclusion: { in: VALID_STATUSES, message: "%{value} is not valid staus." }
end
