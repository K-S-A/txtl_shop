RSpec.describe GroupsController, type: :controller do

  context 'GET index {format: :json}' do
    let(:visit_index) { get :index, {format: :json} }

    it 'assigns @groups' do
      group = FactoryGirl.create(:group)
      visit_index
      expect(assigns(:groups)).to eq([group])
    end

    it 'renders index template' do
      visit_index
      expect(response).to render_template('index')
    end

  end
end
