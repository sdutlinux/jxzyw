Teaching.controllers :section do
  before do 
    @sections = Section.all
  end

  get :index, :with => :key do
    @key = params[:key]
    @section = Section.find_by_key(params[:key])
    @categories = @section.categories
    render "#{params[:key]}_index"
  end
end
