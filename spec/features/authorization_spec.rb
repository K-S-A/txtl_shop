require 'features/features_spec_helper'

feature "Authorization", :js do
  scenario "Visitor clicks 'Register' link and see registration form" do
    visit root_path
    find('[data-ui-sref="register"]').click

    expect(page).to have_selector('form#userRegistration')
  end
end
