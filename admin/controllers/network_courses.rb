Admin.controllers :network_courses do
  before :new, :edit, :create  do
    @section = Section.find_by_key('wlkc')
    @categories = @section.categories
  end

  get :index do
    @network_courses = NetworkCourse.paginate(:page => params[:page], :per_page => 10)
    render 'network_courses/index'
  end

  get :new do
    @network_course = NetworkCourse.new
    render 'network_courses/new'
  end

  post :create do
    @network_course = NetworkCourse.new(params[:network_course])
    if @network_course.save
      flash[:notice] = 'NetworkCourse was successfully created.'
      redirect url(:network_courses, :edit, :id => @network_course.id)
    else
      render 'network_courses/new'
    end
  end

  get :edit, :with => :id do
    @network_course = NetworkCourse.find(params[:id])
    render 'network_courses/edit'
  end

  put :update, :with => :id do
    @network_course = NetworkCourse.find(params[:id])
    if @network_course.update_attributes(params[:network_course])
      flash[:notice] = 'NetworkCourse was successfully updated.'
      redirect url(:network_courses, :edit, :id => @network_course.id)
    else
      render 'network_courses/edit'
    end
  end

  delete :destroy, :with => :id do
    network_course = NetworkCourse.find(params[:id])
    if network_course.destroy
      flash[:notice] = 'NetworkCourse was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy NetworkCourse!'
    end
    redirect url(:network_courses, :index)
  end
end
