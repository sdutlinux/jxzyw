require 'spec_helper'

describe "Teacher Model" do
  let(:teacher) { Teacher.new }
  it 'can be created' do
    teacher.should_not be_nil
  end
end
