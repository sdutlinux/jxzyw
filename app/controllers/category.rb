Teaching.controllers :category do
  before do 
    @sections = Section.all
  end

  get :index, :map => "category/:id/in/:section_key" do
    #@section = Section.find_by_key(params[:key])
    #@categories = @section.categories
    #@post = 
    #render "#{params[:key]}/index"
  end

  # get :sample, :map => "/sample/url", :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get "/example" do
  #   "Hello world!"
  # end


end
