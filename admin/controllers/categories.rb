Admin.controllers :categories do
  before :new, :edit,:create  do
    @sections = Section.all
  end

  get :index do
    @categories = Category.paginate(:page => params[:page], :per_page => 10)
    render 'categories/index'
  end

  get :new do
    @category = Category.new
    render 'categories/new'
  end

  post :create do
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = 'Category was successfully created.'
      redirect url(:categories, :index)
    else
      render 'categories/new'
    end
  end

  get :edit, :with => :id do
    @category = Category.find(params[:id])
    render 'categories/edit'
  end

  put :update, :with => :id do
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = 'Category was successfully updated.'
      redirect url(:categories, :edit, :id => @category.id)
    else
      render 'categories/edit'
    end
  end

  delete :destroy, :with => :id do
    category = Category.find(params[:id])
    if category.destroy
      flash[:notice] = 'Category was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Category!'
    end
    redirect url(:categories, :index)
  end
end
