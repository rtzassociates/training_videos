class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation, :token, :admin
  attr_accessor :password
  before_save :prepare_password
  
  validates_uniqueness_of :username
  
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true
  
  has_many :training_sessions
  has_many :viewers
  
  default_scope :order => "username ASC"
  
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