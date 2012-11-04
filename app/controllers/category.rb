Teaching.controllers :category do
  before do 
    @sections = Section.all
  end

  get :index, :map => "category/:id/in/:section_key" do
    @category = Category.find(params[:id])
    case params[:section_key]
    when 'yzkc'
      @quality_courses = QualityCourse.where(:category_id => @category.id)
    when 'wlkc' 
      @network_courses = NetworkCourse.where(:category_id => @category.id)
    when 'jxcg'
      @teaching_achievements = TeachingAchievement.where(:category_id => @category.id)
    when 'zyjs'
      @professional_constructions = ProfessionalConstruction.where(:category_id => @category.id)
    when 'szdw'
      @teachers = Teacher.where(:category_id => @category.id)
    end
    render "category/#{params[:section_key]}_items"
  end

end
