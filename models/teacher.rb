class Teacher < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :name
end
