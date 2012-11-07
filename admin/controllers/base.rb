Admin.controllers :base do

  get :index, :map => "/" do
  	redirect url(:teachers, :index) 
    # render "base/index"
  end
end
