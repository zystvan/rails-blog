json.post do
  json.id @article.id
  json.title @article.title
  json.slug @article.slug
  json.raw_text @article.text
  json.formatted_text markdown(@article.text)
  json.created_at @article.created_at
  json.updated_at @article.updated_at
end

json.author do
  json.id @author.id
  json.name @author.name
  if @author.email_is_public?
    json.email @author.email
  end
end

json.comments @article.comments