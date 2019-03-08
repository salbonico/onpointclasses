class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
    	t.string :name
    	t.string :teacher
    	t.integer :lecture_length
    	t.string :time_of_day
    	t.string :description
    end
  end
end
