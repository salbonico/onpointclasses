class User < ActiveRecord::Base
has_many :enrollments
has_many :courses, through: :enrollments
belongs_to :company



has_secure_password

end