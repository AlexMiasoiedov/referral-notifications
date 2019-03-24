class Event::AffiliateJob < ApplicationJob
  queue_as :default

  def perform(referrer, referal)
    event_params = {
      user_id: referrer.id,
      eventable_id: referal.id,
      eventable_type: refaral.class,
      action: 'affiliate',
      data: {
        referrer_email: referrer.email,
        referal_email: referal.emal
      }
    }

    Event.create(event_params)
  end
end
