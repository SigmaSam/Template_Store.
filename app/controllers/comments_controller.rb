class CommentsController < ApplicationController
  before_action :logged_in?

  def new
   @comment = Comment.new
  end

  def create
    @item = Item.find(params[:comment][:item_id])
    comment = @item.comments.build(comment_params)
    comment.user = current_user
    

    if comment.save
      redirect_to comment.item
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    
    redirect_to item_path, notice: 'The comment was deleted.'
  end

private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
