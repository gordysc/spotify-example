class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def spotify
    @user = materialize_omniauth_user(provider: provider, uid: uid)

    sign_in_and_redirect @user, event: :authentication
    set_flash_message(:notice, :success, kind: provider.capitalize)
  end

  private

  def email
    omniauth_data["info"]["email"]
  end

  def omniauth_data
    request.env['omniauth.auth']
  end

  def materialize_omniauth_user(credentials)
    user = User.find_or_initialize_by(credentials)

    return user if user.persisted?

    password = Devise.friendly_token[0, 20]

    user.email = email
    user.password = password
    user.password_confirmation = password
    user.save!

    user
  end

  def provider
    omniauth_data["provider"]
  end

  def uid
    omniauth_data["uid"]
  end
end
