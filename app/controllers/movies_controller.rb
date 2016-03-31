class MoviesController < ApplicationController
  def index
    @genres = Genre.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to root_url, notice: 'Movie created'
    else
      render :new
    end
  end


  def movie_params
    params.require(:movie).permit(:name, :genre_id)
  end

end
