class Course < ActiveRecord::Base
has_many :enrollments
has_many :users, through: :enrollments
belongs_to :teacher
accepts_nested_attributes_for :teacher
validates :name, presence: true
validates :teacher_id, presence: true
validates :description, presence: true
validates :description, length: { minimum: 10 }
validates :description, length: { maximum: 500 }
validates :name, uniqueness: true




def teacher_name
	teacher = Teacher.name_check(self.teacher_id)
	if teacher == []
		return "No teacher yet"
	else 
    teacher[0].name
	end
end

  


end