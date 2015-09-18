class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def show
  end

  def new
    @upload = Vimeo3.new('id', 'secret', {:accessToken => Settings.vimeo.access_token}).getForm(Settings.vimeo.redirect_url)
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new
    @movie.video_uri = params[:video_uri]

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: '動画を投稿しました。' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: '動画を更新しました。' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: '動画を削除しました。' }
      format.json { head :no_content }
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :url, :video_uri)
  end
end
