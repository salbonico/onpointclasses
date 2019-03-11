class Teacher < ActiveRecord::Base
has_many :courses
has_many :enrollments, through: :courses
end