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

  # get :index, :map => "/foo/bar" do
  #   session[:foo] = "bar"
  #   render 'index'
  # end

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
