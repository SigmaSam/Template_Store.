class CategoriesController < ApplicationController
  before_action :logged_in?
  def new
    @category = Category.new
  end

  def create
    @category = Category.build(category_params)
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    
    redirect_to root_path, notice: 'The Category was removed from the Store.'
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
