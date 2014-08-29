require 'github/markup'

MarkdownRails.configure do |config|
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
    :fenced_code_blocks => true,
    :autolink => true,)
  config.render do |markdown_source|
    Rails.logger.info 'Logger: calling GitHub::Markup'
    markdown.render(markdown_source)
  end
end
