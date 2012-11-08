Teaching.controllers do 
  get :index do 
    @sections = Section.all
    render 'index'
  end
end
