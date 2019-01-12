require 'rails_helper'

RSpec.describe Doorkeeper::TokensController, type: :request do
  let!(:user) { FactoryBot.create(:user) }

  describe 'create' do
    let(:body) { JSON.parse(subject.body) }

    subject {
      post "#{API_V1_PATH}/auth/token", 
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

      it 'creates a record' do
        expect{ subject }.to change { Doorkeeper::AccessToken.count }.by(1)
        access_token = Doorkeeper::AccessToken.last
        expect(access_token.token).to eq body['access_token']
        expect(access_token.resource_owner_id).to eq user.id
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

  describe 'revoke' do
    #Doorkeeper::AccessToken.first
    it 'revokes authorization' do
      Timecop.freeze do
        post "#{API_V1_PATH}/auth/token", 
        params: {
            email: user.email,
            password: user.password,
            grant_type: 'password'
        }

        token = Doorkeeper::AccessToken.last

        post "#{API_V1_PATH}/auth/revoke", 
        params: {
            token: token.token
        }

        token.reload()
        expect(token.revoked_at).to be_within(TIME_TOLERANCE).of Time.zone().now
      end
    end
  end

  describe 'introspect' do
    it 'does something'
  end
end
