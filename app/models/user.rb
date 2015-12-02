class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook,:instagram]

  ratyrate_rater

  validates_format_of :username, with: /\A[a-zA-Z0-9_\.]*\Z/

  #validates_format_of :name, with: /\A[a-zA-Z\.\s]*\Z/

  validates_format_of :gender, with: /\A(Male|Female)\Z/

  attr_accessor :login

  extend FriendlyId
  friendly_id :username, use: :slugged

  def should_generate_new_friendly_id?
    new_record?
  end

  validates :username,
    :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_hash).first
    end
  end

  has_many :recipes
  has_many :bookmarks
  has_many :follows

  def followed(user)
    user.follows.where(target_id: self.id).first
  end

  def self.from_fb_omniauth(auth)
    where(uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.uid
      user.name = auth.info.name
      user.fbtoken= auth.credentials.token

    end
  end


  def self.from_insta_omniauth(auth)

    where(uid: auth.uid).first_or_create! do |user|

      user.email =auth.info.nickname+ "@instagram.com"
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.nickname
      user.uid =  auth.uid
      user.name = auth.info.name
      user.instatoken = auth.credentials.token

    end
  end


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
end
