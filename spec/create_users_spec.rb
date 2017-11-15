require 'rails_helper'

feature 'Create users' do
  given(:user) { create(:user) }

  background do
    visit new_user_registration_path
  end

  scenario 'User adds file when he registers' do
  #  fill_in 'Name', with: 'My                                          '
    attach_file 'File', "#{Rails.root}/spec/spec_helper.rb"
    # fill_in 'Name', with: 'My                                          '
    # fill_in 'Name', with: 'My                                          '
    # fill_in 'Name', with: 'My                                          '
    click_on t('.submit')

    # expect(page).to have_link 'spec_helper.rb'
    # within '.users' do
    #   expect(page).to have_link 'spec_helper.rb'
    # end
  end
end

