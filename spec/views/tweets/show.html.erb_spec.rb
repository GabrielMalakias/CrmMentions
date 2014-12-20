require 'rails_helper'

RSpec.describe "tweets/show", :type => :view do
  before(:each) do
    @tweet = assign(:tweet, Tweet.create!(
      :retweet_count => 1,
      :favorite_count => 2,
      :text => "Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Text/)
  end
end
