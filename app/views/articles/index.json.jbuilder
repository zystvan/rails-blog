@articles.reverse.each do |post|  
  json.post do
    json.(post, :id, :title, :slug)
    json.raw_text post.text
    json.formatted_text markdown(post.text)
    json.(post, :created_at, :updated_at)
  end
  
  json.author do
    json.(post.user, :id, :name)

    if post.user.email_public || current_user
      json.email post.user.email
    end
  end

  json.comments post.comments
end