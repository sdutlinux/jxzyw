class CreateProfessionalConstructions < ActiveRecord::Migration
  def self.up
    create_table :professional_constructions do |t|
      t.string :name
      t.string :link
      t.string :college
      t.integer :category_id
      t.string :phone
      t.timestamps
    end
  end

  def self.down
    drop_table :professional_constructions
  end
end
