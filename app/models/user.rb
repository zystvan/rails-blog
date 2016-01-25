class User < ActiveRecord::Base
  has_secure_password
  
  has_many :articles, dependent: :destroy
  
  def email_is_public?
    self.email_public == true
  end
end