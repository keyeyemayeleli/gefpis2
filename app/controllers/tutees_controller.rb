class TuteesController < ApplicationController
  def index
	  @tutees = Tutee.all
  	render "tutees/index"
  end

  def new
  end

  def show
  	@tutee = Tutee.find(params[:id])

	render "tutees/show"
  end

  def edit
  end
end
