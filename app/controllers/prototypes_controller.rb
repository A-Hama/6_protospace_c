class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :destroy, :edit, :update]

  def index
    @prototypes = Prototype.includes(:user).order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to ({ action: 'new' }), alert: 'New prototype was unsuccessfully created'
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments
  end

  def destroy
    @prototype.destroy if current_user.id == @prototype.user.id
  end

  def edit
    @captures = @prototype.captured_images
    @sub_image = []
    @captures.each do |capture|
      capture.status == "main" ? @main_image = capture : @sub_image << capture
    end
  end

  def update
    if @prototype.user_id == current_user.id
      @prototype.update(prototype_params)
      redirect_to root_url, notice: 'prototype was successfully updated'
    else
      render :index
    end
  end

  def popular
    @prototypes = Prototype.includes(:user).popular
    respond_to do |format|
      format.html
      format.json
    end
  end

  def newest
    @prototypes = Prototype.includes(:user).newest
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
    @like = @prototype.likes
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:content, :status, :id]
    )
  end

  def set_main_thumbnail
    captured_images.find_by(status: 0)
  end

end
