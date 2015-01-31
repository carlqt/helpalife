require 'rails_helper'

RSpec.describe State, :type => :model do
  describe '.upload' do
    it "creates the records for states based on uploaded CSV records" do
      State.upload('state.csv')
      expect(State.count).to eq(5)
    end

  end
end
