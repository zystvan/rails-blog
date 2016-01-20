json.post do
  json.(@article, :id, :title, :slug)
  json.raw_text @article.text
  json.formatted_text markdown(@article.text)
  json.(@article, :created_at, :updated_at)
end

json.author do
  json.id @author.id
  json.name @author.name
  if @author
    json.email @author.email
    json.author_email ".email_is_public?"
  end
end

json.comments @article.comments