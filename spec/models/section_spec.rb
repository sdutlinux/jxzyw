require 'spec_helper'

describe "Section Model" do
  let(:section) { Section.new }
  it 'can be created' do
    section.should_not be_nil
  end
end
