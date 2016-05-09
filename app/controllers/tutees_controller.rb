class TuteesController < ApplicationController
  def index
	  @tutees = Tutee.all
  	render "tutees/index"
  end

  def new
    @tutee = Tutee.new

    render "tutees/new"
  end

  def create
    @tutee = Tutee.new(tutee_params)
    if @tutee.save
      redirect_to tutee_path(@tutee.id)
    else
      render "tutees/new"
    end
  end


  def show
  	@tutee = Tutee.find(params[:id])

	render "tutees/show"
  end

  def edit
    @tutee = Tutee.find(params[:id])
    
    render "tutees/edit"
  end

  def update
    @tutee = Tutee.find(params[:id])

    if @tutee.update(tutee_params)
      redirect_to tutee_path(@tutee)
    else
      render "tutees/edit"
    end
  end


  def destroy
    @tutee = Tutee.find(params[:id])
    @tutee.destroy!

    redirect_to :back
  end

  def tutee_params
    params.require(:tutee).permit!
  end
end
