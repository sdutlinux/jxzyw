require 'spec_helper'

describe "TeachingAchievement Model" do
  let(:teaching_achievement) { TeachingAchievement.new }
  it 'can be created' do
    teaching_achievement.should_not be_nil
  end
end
