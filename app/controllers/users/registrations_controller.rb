class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super
    notify_referal
  end

  protected

  def build_resource(hash = {})
    super
    if cookies[:referral_code] && referrer = User.find_by(referral_code: cookies[:referral_code])
      self.resource.referred_by = referrer
    end
  end

  def notify_referal
    if self.resource.referred_by
      notification = Notification.create(user_id: self.resource.id, recipient_id: self.resource.referred_by.id, action: 'follow', notifiable_id: self.resource.id, notifiable_type: self.resource.class)
      NotificationRelayJob.perform_later(notification)
    end
  end
end