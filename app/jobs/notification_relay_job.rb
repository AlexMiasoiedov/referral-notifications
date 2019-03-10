include ActionView::Helpers::DateHelper

class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform(notification)
    ActionCable.server.broadcast("notifications:#{notification.recipient.id}", { body: "<strong class='mr-auto'>#{notification.user.email}</strong> signed up by your referral code.".html_safe, ago: distance_of_time_in_words(notification.created_at), id: notification.id, action: notification.action })
  end
end
