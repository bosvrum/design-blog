class VideosController < ApplicationController
  before_action :find_video, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show ]

  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to @video, notice: "Video Successfully Uploaded!"
    else
      render :new
    end
  end

  def show
   
  end

  def edit
    
  end

  def update
    if @video.update(video_params)
      redirect_to @video, notice: "Video successfully saved!"
    else
      render :edit
    end
  end

  def destroy
    @video.destroy
    redirect_to videos_path
  end

  private

  def video_params
    params.require(:video).permit(:title,:description,:link, :slug)
  end

  def find_video
    @video = Video.friendly.find(params[:id])
  end

end
