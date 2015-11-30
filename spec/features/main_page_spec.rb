require 'features/features_spec_helper'

feature "Main page" do
  scenario "'Register' and 'Sign in' links shown to unregistered visitor" do
    visit root_path
    expect(page).to have_content 'Sign in'
    expect(page).to have_content 'Register'
  end
end
