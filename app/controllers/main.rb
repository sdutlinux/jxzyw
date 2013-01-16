Teaching.controllers do 
  get :index do 
    redirect url(:section, :index, Section.first.key)
  end
end
