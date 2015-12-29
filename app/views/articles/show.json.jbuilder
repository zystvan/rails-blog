json.title @article.title
json.text @article.text
json.author do
  json.name @article.user
end