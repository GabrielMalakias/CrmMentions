require 'rails_helper'

RSpec.describe "tweets/show", :type => :view do
  before(:each) do
    @tweet = assign(:tweet, Tweet.create!(
      :retweets => 1,
      :favorited => 2,
      :content => "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Content/)
  end
end
