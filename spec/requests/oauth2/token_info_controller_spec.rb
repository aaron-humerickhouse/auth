require 'rails_helper'

RSpec.describe Doorkeeper::TokensController, type: :request do
  let!(:user) { FactoryBot.create(:user) }

  before(:each) do
    post(
      'http://localhost:3001/api/v1/oauth2/token', 
      params: {
          email: user.email,
          password: user.password,
          grant_type: 'password'
      }
    )
  end
  let(:body) { JSON.parse(subject.body) }
  
  describe 'create' do
    subject {
      get(
        'http://localhost:3001/api/v1/oauth2/token/info', 
        headers: {
            authorization: "Bearer #{Doorkeeper::AccessToken.last.token}"
        }
      )
      response
    }

    context 'with a valid credentials' do
      it 'provides token info' do
        expect(body['resource_owner_id']).to eq user.id
      end
    end
  end
end
