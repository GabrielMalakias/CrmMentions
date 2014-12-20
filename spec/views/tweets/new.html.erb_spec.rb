require 'rails_helper'

RSpec.describe "tweets/new", :type => :view do
  before(:each) do
    assign(:tweet, Tweet.new(
      :retweet_count => 1,
      :favorite_count => 1,
      :text => "MyString"
    ))
  end

  it "renders new tweet form" do
    render

    assert_select "form[action=?][method=?]", tweets_path, "post" do

      assert_select "input#tweet_retweet_count[name=?]", "tweet[retweet_count]"

      assert_select "input#tweet_favorite_count[name=?]", "tweet[favorite_count]"

      assert_select "input#tweet_text[name=?]", "tweet[text]"
    end
  end
end
