Teaching.controllers do 
  get '/' do 
    render 'index'
  end

  get :hello, :with => :id  do 
    params[:id]
  end

  get :show, :with => :id do
    # url is generated as "/admin/show/#{params[:id]}"
    # url_for(:admin, :show, :id => 5) => "/admin/show/5"
  end
end
