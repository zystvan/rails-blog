class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def show
#    @article = Article.find_by_id(params[:id])
    @article = Article.find_by_slug(params[:id])
#    @article = Article.find_by_slug(params[:slug])
    
    render layout: 'blog'
  end
  
  def new
    @article = Article.new
  end
  
  def edit
#    @article = Article.find_by_slug(params[:slug])
    @article = Article.find_by_slug(params[:slug])
  end
  
  def create
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to "#{articles_url}/#{@article.slug}"
    else
      render 'new'
    end
  end
  
  def update
    @article = Article.find_by_slug(params[:slug])
    
    if @article.update(article_params)
      redirect_to "#{articles_url}/#{@article.slug}"
    else
      render 'edit'
    end
  end
  
  def destroy
    @article = Article.find_by_slug(params[:slug])
    @article.destroy
    
    redirect_to articles_url
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end