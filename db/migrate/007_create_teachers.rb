class CreateTeachers < ActiveRecord::Migration
  def self.up
    create_table :teachers do |t|
      t.string :name
      t.string :link
      t.string :college
      t.integer :category_id
      t.string :charge_people
      t.string :desc
      t.timestamps
    end
  end

  def self.down
    drop_table :teachers
  end
end
