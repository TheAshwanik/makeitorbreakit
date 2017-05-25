class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :goodhabits
  has_many :badhabits
  has_many :goalcheckins
  has_many :badhabitcheckins

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(
           email: data["email"],
           password: Devise.friendly_token[0,20]
        )
    end
    user
  end
end
