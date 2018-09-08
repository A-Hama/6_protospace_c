class TagsController < ApplicationController
  def index
    @tags = Tag.all.page(params[:page]).per(20)
  end

  def show
    @tag = Tag.find(params[:id])
    @prototypes = @tag.prototypes.page(params[:page]).per(10)
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to root_path
  end
end
