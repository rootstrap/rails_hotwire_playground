class CardsController < ApplicationController
  before_action :set_card, only: %i[edit update destroy]

  def edit; end

  def create
    card = Card.create!(card_params)
    redirect_to board_path(card.board)
  end

  def update
    @card.update!(card_params)
    redirect_to board_path(@card.board)
  end

  def destroy
    @card.destroy!
    redirect_to board_path(@card.board)
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:name, :position, :column_id)
  end
end
