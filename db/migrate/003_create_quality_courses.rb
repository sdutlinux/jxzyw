class CreateQualityCourses < ActiveRecord::Migration
  def self.up
    create_table :quality_courses do |t|
      t.string :name
      t.string :link
      t.string :department
      t.string :charge_person
      t.string :course_level
      t.integer :category_id
      t.string :year
      t.timestamps
    end
  end

  def self.down
    drop_table :quality_courses
  end
end
