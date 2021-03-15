class BoardsController < ApplicationController
  before_action :set_board, only: %i[show edit update destroy]

  def index
    @boards = Board.all
  end

  def show; end

  def new
    @board = Board.new
  end

  def edit; end

  def create
    @board = Board.create!(board_params)
    redirect_to @board, notice: 'Board was successfully created.'
  rescue ActiveRecord::RecordInvalid => e
    flash[:error] = e.message
    redirect_to new_board_path
  end

  def update
    @board.update!(board_params)
    redirect_to @board, notice: 'Board was successfully updated.'
  end

  def destroy
    @board.destroy!
    redirect_to boards_url, notice: 'Board was successfully destroyed.'
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name)
  end
end
