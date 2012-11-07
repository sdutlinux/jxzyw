Admin.controllers :professional_constructions do
  before :new, :edit do
    @section = Section.find_by_key('zyjs')
    @categories = @section.categories
  end

  get :index do
    @professional_constructions = ProfessionalConstruction.paginate(:page => params[:page], :per_page => 10)
    render 'professional_constructions/index'
  end

  get :new do
    @professional_construction = ProfessionalConstruction.new
    render 'professional_constructions/new'
  end

  post :create do
    @professional_construction = ProfessionalConstruction.new(params[:professional_construction])
    if @professional_construction.save
      flash[:notice] = 'ProfessionalConstruction was successfully created.'
      redirect url(:professional_constructions, :edit, :id => @professional_construction.id)
    else
      render 'professional_constructions/new'
    end
  end

  get :edit, :with => :id do
    @professional_construction = ProfessionalConstruction.find(params[:id])
    render 'professional_constructions/edit'
  end

  put :update, :with => :id do
    @professional_construction = ProfessionalConstruction.find(params[:id])
    if @professional_construction.update_attributes(params[:professional_construction])
      flash[:notice] = 'ProfessionalConstruction was successfully updated.'
      redirect url(:professional_constructions, :edit, :id => @professional_construction.id)
    else
      render 'professional_constructions/edit'
    end
  end

  delete :destroy, :with => :id do
    professional_construction = ProfessionalConstruction.find(params[:id])
    if professional_construction.destroy
      flash[:notice] = 'ProfessionalConstruction was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy ProfessionalConstruction!'
    end
    redirect url(:professional_constructions, :index)
  end
end
