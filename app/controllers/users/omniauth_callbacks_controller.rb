class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :redirect_to_root_if_user_is_logged_in

  before_action :set_service
  before_action :set_user
  before_action :update_or_create_oaut2_info

  def google_oauth2
    handle_auth "Google"
  end

  private
    def handle_auth(kind)
      Current.user = @user
      sign_in_and_redirect @user, event: :authentication
      set_flash_message :notice, :success, kind: kind
    end

    def auth
      request.env['omniauth.auth']
    end

    def redirect_to_root_if_user_is_logged_in
      redirect_to root_path if Current.user
    end

    def set_service
      @service = Oauth2UserInfo.where(provider: auth.provider, uid: auth.uid).first
    end

    def set_user
      if @service.present?
        @user = @service.user
      else
        @user = User.create_from_omniauth!(attributes: auth)
      end
    end

    def service_attrs
      expires_at = auth.credentials.expires_at.present? ? Time.at(auth.credentials.expires_at) : nil
      {
        provider: auth.provider,
        uid: auth.uid,
        expires_at: expires_at,
        access_token: auth.credentials.token,
        access_token_secret: auth.credentials.secret,
      }
    end

    def update_or_create_oaut2_info
      if @service.present?
        @service.update(service_attrs)
      else
        @user.oauth2_user_infos.create(service_attrs)
      end
    end
end
