module ApplicationHelper
  def markdown(text)
    options = {
      filter_html: true,
      hard_wrap: true,
      space_after_headers: true,
      strikethrough: true,
      lax_spacing: true,
      underline: true,
      highlight: true,
      quote: true,
      footnotes: true,
      with_toc_data: true
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