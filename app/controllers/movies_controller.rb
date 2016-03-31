class MoviesController < ApplicationController
  def index
    @genres = Genre.all
  end
end
