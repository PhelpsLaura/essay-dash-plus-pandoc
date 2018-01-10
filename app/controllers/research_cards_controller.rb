class ResearchCardsController < ApplicationController

  def show
    @essay = Essay.find(params[:essay_id])
    @research_card = @essay.research_cards.find(params[:id])
  end

  def new
    @essay = Essay.find(params[:essay_id])
    @research_card = @essay.research_cards.new
  end

  def create
    @essay = Essay.find(params[:essay_id])
    @research_card = @essay.research_cards.new(research_card_params)
    if @research_card.save
      redirect_to essay_path(@essay)
    else
      render 'new'
    end
  end

  def edit
    @essay = Essay.find(params[:essay_id])
    @research_card = @essay.research_cards.find(params[:id])
  end

  def update
    @essay = Essay.find(params[:essay_id])
    @research_card = @essay.research_cards.find(params[:id])
    if @research_card.update(research_card_params)
      redirect_to essay_path(@essay)
    else
      render 'edit'
    end
  end

  def destroy
    @essay = Essay.find(params[:essay_id])
    @research_card = @essay.research_cards.find(params[:id])
    @research_card.destroy

    redirect_to essay_path(@essay)
  end

  private
    def research_card_params
      params.require(:research_card).permit(:body, :title)
    end
end
