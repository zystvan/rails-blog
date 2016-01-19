class Article < ActiveRecord::Base
  def to_param
    slug
  end
  
  def self.find(input)
    if input.to_i != 0
      super
    else
      find_by_slug(input)
    end
  end
  
  validates :title, presence: true, length: { minimum: 2 }
  validates :slug, presence: true, uniqueness: true
  
  belongs_to :user
  has_many :comments, dependent: :destroy
end