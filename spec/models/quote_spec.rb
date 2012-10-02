require 'spec_helper'

describe Quote  do
  let(:quote) { FactoryGirl.build(:quote) }

  context "validations" do
    it { should validate_presence_of :body }
  end

  it 'should validate presence of quote body that will pass' do
    @quote = Quote.new(:body=>'Hurray')
    @quote.should be_valid
  end  

  it 'should validate presence of quote body that will fail' do 
    @quote = Quote.new
    @quote.should_not be_valid
  end

  context "#previous" do
    before do
      @quote = FactoryGirl.create :quote
    end

    it "returns previous post" do
      @quote2 = FactoryGirl.create :quote
      @quote2.previous.should eq @quote
    end
      
    it "returns nil when there's no older post" do
      @quote.previous.should be_nil
    end
  end

  context "#next" do
    before do
      @quote = FactoryGirl.create :quote
    end

    it "returns next post" do
      @quote2 = FactoryGirl.create :quote
      @quote.next.should eq @quote2
    end
      
    it "returns nil when there's no new post" do
      @quote.next.should be_nil
    end  
  end
end