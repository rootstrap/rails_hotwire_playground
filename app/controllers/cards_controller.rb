class CardsController < ApplicationController
  before_action :set_card, only: %i[update destroy]

  def edit; end

  def create
    card = Card.new(card_params)
    card.save!
    redirect_to card.board
  end

  def update
    @card.update!(card_params)
    redirect_to @card.board
  end

  def destroy
    @card.destroy!
    redirect_to @card.board
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:name, :position, :column_id)
  end
end
