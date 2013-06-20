class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation, :token, :admin
  attr_accessor :password
  before_save :prepare_password
  
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true
  
  has_many :videos, :dependent => :destroy
  has_many :categories, :dependent => :destroy
  has_one :agency
  has_one :profile, :dependent => :destroy
  
  default_scope :order => "username ASC"
  
  has_many :favorites
  has_many :views
  
  def favorite_videos
    Video.joins(:favorites).where(:favorites => { :user_id => self.id, :favoriteable_type => "Video" }).order('favorites.created_at DESC')
  end
  
  def favorite_for(obj)
    Favorite.where(:user_id => self.id, :favoriteable_id => obj.id, :favoriteable_type => obj.class).first
  end
  
  def self.authenticate(username, pass)
    user = find_by_username(username)
    return user if user && user.password_hash == user.encrypt_password(pass)
  end
  
  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, token)
  end
  
  private
  
  def prepare_password
    unless password.blank?
      self.token = BCrypt::Engine.generate_salt
      self.password_hash = encrypt_password(password)
    end
  end
end