class Article < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 2 }, uniqueness: true
  
  has_many :comments, dependent: :destroy
end