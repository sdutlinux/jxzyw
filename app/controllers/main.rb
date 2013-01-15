Teaching.controllers do 
  get :index do 
    redirect url(:section, :index, Section.first.key)
    #@sections = Section.all
    #@section = Section.first
    #render 'index'
  end
end
