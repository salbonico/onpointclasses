class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
    	t.string :name
    	t.integer :teacher_id
    	t.string :description
    end
  end
end
