class CreateOauth2UserInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :oauth2_user_infos do |t|
      t.references :user, foreign_key: true
      t.string :provider
      t.string :uid
      t.string :access_token
      t.string :access_token_secret
      t.string :refresh_token
      t.string :expires_at
      t.text :auth

      t.timestamps
    end
  end
end
