class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :create]
  before_action :set_valiables, only: [:destroy, :create]

  def create
    @like = current_user.likes.create(prototype_id: params[:prototype_id])
    respond_to do |format|
      format.html { redirect_to @prototype }
      format.js
    end
  end

  def destroy
    like = current_user.likes.find_by(prototype_id: params[:prototype_id])
    like.destroy
    respond_to do |format|
      format.html { redirect_to @prototype }
      format.js
    end
  end

  private

  def set_valiables
    @prototype = Prototype.find(params[:prototype_id])
    @likes = Like.includes(:prototype).where(prototype_id: params[:prototype_id])
    @prototypes = Prototype.all
    @id_name = "like-#{@prototype.id}"
    @id_heart = "heart-#{@prototype.id}"
  end

end
