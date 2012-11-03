require 'spec_helper'

describe "NetworkCourse Model" do
  let(:network_course) { NetworkCourse.new }
  it 'can be created' do
    network_course.should_not be_nil
  end
end
