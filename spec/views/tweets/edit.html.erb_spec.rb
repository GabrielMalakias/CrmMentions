require 'rails_helper'

RSpec.describe "tweets/edit", :type => :view do
  before(:each) do
    @tweet = assign(:tweet, Tweet.create!(
      :retweets => 1,
      :favorited => 1,
      :content => "MyString"
    ))
  end

  it "renders the edit tweet form" do
    render

    assert_select "form[action=?][method=?]", tweet_path(@tweet), "post" do

      assert_select "input#tweet_retweets[name=?]", "tweet[retweets]"

      assert_select "input#tweet_favorited[name=?]", "tweet[favorited]"

      assert_select "input#tweet_content[name=?]", "tweet[content]"
    end
  end
end
