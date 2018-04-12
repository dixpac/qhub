module TestOmniauthHelper
  def stub_omniauth(provider: :google_oauth2)
    enable_test_mode
    add_mock_response(provider,
      {
        "provider" => provider.to_s,
        "uid" => "100000000000000000000",
        "info" => {
          "name" => "Omni User",
          "email" => "omni@example.com",
        },
        "credentials" => {
          "token" => "123",
          "refresh_token" => "11aa223",
          "expires_at" => 1496120719,
          "expires" => true
        }
      }
    )
  end

  def stub_omniauth_for(user:, provider: :google_oauth2)
    enable_test_mode
    oauth_info = user.oauth2_user_infos.first

    add_mock_response(provider,
      {
        "provider" => provider.to_s,
        "uid" => oauth_info.uid,
        "info" => {
          "name" => user.name,
          "email" => user.email,
        },
        "credentials" => {
          "token" => "123",
          "refresh_token" => "11aa223",
          "expires_at" => 1496120719,
          "expires" => true
        }
      }
    )
  end

  private
    def enable_test_mode
      OmniAuth.config.test_mode = true
    end

    def add_mock_response(provider, omni_hash)
      OmniAuth.config.mock_auth[provider] = OmniAuth::AuthHash.new(omni_hash)
    end
end
