require 'spec_helper'

describe "QualityCourse Model" do
  let(:quality_course) { QualityCourse.new }
  it 'can be created' do
    quality_course.should_not be_nil
  end
end
