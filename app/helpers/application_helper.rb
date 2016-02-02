module ApplicationHelper
  def markdown(text)
    options = {
      filter_html: true,
      hard_wrap: true,
      lax_spacing: true,
      with_toc_data: true
    }

    extensions = {
      autolink: true,
      superscript: true,
      fenced_code_blocks: true,
      tables: true,
      autolink: true,
      strikethrough: true,
      space_after_headers: true,
      footnotes: true,
      underline: true,
      highlight: true,
      quote: true,
      superscript: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end