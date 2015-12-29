class Article < ActiveRecord::Base
  def to_param
#    "#{id}#{"-" + slug}"
    slug
  end
  
  def self.find(input)
    if input.to_i != 0
      super
#      @article = Article.find_by_id(input)
#      
#      redirect_to "/articles/#{@article.slug}"
    else
      find_by_slug(input)
    end
  end
  
  validates :title, presence: true, length: { minimum: 2 }, uniqueness: true
  
  belongs_to :user
  has_many :comments, dependent: :destroy
end