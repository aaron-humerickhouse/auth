require 'rails_helper'

RSpec.describe Doorkeeper::TokensController, type: :request do
  describe 'create' do
    let!(:user) { FactoryBot.create(:user) }
    let(:body) { JSON.parse(subject.body) }

    subject {
      post 'http://localhost:3001/api/v1/oauth2/token', 
      params: {
          email: params_email,
          password: params_password,
          grant_type: 'password'
      }
      response
    }

    context 'with a valid credentials' do
      let(:params_email) { user.email }
      let(:params_password) { 'Test1234' }
      
      it 'returns a bearer token' do
        expect(body['access_token']).to match(/[a-f0-9]{64}/)
        expect(body['token_type']).to eq 'Bearer'
      end

      it 'returns expiration time equivalent of 24 hours' do
        expect(body['expires_in']).to eq 24*60*60
      end

      it 'returns success' do
        expect(subject).to be_successful
      end
    end

    context 'with invalid credentials' do
      let(:params_email) { user.email }
      let(:params_password) { 'BadPassword1' }

      it 'returns an invalid grant' do
        expect(body['error']).to eq 'invalid_grant'
      end

      it 'returns unauthorized' do
        expect(subject).to be_unauthorized
      end
    end
  end
end
