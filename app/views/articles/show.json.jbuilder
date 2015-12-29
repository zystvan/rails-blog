json.post do
  json.id @article.id
  json.title @article.title
  json.slug @article.slug
  json.raw_text @article.text
  json.formatted_text markdown(@article.text)
  json.created_at @article.created_at
  json.updated_at @article.updated_at
  json.user_id @article.user_id
end

json.author @article.user

json.comments @article.comments