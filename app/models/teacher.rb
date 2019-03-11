class Teacher < ActiveRecord::Base
has_many :courses
has_many :enrollments, through: :courses
validates :name, presence: true
validates :name, uniqueness: true
end