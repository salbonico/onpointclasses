class TeachersController < ApplicationController

def new
	redirect_to "/home" unless isadmin?
@teacher = Teacher.new
end

def create
	redirect_to "/home" unless isadmin?
	@teacher = Teacher.new(teacher_params)
	if @teacher.save
      redirect_to teacher_path(@teacher)
    else
      render :new
	end
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