require 'spec_helper'

describe "ProfessionalConstruction Model" do
  let(:professional_construction) { ProfessionalConstruction.new }
  it 'can be created' do
    professional_construction.should_not be_nil
  end
end
