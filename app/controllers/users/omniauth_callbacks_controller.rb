class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    service = Service.where(provider: auth.provider, uid: auth.uid).first

    if service.present?
      user = service.user
    else
      user = User.create(
        email: auth.info.email,
        password: Devise.friendly_token[0,20]
      )

      user.services.create(
      provider: auth.provider,
      uid: auth.uid,
      expires_at: Time.at(auth.credentials.expires_at),
      access_token_secret: auth.credentials.token
      )
    end

    set_flash_message(:notice, :success, kind:  "Facebook")
    sign_in_and_redirect(user, event: :authentication)
  end

  def github
    redirect_to :root
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end

# Github


# Facebook
#<OmniAuth::AuthHash credentials=#<OmniAuth::AuthHash expires=true expires_at=1557917939 token="EAAKMVKrfnDsBAGoxgIBCREXcNyElAAawqIkPvYQSsUBKpNGsgnJZCt2RkdzDGWSWTaO9ElrUtqEDiy8x3CNqWtIlZAEP1M4VRZBk5JpeXygAIJa3iEPaH4cir6GPSY7No3XXnX6pZABa2Ahc9yHBQIgKm4Q34wMr1XFKml4wpgZDZD"> extra=#<OmniAuth::AuthHash raw_info=#<OmniAuth::AuthHash email="alexerna8@gmail.com" id="2369065663365553" name="Alex Miasoiedov">> info=#<OmniAuth::AuthHash::InfoHash email="alexerna8@gmail.com" image="http://graph.facebook.com/v2.10/2369065663365553/picture" name="Alex Miasoiedov"> provider="facebook" uid="2369065663365553">
