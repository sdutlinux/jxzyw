Teaching.controllers do 
  get '/' do 
    @sections = Section.all
    render 'index'
  end
end
