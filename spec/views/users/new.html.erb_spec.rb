require 'rails_helper'

RSpec.describe "users/new", :type => :view do
  before(:each) do
    assign(:user, User.new(
      :screen_name => "MyString",
      :number_followers => 1
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_screen_name[name=?]", "user[screen_name]"

      assert_select "input#user_number_followers[name=?]", "user[number_followers]"
    end
  end
end
