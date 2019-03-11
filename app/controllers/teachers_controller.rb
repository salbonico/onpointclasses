class TeachersController < ApplicationController

def new
@teacher = Teacher.new
end

def create
	@teacher = Teacher.create(teacher_params)
	redirect_to "/teachers/#{@teacher.id}"
end

def index
	@teachers = Teacher.all
end


def show
	@teacher = Teacher.find(params[:id])
end

private
 
  def teacher_params
    params.require(:teacher).permit(:name)
  end
end