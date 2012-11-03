class CreateNetworkCourses < ActiveRecord::Migration
  def self.up
    create_table :network_courses do |t|
      t.string :name
      t.string :link
      t.string :department
      t.string :charge_person
      t.integer :category_id
      t.string :order
      t.timestamps
    end
  end

  def self.down
    drop_table :network_courses
  end
end
