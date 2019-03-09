class User < ActiveRecord::Base
has_many :enrollments
has_many :courses, through: :enrollments
accepts_nested_attributes_for :courses


has_secure_password





end