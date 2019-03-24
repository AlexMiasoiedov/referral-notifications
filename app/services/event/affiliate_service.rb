class Event::AffiliateService
  def initialize(referrer, referal)
    @referrer = referrer
    @referal = referal
  end
  
  def call
    Event::AffiliateJob.perform_later(@referrer, @referal)
  end
end
