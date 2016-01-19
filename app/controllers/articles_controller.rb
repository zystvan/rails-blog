class ArticlesController < ApplicationController
  before_action :redirect_to_slug, only: [:show, :edit]
  before_action :require_logged_in, only: [:new, :edit]
  
  def redirect_to_slug
    @article = Article.find(params[:id])
    
    if params[:id] != @article.slug
      redirect_to @article, action: action_name
    end
  end
  
  def index
    @articles = Article.all
    
    render layout: 'blog'
  end
  
  def show
    @article = Article.find(params[:id])
    @author = @article.user
    
    render layout: 'blog'
  end
  
  def new
    @article = Article.new
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def create
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to article_url(@article)
    else
      render 'new'
    end
  end
  
  def update
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
    redirect_to articles_url
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end