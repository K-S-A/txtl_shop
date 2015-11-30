RSpec.describe 'layouts/application.html.haml', type: :view do
  it 'has registration link' do
    render
    expect(rendered).to have_link('Register', href: '#')
  end
  it 'has signin link' do
    render
    expect(rendered).to have_link('Sign in', href: '#')
  end
end
