class Article < ActiveRecord::Base
  def to_param
    slug 
  end
  
  validates :title, presence: true, length: { minimum: 2 }, uniqueness: true
  
  has_many :comments, dependent: :destroy
end