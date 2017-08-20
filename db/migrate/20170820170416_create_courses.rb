class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.integer :period
      t.string :name
      t.string :content
      t.integer :weekTime
      t.integer :totalTime
      t.integer :kind
      t.string :teacher

      t.timestamps
    end
  end
end
