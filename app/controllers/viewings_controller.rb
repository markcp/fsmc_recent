class ViewingsController < ApplicationController
  def index
  end

  def new
    @viewing = Viewing.new
    @formats = Format.all
    @viewing.build_movie
  end

  def create
    @viewing = Viewing.new(viewing_params)
    if @viewing.save
      flash[:success] = "Viewing added."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def viewing_params
      params.require(:viewing).permit(:movie_id, :date, :format_id,
                                   :rating, :notes, movie_attributes: [ :id, :title, :year, :skandies_year, :director, :short ])
    end
end
