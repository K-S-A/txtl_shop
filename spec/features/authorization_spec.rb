require 'features/features_spec_helper'

feature "Authorization", :js do
  scenario "Visitor clicks 'Register' link and see registration form" do
    visit root_path
    find('[data-ui-sref="register"]').click

    expect(page).to have_css('form#userRegistration')
  end
=begin
  scenario "Visitor registers successfully via registration form" do
    visit '/#/registration'
    within('form#userRegistration') do
      fill_in 'Email', with: Faker::Internet.email
      click_button 'Register'
    end

    expect(page).not_to have_css('[data-ui-sref="register"]')
    expect(page).not_to have_css('[data-ui-sref="login"]')
    expect(page).not_to have_css('form#userRegistration')
    expect(page).to have_content('Sign out')
    expect(page).to have_content('You registered')
  end
=end
end
