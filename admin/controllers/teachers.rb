Admin.controllers :teachers do
  before :new, :edit do
    @section = Section.find_by_key('szdw')
    @categories = @section.categories
  end

  get :index do
    @teachers = Teacher.paginate(:page => params[:page], :per_page => 10)
    render 'teachers/index'
  end

  get :new do
    @teacher = Teacher.new
    render 'teachers/new'
  end

  post :create do
    @teacher = Teacher.new(params[:teacher])
    if @teacher.save
      flash[:notice] = 'Teacher was successfully created.'
      redirect url(:teachers, :edit, :id => @teacher.id)
    else
      render 'teachers/new'
    end
  end

  get :edit, :with => :id do
    @teacher = Teacher.find(params[:id])
    render 'teachers/edit'
  end

  put :update, :with => :id do
    @teacher = Teacher.find(params[:id])
    if @teacher.update_attributes(params[:teacher])
      flash[:notice] = 'Teacher was successfully updated.'
      redirect url(:teachers, :edit, :id => @teacher.id)
    else
      render 'teachers/edit'
    end
  end

  delete :destroy, :with => :id do
    teacher = Teacher.find(params[:id])
    if teacher.destroy
      flash[:notice] = 'Teacher was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Teacher!'
    end
    redirect url(:teachers, :index)
  end
end
