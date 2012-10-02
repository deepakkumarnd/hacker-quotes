require 'spec_helper'

describe QuotesController do
  context "GET index" do
    it "when normal user launches" do
      get :index
      response.should render_template :index
    end        
  end

  context "GET show" do
    before do
      @quote = FactoryGirl.build(:quote)
      Quote.stub(:find).with("1").and_return(@quote)
    end

    it "Should render template show" do
      get :show , { id: "1" }
      response.should render_template :show
    end
  end

  context "GET new" do
    it "Redirect to root when no user is loged in" do
      get :new
        response.should redirect_to new_user_session_path
    end  

    context "when user is logged in" do
      before { sign_in FactoryGirl.create :user }

      it "assigns a new quote as @quote" do 
        get :new
        assigns(:quote).should be_a_new Quote
      end

      it "renders template new after logged in" do
        get :new
        response.should render_template :new
      end  
    end
  end 

  context "POST create" do
    it "redirects to login path when no user" do
      post :create, {}
      response.should redirect_to new_user_session_path
    end  

    context "when user is loged in and with valid params" do 
      before {sign_in FactoryGirl.create :user}
      
      it "creates a new quote" do 
        expect{
          post :create, {quote: FactoryGirl.attributes_for(:quote)}
        }.to change(Quote, :count).by(1)
      end    
    end  
  end 

  context "GET edit" do
    before {@quote = FactoryGirl.create :quote}
    it "should redirect to login when no user" do 
      get :edit, {id: "1"}
      response.should redirect_to new_user_session_path
    end      
    
    context "when user is logged in" do 
      before  do
        sign_in FactoryGirl.create :user 
        @quote = FactoryGirl.create :quote
      end
      it "should render edit form" do
        get :edit, {id: @quote.to_param,quote: {}}
        response.should render_template :edit
      end  
    end  
  end

  context "POST update" do
    before do
      @quote = FactoryGirl.create :quote
      sign_in FactoryGirl.create(:user)
    end

    it "should redirect to show page" do
      post :update, { id: @quote.to_param, quote: {} }
      response.should redirect_to @quote
    end  
  end  

  context "DELETE destroy" do
    before do
      @quote = FactoryGirl.create :quote
    end

    it "redirects to root when no user" do
      delete :destroy, { id: @quote.to_param }
      response.should redirect_to new_user_session_path
    end

    context "user logged in" do
      before { sign_in FactoryGirl.create :user }

      it "assigns @quote" do
        delete :destroy, { id: @quote.to_param }
        assigns(:quote).should eq @quote
      end

      it "deletes quote" do
        expect { delete :destroy, { id: @quote.to_param } }.to change(Quote, :count).by(-1)

      end

      it "redirect to quotes path after deletion" do
        delete :destroy, { id: @quote.to_param }
        response.should redirect_to root_path
      end  
    end
  end
  context "GET random" do
    it "should redirect to random post" do
      quote = FactoryGirl.build :quote
      Quote.stub(:random).and_return(quote)
      get :random
      response.should redirect_to quote
    end
  end  
end