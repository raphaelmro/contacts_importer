require 'rails_helper'

RSpec.describe 'Signups', :type => :system do
  before do
    driven_by(:rack_test)
  end

  context 'Signup action' do
    let(:user) { build(:user, email: 'ashketchum@pokemon.com', password: '123456') }

    it 'should create a new user' do
      visit root_path
      click_link 'Sign up'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password

      click_button 'Sign up'
      assert_text 'Welcome! You have signed up successfully.'
    end
  end


end


# require "application_system_test_case"
#
# class SignupsTest < ApplicationSystemTestCase
#   test "success when creating a users with valid params" do
#     visit "/"
#     click_on "Cadastre-se"
#
#     fill_in "Nome", with: "Darth Vader"
#     fill_in "E-mail", with: "vader@imperio.com"
#     fill_in "Senha", with: "minhasenha"
#     fill_in "Confirmação da Senha", with: "minhasenha"
#
#     click_on "Cadastrar"
#
#     assert_text "Cadastro realizado com sucesso!"
#   end
#
#   test "user creation with invalid params" do
#     visit "/"
#     click_on "Cadastre-se"
#     click_on "Cadastrar"
#
#     assert_text "Erro ao salvar!"
#   end
#
# end
