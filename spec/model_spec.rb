require 'factory_girl'
require_relative 'spec_helper.rb'

require_relative '../lib/db_conn'
require_relative '../lib/models'
require_relative './factories.rb'


describe "Models" do

  describe "State" do
    let(:country) { FactoryGirl.create(:country) }
    before { @alaska = country.add_state("Alaska", "AK") }

    subject { @alaska }

    its(:name) { should eq "Alaska" }
    its(:abbr) { should eq "AK" }
    it { should respond_to(:country) }
    its(:country) {should eq country}

    context "when state Alaska is added into country again" do
      let(:alaska) { country.add_state("Alaska", "AK") }

      it "has the same id with the one added before"  do
        expect(alaska.id).to eq @alaska.id
      end

      it "has only one Alaska state in country" do
        expect(State.find_by(name: "Alaska")).to be_instance_of State
        expect(State.find_by(name: "Alaska")).not_to be_instance_of Array
      end
    end

    context "when state Texas is added into country" do
      let(:texas) { country.add_state("Texas", "TX") }

      it "has the different id with state Alaska"  do
        expect(texas.id).not_to eq @alaska.id
      end
    end
  end

  describe "City" do
    let(:us) { FactoryGirl.create(:country) }
    let(:alaska) { FactoryGirl.create(:state) }
  end
end