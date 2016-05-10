class TprsController < ApplicationController
  def index
    @tprs = Tpr.all
    render "tprs/index"
  end

  def new
    @tpr = Tpr.new

    if params[:member_id].present?
      @tpr.member = Member.find(params[:member_id])
    end

    if params[:file_number].present?
      @tpr.lesson = Lesson.find(params[:file_number])
    end

    if params[:tutee_id].present?
      @tpr.tutee = Tutee.find(params[:tutee_id])
    end

    render "tprs/new"
  end

  def create
    @tpr = Tpr.new(tpr_params)
    if @tpr.save
      redirect_to tpr_path(@tpr.id)
    else
      render "tprs/new"
    end
  end

  def show
    @tpr = Tpr.find(params[:id])

    render "tprs/show"
  end


  def edit
    @tpr = Tpr.find(params[:id])
    
    render "tprs/edit"
  end

  def update
    @tpr = Tpr.find(params[:id])

    if @tpr.update(tpr_params)
      redirect_to tpr_path(@tpr)
    else
      render "tprs/edit"
    end
  end


  def destroy
    @tpr = Tpr.find(params[:id])
    @tpr.destroy!

    redirect_to :back
  end

  def tpr_params
    params.require(:tpr).permit!
  end

end
