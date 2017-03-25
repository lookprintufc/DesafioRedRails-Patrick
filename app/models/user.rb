class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]
    has_many :places

  #Login facebook --> [controller]: users/omniauth_callbacks
  def self.face_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.name.split(' ').first
      user.last_name = auth.info.name.split(' ', 2).last
       if auth.extra.raw_info.birthday.nil?
        user.birthdate = nil
      else
        user.birthdate = Date.strptime(auth.extra.raw_info.birthday, "%m/%d/%Y")
      end
      user.profile_pic = auth.info.image
      user.save!
    end

  end



end
