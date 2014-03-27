require '../lib/db_conn'
require '../lib/models'
require './factories.rb'

describe "Models" do
  before :all do
    #@us = Country.create(:name => "US")
  end

  describe "State" do

    let(:country) { FactoryGirl.create(:country) }
    before { @state = country.states.build(name: "Alaska", abbr: "AK") }

    subject{@state}

    its(:name) {should eq "Alaska"}
    its(:abbr) {should eq "AK"}
    it { should respond_to(:country) }
    its(:country) {should eq @us}
  end
end