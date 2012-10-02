require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build(:user) }

  describe "validations" do
    it { should validate_presence_of :email }
  end

end
