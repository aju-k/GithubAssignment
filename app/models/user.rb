class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :omniauth_providers => [:github]
  devise :database_authenticatable,
         :rememberable, :trackable,
         :omniauthable, :omniauth_providers => [:github]
  validates :username, presence: true

  def self.from_omniauth(auth)
    uid = auth.extra.raw_info.id
      where(uid: uid).first_or_create do |user|
        user.uid = uid
        user.email = auth.info.email
        user.username = auth.info.nickname
        user.token = auth.credentials.token
        user.password =  Devise.friendly_token[0,20]
      end
  end

  def login_github
    Github.new oauth_token: token
  end

  protected

  def email_required?
    true
  end

end
