class CoursesController < ApplicationController

def new
	if params[:teacher_id] && !Teacher.exists?(params[:teacher_id])
    redirect_to "/home", alert: "Teacher not found."
  else
    @course = Course.new(teacher_id: params[:teacher_id])
  end
end


def edit
	@course = Course.find(params[:id])
end


def create
	@course = Course.new(course_params)
	if @course.save
		redirect_to "/courses/#{@course.id}"
	else
		render :new
	end
end

def show
	@course = Course.find(params[:id])
	@user = User.find(session["user_id"])
	@enrollment = Enrollment.new(:course_id => @course.id, :user_id => @user.id)
end

def index
	if params[:teacher_id]
		@courses = Teacher.find(params[:teacher_id]).courses
		@teacher = Teacher.find(params[:teacher_id])
	else
	@courses = Course.all
	end

	@user = User.find(session["user_id"])
	@enrollment = Enrollment.new(:user_id => @user.id)
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
    params.require(:course).permit(:name, :description, :teacher_id)
  end


end