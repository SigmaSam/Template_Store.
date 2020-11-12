class ItemsController < ApplicationController

  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if item.save
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
    book.destroy
    
    redirect_to root_path, notice: 'The item was removed from the Store.'
  end

  private

  def book_params
    params.require(:item).permit(:name, :owner, :description, :image_url, :publication_date, :price)
  end

end
