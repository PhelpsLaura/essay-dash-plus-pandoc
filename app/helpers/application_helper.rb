module ApplicationHelper
  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

  def convert_pdf(sections)
    text = ""
    sections.each do |section|
      text = text + "\n" + section.final_draft unless section.final_draft.blank?
    end
    @pdf = PandocRuby.markdown(text, :standalone).to_latex
    path = "app/assets/files/temp.tex"
    File.open(path, "w+") do |f|
      f.write(@pdf)
    end
    path
  end


end
