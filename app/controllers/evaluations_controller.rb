class EvaluationsController < ApplicationController
  def index
  	@evaluations = Evaluation.all
  	render "evaluations/index"
  end

  def new
    @evaluation = Evaluation.new

    if params[:member_id].present?
      @evaluation.member = Member.find(params[:member_id])
    end

    render "evaluations/new"
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.save
      redirect_to evaluation_path(@evaluation.id)
    else
      render "evaluations/new"
    end
  end

  def show
  	@evaluation = Evaluation.find(params[:id])

	  render "evaluations/show"
  end


  def edit
    @evaluation = Evaluation.find(params[:id])
    
    render "evaluations/edit"
  end

  def update
    @evaluation = Evaluation.find(params[:id])

    if @evaluation.update(evaluation_params)
      redirect_to evaluation_path(@evaluation)
    else
      render "evaluations/edit"
    end
  end


  def destroy
    @evaluation = Evaluation.find(params[:id])
    @evaluation.destroy!

    redirect_to :back
  end

  def evaluation_params
    params.require(:evaluation).permit!
  end

end
