require '../lib/db_conn'
require '../lib/models'

describe "Models" do
  before :all do
    @us = Country.new(:name => "US")
  end

  describe "State" do
    before :each do
      str = "99511,Anchorage,Alaska,AK"
      postcode, city, state, state_abbr = str.split(",")
      @state = @us.add_state(state,state_abbr)

    end

    it "returns the state name" do
        expect(@state.name).to eq("Alaska")
    end

    it "returns the state abbr name" do
        expect(@state.abbr).to eq("AK")
    end
  end
end