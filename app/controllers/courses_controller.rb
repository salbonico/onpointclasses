class CoursesController < ApplicationController

def new
end


def edit
	@course = Course.find(params[:id])
end


def create
	@course = Course.create(course_params)
	redirect_to "/courses/#{@course.id}"
end

def show
	@course = Course.find(params[:id])
	@user = User.find(session["user_id"])
	@enrollment = Enrollment.new(:enrollment_id => @enrollment.id, :user_id => @user.id)
end

def index
	@courses = Course.all
	@user = User.find(session["user_id"])
end

def update
	
    @course = Course.find(params[:id])

    @course.update(course_params)

    if @course.save
      redirect_to @course
    else
      render :edit
    end
  
end

def destroy
	course = Course.find(params[:id])
    course.destroy
end

private
 
  def course_params
    params.require(:course).permit(:name, :description, :teacher)
  end





end