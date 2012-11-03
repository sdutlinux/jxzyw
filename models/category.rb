class Category < ActiveRecord::Base
  belongs_to :section

  has_many :network_courses
  has_many :teachers
  has_many :professional_constructions 
  has_many :quality_courses
  has_many :teaching_achievements

end
