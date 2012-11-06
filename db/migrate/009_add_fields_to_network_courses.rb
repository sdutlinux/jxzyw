class AddFieldsToNetworkCourses < ActiveRecord::Migration
  def self.up
    change_table :network_courses do |t|
      t.string :subject
    end
  end

  def self.down
    change_table :network_courses do |t|
      t.remove :subject
    end
  end
end
