module ApplicationHelper
  def current_user
    if session[:user_id] && User.find_by_id(session[:user_id])
      @current_user ||= User.find(session[:user_id])
    end
  end
  
  def require_logged_in
    redirect_to login_url unless current_user
  end

  def require_logged_out
    redirect_to root_url unless !current_user
  end
  
  def markdown(text)
    options = {
      filter_html: true,
      hard_wrap: true,
      link_attributes: { rel: 'nofollow' },
      space_after_headers: true,
      strikethrough: true,
      lax_spacing: true,
      underline: true,
      highlight: true,
      quote: true,
      footnotes: true
    }

    extensions = {
      autolink: true,
      superscript: true,
      fenced_code_blocks: true,
      tables: true,
      autolink: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end