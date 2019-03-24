class Event < ApplicationRecord
  belongs_to :eventable, polymorphic: true
  belongs_to :user
end
