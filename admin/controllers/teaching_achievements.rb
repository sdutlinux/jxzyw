Admin.controllers :teaching_achievements do
  before :new, :edit do
    @section = Section.find_by_key('jxcg')
    @categories = @section.categories
  end

  get :index do
    @teaching_achievements = TeachingAchievement.paginate(:page => params[:page], :per_page => 10)
    render 'teaching_achievements/index'
  end

  get :new do
    @teaching_achievement = TeachingAchievement.new
    render 'teaching_achievements/new'
  end

  post :create do
    @teaching_achievement = TeachingAchievement.new(params[:teaching_achievement])
    if @teaching_achievement.save
      flash[:notice] = 'TeachingAchievement was successfully created.'
      redirect url(:teaching_achievements, :edit, :id => @teaching_achievement.id)
    else
      render 'teaching_achievements/new'
    end
  end

  get :edit, :with => :id do
    @teaching_achievement = TeachingAchievement.find(params[:id])
    render 'teaching_achievements/edit'
  end

  put :update, :with => :id do
    @teaching_achievement = TeachingAchievement.find(params[:id])
    if @teaching_achievement.update_attributes(params[:teaching_achievement])
      flash[:notice] = 'TeachingAchievement was successfully updated.'
      redirect url(:teaching_achievements, :edit, :id => @teaching_achievement.id)
    else
      render 'teaching_achievements/edit'
    end
  end

  delete :destroy, :with => :id do
    teaching_achievement = TeachingAchievement.find(params[:id])
    if teaching_achievement.destroy
      flash[:notice] = 'TeachingAchievement was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy TeachingAchievement!'
    end
    redirect url(:teaching_achievements, :index)
  end
end
