class CreateTeachingAchievements < ActiveRecord::Migration
  def self.up
    create_table :teaching_achievements do |t|
      t.string :name
      t.string :link
      t.string :department
      t.string :charge_person
      t.integer :category_id
      t.string :level
      t.string :year
      t.timestamps
    end
  end

  def self.down
    drop_table :teaching_achievements
  end
end
