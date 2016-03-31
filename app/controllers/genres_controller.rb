class GenresController < ApplicationController

  before_action :set_genre, only: [:show, :edit, :update, :destroy]

  def show
    @movies = @genre.movies
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      redirect_to root_url, notice: 'Genre created'
    else
      render :new
    end
  end

  def destroy
    @genre.delete
    redirect_to root_url, notice: 'Genre deleted'
  end

  def edit
  end

  def update
    @genre.update_columns(genre_params)
    redirect_to root_url, notice: 'Genre Updated'
  end

  def genre_params
    params.require(:genre).permit(:name)
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end

end
