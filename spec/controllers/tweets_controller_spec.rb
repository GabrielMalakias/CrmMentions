require 'rails_helper'


RSpec.describe TweetsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Tweet. As you add validations to Tweet, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TweetsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all tweets as @tweets" do
      tweet = Tweet.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:tweets)).to eq([tweet])
    end
  end

  describe "GET show" do
    it "assigns the requested tweet as @tweet" do
      tweet = Tweet.create! valid_attributes
      get :show, {:id => tweet.to_param}, valid_session
      expect(assigns(:tweet)).to eq(tweet)
    end
  end

  describe "GET edit" do
    it "assigns the requested tweet as @tweet" do
      tweet = Tweet.create! valid_attributes
      get :edit, {:id => tweet.to_param}, valid_session
      expect(assigns(:tweet)).to eq(tweet)
    end
  end


  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested tweet" do
        tweet = Tweet.create! valid_attributes
        put :update, {:id => tweet.to_param, :tweet => new_attributes}, valid_session
        tweet.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested tweet as @tweet" do
        tweet = Tweet.create! valid_attributes
        put :update, {:id => tweet.to_param, :tweet => valid_attributes}, valid_session
        expect(assigns(:tweet)).to eq(tweet)
      end

      it "redirects to the tweet" do
        tweet = Tweet.create! valid_attributes
        put :update, {:id => tweet.to_param, :tweet => valid_attributes}, valid_session
        expect(response).to redirect_to(tweet)
      end
    end

    describe "with invalid params" do
      it "assigns the tweet as @tweet" do
        tweet = Tweet.create! valid_attributes
        put :update, {:id => tweet.to_param, :tweet => invalid_attributes}, valid_session
        expect(assigns(:tweet)).to eq(tweet)
      end

      it "re-renders the 'edit' template" do
        tweet = Tweet.create! valid_attributes
        put :update, {:id => tweet.to_param, :tweet => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested tweet" do
      tweet = Tweet.create! valid_attributes
      expect {
        delete :destroy, {:id => tweet.to_param}, valid_session
      }.to change(Tweet, :count).by(-1)
    end

    it "redirects to the tweets list" do
      tweet = Tweet.create! valid_attributes
      delete :destroy, {:id => tweet.to_param}, valid_session
      expect(response).to redirect_to(tweets_url)
    end
  end

end
