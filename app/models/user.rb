class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:login]
  before_save :add_api_token_and_role
  attr_accessor :login

 def self.find_for_database_authentication(warden_conditions)
   conditions = warden_conditions.dup
   login = conditions.delete(:login)
   where(conditions).where(["lower(user_name) = :value OR lower(email) = :value", { :value => login.strip.downcase }]).first
 end

protected
 def add_api_token_and_role
  self.role = 'User' if self.role.nil?
  self.api_token  =  SecureRandom.urlsafe_base64
 end
end
