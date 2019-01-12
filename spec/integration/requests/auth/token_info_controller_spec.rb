require 'rails_helper'

RSpec.describe Doorkeeper::TokensController, type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let(:user_email) { user.email }

  before(:each) do
    post(
      "#{API_V1_PATH}/auth/token", 
      params: {
          email: user.email,
          password: user.password,
          grant_type: 'password'
      }
    )
  end
  
  describe 'create' do
    subject {
      get(
        "#{API_V1_PATH}/auth/token/info", 
        headers: {
            authorization: authorization
        }
      )
      response
    }

    let(:body) { JSON.parse(subject.body) }

    context 'with valid authorization' do
      let(:authorization) { "Bearer #{Doorkeeper::AccessToken.last.token}" }

      it 'provides the user id' do
        expect(body['resource_owner_id']).to eq user.id
      end
    end

    context 'with invalid authorization' do
      let(:authorization) { 'Bearer Invalid Token' }

      it 'returns unauthorized' do
        expect(subject).to be_unauthorized
      end
    end
  end
end
