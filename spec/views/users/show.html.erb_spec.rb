require 'rails_helper'

RSpec.describe "users/show", :type => :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :screen_name => "Screen Name",
      :number_followers => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Screen Name/)
    expect(rendered).to match(/1/)
  end
end
