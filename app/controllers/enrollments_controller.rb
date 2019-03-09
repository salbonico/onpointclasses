class EnrollmentsController < ApplicationController

	def create
			course = Course.find(params[:enrollment][:course_id])
			user = User.find(session[:user_id])
			Enrollment.create(:course_id => course.id, :user_id => user.id, :course_type => params[:course_type])
			
		    flash[:notice] = "You have enrolled in #{course.name}!"
			redirect_to "/home"
	end

	def destroy
		enrollment = Enrollment.find(params[:id])

		if session[:user_id] != enrollment.user_id
			flash[:notice] = "You are not enrolled in #{course.name}!"
			redirect_to "/courses"

		else
			course= Course.find(enrollment.course_id)
			enrollment.destroy

			flash[:notice] = "You have unenrolled from #{course.name}!"
			redirect_to "/home"
		end
	end


end