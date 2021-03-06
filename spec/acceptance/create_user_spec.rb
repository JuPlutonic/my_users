require 'rails_helper'

feature 'Create user' do
  given(:user) { create(:user) }

  background do
    visit new_user_registration_path
  end

  scenario 'User adds file when he registers' do
    fill_in I18n.t('.name'), with: "First user's name"
    attach_file 'Avatar', "#{Rails.root}/public/favicon.png" # Выберете файл аватара
    fill_in I18n.t('.email'), with: 'mail@test.com'
    fill_in I18n.t('.password'), with: '123456'
    fill_in I18n.t('.password_confirmation'), with: '123456'
    click_on I18n.t('.submit')

    expect(page).to have_content I18n.t('.submit') # or text like 'request' or 'запрос'
    expect(page).tp have_link 'favicon.png' # ------- need to be moved to an acceptance spec
  end

#
# Not need because it was manually tested.
# First scenario is needed because it is in the tasks


end

