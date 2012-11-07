Admin.controllers :quality_courses do
  before :new, :edit, :create do
    @section = Section.find_by_key('yzkc')
    @categories = @section.categories
  end

  get :index do
    @quality_courses = QualityCourse.paginate(:page => params[:page], :per_page => 10)
    render 'quality_courses/index'
  end

  get :new do
    @quality_course = QualityCourse.new
    render 'quality_courses/new'
  end

  post :create do
    @quality_course = QualityCourse.new(params[:quality_course])
    if @quality_course.save
      flash[:notice] = 'QualityCourse was successfully created.'
      redirect url(:quality_courses, :edit, :id => @quality_course.id)
    else
      render 'quality_courses/new'
    end
  end

  get :edit, :with => :id do
    @quality_course = QualityCourse.find(params[:id])
    render 'quality_courses/edit'
  end

  put :update, :with => :id do
    @quality_course = QualityCourse.find(params[:id])
    if @quality_course.update_attributes(params[:quality_course])
      flash[:notice] = 'QualityCourse was successfully updated.'
      redirect url(:quality_courses, :edit, :id => @quality_course.id)
    else
      render 'quality_courses/edit'
    end
  end

  delete :destroy, :with => :id do
    quality_course = QualityCourse.find(params[:id])
    if quality_course.destroy
      flash[:notice] = 'QualityCourse was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy QualityCourse!'
    end
    redirect url(:quality_courses, :index)
  end
end
