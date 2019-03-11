class Enrollment < ActiveRecord::Base
belongs_to :user
belongs_to :course

scope :classroom, -> { where(course_type: "classroom") }
scope :online, -> { where(course_type: "online") }


scope :online_courses, -> (courseid) { online.where("course_id == ? ", courseid)}
scope :classroom_courses, -> (courseid) { classroom.where("course_id == ? ", courseid)}

end