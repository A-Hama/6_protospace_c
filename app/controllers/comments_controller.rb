class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :destroy, :update]
  before_action :set_comment, only:[:edit, :update, :destroy]
  before_action :set_prototype


  def create
    @comment = @prototype.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to prototype_path(@prototype)}
        format.json
      end
    else
      redirect_to prototype_path(@prototype)
    end
  end

  def destroy
    if @comment.user = current_user
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to prototype_path(@prototype), notice: 'Your comment was successfully deleted'}
        format.json
      end
    else
      redirect_to prototype_path(@prototype)
    end
  end

  def edit
  end

  def update
      @comment.update(comment_params)
      redirect_to prototype_path(@prototype), notice: 'Your comment was successfully updated'
  end


  private
  def comment_params
    params.require(:comment).permit(:content, :prototype_id).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end


end
