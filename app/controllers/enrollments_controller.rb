class EnrollmentsController < ApplicationController

def create
		course = Course.find(params[:enrollment][:course_id])
		user = User.find(session[:user_id])
		Enrollment.create(:course_id => course.id, :user_id => user.id, :course_type => params[:course_type])
		
	    flash[:notice] = "You have enrolled in #{course.name}!"
		redirect_to "/home"
	
end

def destroy


end