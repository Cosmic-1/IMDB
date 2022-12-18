class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]
  before_action :set_categories, only: %i[new edit]
  before_action :authenticate_user!, only: %i[edit new update create destroy]

  load_and_authorize_resource

  # GET /movies
  def index
    set_title('Movies')
    @movies = Movie.order(id: :desc).page(params[:page])
  end

  # GET /movies/1
  def show
    set_title(@movie.title)
  end

  # GET /movies/new
  def new
    set_title('New movie')
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
    set_title("Edit")
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)
    @movie.poster.attach(poster_params[:poster]) if poster_params.has_key? :poster

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  def update
    respond_to do |format|
      if @movie.update(movie_params)

        if poster_params.has_key? :poster
          @movie.poster.purge
          @movie.poster.attach(poster_params[:poster])
        end

        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
    end
  end

  private

  def set_categories
    @categories = Category.all
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:id])
  end

  def poster_params
    params.require(:movie).permit(:poster)
  end

  # Only allow a list of trusted parameters through.
  def movie_params
    params.require(:movie).permit(:title, :body, :category_id)
  end
end
