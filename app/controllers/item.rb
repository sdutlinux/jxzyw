Teaching.controllers :item do
  before do 
    @sections = Section.all
    @section = Section.find_by_key(params[:key])
  end

  get :show, :map => "/show/:key/:id" do
    case params[:key]
    when 'szdw'
      @item = Teacher.find(params[:id])
    end
    render "item/#{params[:key]}"
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
