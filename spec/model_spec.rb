require 'factory_girl'
require_relative 'spec_helper.rb'

require_relative '../lib/db_conn'
require_relative '../lib/models'
require_relative './factories.rb'


describe "Models" do

  describe "State" do
    let(:country) { FactoryGirl.create(:country) }
    before { @state = country.states.build(name: "Alaska", abbr: "AK") }

    subject{@state}

    its(:name) {should eq "Alaska"}
    its(:abbr) {should eq "AK"}
    it { should respond_to(:country) }
    its(:country) {should eq country}
  end
end