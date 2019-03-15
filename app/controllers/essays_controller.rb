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

  def to_pdf
    @essay = Essay.find(params[:id])
    @sections = @essay.sections.order(order: :desc)
    @pdf = helpers.convert_pdf(@sections)
    send_file(@pdf, disposition: 'attatchment')
    #File.delete(@pdf) if File.exist?(@pdf)
    redirect_to essay_path(@essay)
  end

  private
    def essay_params
      params.require(:essay).permit(:title, :due_date, :prompt, :thesis)
    end
end
