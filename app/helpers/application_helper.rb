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

# def convert_latex(sections)
#     text = "Laura Phelps\n"
#     text = text + "\n# " + @essay.title + "\n"
#     sections.each do |section|
#       text = text + "\n" + section.final_draft unless section.final_draft.blank?
#     end
#     @pdf = PandocRuby.markdown(text, :standalone).to_latex
#     path = "app/assets/files/test.tex"
#     File.open(path, "w+") do |f|
#       f.write(@pdf)
#     end
#     path
#   end


  def write_md(sections, sources)
    text = "Laura Phelps\n"
    text = text + "\n# " + @essay.title + "\n"
    sections.each do |section|
      text = text + "\n" + section.final_draft + "\n" unless section.final_draft.blank?
    end
    if sources.any?
      text += "\n### Works Cited\n"
      sources.each do |source|
        text = text + "\n" + source.citation + "\n"
      end
    end
    path = "app/assets/files/test.md"
    File.open(path, "w+") do |f|
      f.write(text)
    end
    path
  end

  #trying to convert to pdf; I'm sure there's a nicer way to do this?
  # def md_to_pdf(input_path, output_path)
  #
  #   #forking to execute command without stopping server
  #   command = "pandoc " + input_path + " -o " + output_path
  #
  #   pid = fork
  #   if pid  # pid is not nil, we are in the parent process
  #     Process.wait pid
  #     output_path
  #   else   # pid is nil, we are in the child process
  #     exec(command)
  #   end
  # end


end
