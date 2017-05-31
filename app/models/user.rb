class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  has_many :goodhabits
  has_many :badhabits
  has_many :goalcheckins
  has_many :badhabitcheckins

  def self.from_omniauth(access_token)
    accesstoken = access_token.credentials
    data = access_token.info
    user = User.where(:email => data["email"]).first
    puts "yoooooo" + access_token.inspect

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(
           email: data["email"],
           password: Devise.friendly_token[0,20],
           access_token: accesstoken['token']
        )
      else user
        user.update(access_token: accesstoken['token'])
    end
    user
  end
end
