json.post do
  json.(@article, :id, :title, :slug)
  json.raw_text @article.text
  json.formatted_text markdown(@article.text)
  json.(@article, :created_at, :updated_at)
end

json.author do
  json.(@author, :id, :name)
  
  if @author.email_public || current_user
    json.email @author.email
  end
end

json.comments @article.comments