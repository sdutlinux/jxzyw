class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :crypted_password
      t.string :role
      t.timestamps
    end
    Account.create(:email => 'ldshuang@gmail.com', :name => "lidashuang", :surname => "dashuang", :password => '123.com', :password_confirmation => '123.com', :role => "admin")
  end

  def self.down
    drop_table :accounts
  end
end
