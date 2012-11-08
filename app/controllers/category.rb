Teaching.controllers :category do
  before do 
    @sections = Section.all
  end

  get :index, :map => "category/:id/in/:section_key" do
    @category = Category.find(params[:id])
    @key = params[:section_key]
    case @key
    when 'yzkc'
      @items = QualityCourse.where(:category_id => @category.id)
    when 'wlkc' 
      @items = NetworkCourse.where(:category_id => @category.id)
    when 'jxcg'
      @items = TeachingAchievement.where(:category_id => @category.id)
    when 'zyjs'
      @items = ProfessionalConstruction.where(:category_id => @category.id)
    when 'szdw'
      @items = Teacher.where(:category_id => @category.id)
    end
    render "category/#{params[:section_key]}_items"
  end

end
