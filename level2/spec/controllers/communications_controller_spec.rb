require 'rails_helper'

RSpec.describe Api::CommunicationsController, type: :controller do
  let(:practitioner) { Practitioner.create(first_name: 'Fritz', last_name: 'Kertzmann') }
  let(:communication) { Communication.create(practitioner: practitioner, sent_at: '2019-01-01') }

  describe 'GET index' do
    before do
      communication
      get :index
    end

    it 'should find Fritz Kertzmann communication in list' do
      expect(response).to have_http_status(:ok)
      list = []
      expect { list = JSON.parse(response.body, symbolize_names: true) }.not_to raise_exception
      expect(list.size).to eq(1)
      expect(list[0][:first_name]).to eq('Fritz')
      expect(list[0][:last_name]).to eq('Kertzmann')
      expect(list[0][:sent_at].to_date.to_s).to eq('2019-01-01')
    end
  end
end
