RSpec.describe 'layouts/application.html.haml', type: :view do
  it 'has registration link' do
    render
    expect(rendered).to have_css('[data-ui-sref="register"]')
  end
  it 'has signin link' do
    render
    expect(rendered).to have_css('[data-ui-sref="login"]')
  end
end
