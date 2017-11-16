#
# It isn't completely localized (control Sign-out)
#
require 'rails_helper'

feature 'Login', %q{
  As an user
  I want to be able to sign in
} do

  given!(:user) { create(:user) }

  scenario 'Existing user tries to login' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: '123456'
    click_on I18n.t('.submit') # try it

    expect(page).to have_content I18n.t('.signed_up') # it's better to watch if the message has words 'signed up'
    expect(page).to have_link 'Log out'
  end

  scenario 'Non-existing user tries to sign in' do
    visit new_user_session_path
    fill_in 'Email', with: 'wrong@test.com'
    fill_in 'Password', with: 'w_r_o_n_g'
    click_on I18n.t('.submit') # try it

    expect(page).to have_content I18n.t('.invalid') #  it's better to watch if the message has words  'Invalid email or password'
    expect(page).to_not have_link 'Выйти' # or try Log out or try I18n t('.sign_out')
  end
end
