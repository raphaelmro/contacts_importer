require "rails_helper"

RSpec.describe "Logouts", :type => :system do
  before do
    driven_by(:rack_test)
  end

  describe "Logout Action" do
    let(:user) { create(:user) }

    it "should logout with success" do
      visit root_path

      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      click_button "Log in"

      click_link "Logout"

      expect(page).to have_text("You need to sign in or sign up before continuing.")
    end
  end
end


# require "application_system_test_case"
#
# class LogoutsSpec < ApplicationSystemTestCase
#   test "logout with success" do
#     user = FactoryBot.create(:user)
#     login_as(user)
#
#     click_on "Sair"
#
#     assert_equal new_session_path, current_path
#     assert_text "Sessão finalizada!"
#   end
# end
