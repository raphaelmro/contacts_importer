require "rails_helper"

RSpec.describe "Logins", :type => :system do
  before do
    driven_by(:rack_test)
  end

  describe "Login Action" do
    let(:user) { create(:user) }

    it "should login with valid credentials" do
      visit root_path

      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      click_button "Log in"

      expect(page).to have_text("Signed in successfully.")
    end

    it 'should not login with invalid credentials' do
      visit root_path

      fill_in "Email", :with => user.email
      fill_in "Password", :with => "wrongpassword"
      click_button "Log in"

      expect(page).to have_text("Invalid Email or password.")
    end

  end

end
