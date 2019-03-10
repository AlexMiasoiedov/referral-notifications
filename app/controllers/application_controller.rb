class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_ref_cookie
  before_action :authenticate_user!

  private

  def set_ref_cookie
    if params[:ref]
      cookies[:referral_code] = {
        value: params[:ref],
        expires: 30.days.from_now
      }
    end
  end
end
