class LessonsController < ApplicationController
  def index
  	@lessons = Lesson.all
  	render "lessons/index"
  end

  def new
    @lesson = Lesson.new

    if params[:member_id].present?
      @lesson.member = Member.find(params[:member_id])
    end

    render "lessons/new"
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.file = params[:lesson][:file]

    if @lesson.save
      redirect_to lesson_path(@lesson.id)
    else
      render "lessons/new"
    end
  end

  def show
  	@lesson = Lesson.find(params[:id])

	  render "lessons/show"
  end

  def edit
    @lesson = Lesson.find(params[:id])
    
    render "lessons/edit"
  end

  def update
    @lesson = Lesson.find(params[:id])

    if @lesson.update(lesson_params)
      redirect_to lesson_path(@lesson)
    else
      render "lessons/edit"
    end
  end


  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy!

    redirect_to :back
  end

  def lesson_params
    params.require(:lesson).permit!
  end

end
