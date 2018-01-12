class SectionsController < ApplicationController

    def index
      @essay = Essay.find(params[:essay_id])
      @sections = @essay.sections.all
    end

    def show
      @essay = Essay.find(params[:essay_id])
      @section = @essay.sections.find(params[:id])
    end

    def new
      @essay = Essay.find(params[:essay_id])
      @section = @essay.sections.new
    end

    def create
      @essay = Essay.find(params[:essay_id])
      @section = @essay.sections.new(section_params)
      if @section.save
        redirect_to essay_section_path(@essay, @section)
      else
        render 'new'
      end
    end

    def edit
      @essay = Essay.find(params[:essay_id])
      @section = @essay.sections.find(params[:id])
    end

    def edit_final
      @essay = Essay.find(params[:essay_id])
      @section = @essay.sections.find(params[:id])
    end

    def update
      @essay = Essay.find(params[:essay_id])
      @section = @essay.sections.find(params[:id])
      if @section.update(section_params)
        redirect_to essay_section_path(@essay, @section)
      else
        render 'edit'
      end
    end

    def destroy
      @essay = Essay.find(params[:essay_id])
      @section = @essay.sections.find(params[:id])
      @section.destroy

      redirect_to essay_path(@essay)
    end

    private
      def section_params
        params.require(:section).permit(:title, :outline, :rough_drafting, :final_draft)
      end
end
