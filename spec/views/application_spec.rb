RSpec.describe 'layouts/application.html.haml', type: :view do
  before { render }

  it 'has registration link' do
    expect(rendered).to have_css('[data-ui-sref="register"]')
  end
  it 'has signin link' do
    expect(rendered).to have_css('[data-ui-sref="login"]')
  end

end
