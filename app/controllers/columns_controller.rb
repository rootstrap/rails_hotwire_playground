class ColumnsController < ApplicationController
  before_action :set_column, only: %i[edit update destroy]

  def edit; end

  def create
    column = Column.create!(column_params)
    redirect_to board_path(column.board)
  end

  def update
    @column.update!(column_params)
    redirect_to board_path(@column.board)
  end

  def destroy
    @column.destroy!
    redirect_to board_path(@column.board)
  end

  private

  def set_column
    @column = Column.find(params[:id])
  end

  def column_params
    params.require(:column).permit(:name, :board_id)
  end
end
