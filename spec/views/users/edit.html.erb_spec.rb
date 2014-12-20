require 'rails_helper'

RSpec.describe "users/edit", :type => :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :screen_name => "MyString",
      :number_followers => 1
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_screen_name[name=?]", "user[screen_name]"

      assert_select "input#user_number_followers[name=?]", "user[number_followers]"
    end
  end
end
