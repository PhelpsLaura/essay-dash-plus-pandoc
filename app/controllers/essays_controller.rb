class EssaysController < ApplicationController

  def index
    @essays = Essay.all
  end

  def show
    @essay = Essay.find(params[:id])
  end

  def new
    @essay = Essay.new
  end

  def create
    @essay = Essay.new(essay_params)
    if @essay.save
      redirect_to essay_path(@essay)
    else
      render 'new'
    end
  end

  def edit
    @essay = Essay.find(params[:id])
  end

  def update
    @essay = Essay.find(params[:id])
    if @essay.update(essay_params)
      redirect_to essay_path(@essay)
    else
      render 'edit'
    end
  end

  def destroy
    @essay = Essay.find(params[:id])
    @essay.destroy

    redirect_to essays_path
  end

  # def to_tex
  #   @essay = Essay.find(params[:id])
  #   #NOTE: why does order need to be ascending here, descending rendering?
  #   @sections = @essay.sections.order(order: :asc)
  #   @tex = helpers.convert_latex(@sections)
  #   send_file(@tex, disposition: 'attatchment')
  #   #File.delete(@pdf) if File.exist?(@pdf)
  #   #redirect_to essay_path(@essay)
  # end

  #EXTERNAL facing function to be called by user
  def to_md
    _to_md(true)
  end

  #INTERNAL facing function for doing work of writing markdown; sending as download
  # if passed from external facing function
  def _to_md(download)
    @essay = Essay.find(params[:id])
    @sections = @essay.sections.order(order: :asc)
    @sources = Array.new
    @sources = @essay.sources.sort_by{|work| work.citation} unless @essay.sources.empty?
    @md = helpers.write_md(@sections, @sources)
    if download
      send_file(@md, type: 'md', disposition: 'attatchment')
    else
      @md
    end
  end

  def to_pdf
    @essay = Essay.find(params[:id])
    @md = _to_md(false)
    @output = "app/assets/files/test.pdf"
    command = "pandoc " + @md + " -o " + @output
    system(command)

    File.delete(@md) if File.exist?(@md)
    send_file @output, type: 'pdf', disposition: 'attatchment'

    #NOTE: will not download if you redirect. idk why?
    #NOTE: how to safely delete all generated files?
    #redirect_to essay_path(@essay)
  end

  def to_word
    @essay = Essay.find(params[:id])
    @md = _to_md(false)
    @output = "app/assets/files/draft.docx"
    command = "pandoc " + @md + " -o " + @output
    system(command)

    File.delete(@md) if File.exist?(@md)
    send_file @output, type: 'docx', disposition: 'attatchment'
  end

  private
    def essay_params
      params.require(:essay).permit(:title, :due_date, :prompt, :thesis)
    end
end
