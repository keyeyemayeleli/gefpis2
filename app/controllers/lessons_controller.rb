class LessonsController < ApplicationController
  def index
  	@lessons = Lesson.all
  	render "lessons/lessons_all"
  end

  def new
  end

  def show
  	@lesson = Lesson.find(params[:id])

	  render "lessons/show"
  end

  def edit
  end
end
