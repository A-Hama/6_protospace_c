class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_prototype

  def create
    @comment = @prototype.comments.create(content: comment_params[:content], prototype_id: comment_params[:prototype_id],user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to prototype_path(@prototype)}
      format.json
    end
  end

  def destroy
    @comment = Comment.find_by(params[:id])
    @comment.destroy
    redirect_to prototype_path(@prototype)
  end

  def edit
    @comment = Comment.find(params[:id])
    @comment.update(content: comment_params[:content], prototype_id: comment_params[:prototype_id],user_id: current_user.id)
    redirect_to prototype_path(@prototype)
  end


  private

  def comment_params
    params.require(:comment).permit(:content, :prototype_id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
