class ItemsController < ApplicationController
  before_action :logged_in?, except: %i[index show]

  def index
    @items = Item.all
    @categories = Category.all
  end
  
  def new
    @item = current_user.items.build
  end

  def create
    @categories = Category.all
    @item = current_user.items.build(items_params)
    
    if @item.save
      redirect_to root_path, notice: 'Item was Add to the Store.'
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(book_params)
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    
    redirect_to root_path, notice: 'The item was removed from the Store.'
  end

  private

  def items_params
    params.require(:item).permit(:name, :description, :image_url, :publication_date, :price, :category_id)
  end

end
