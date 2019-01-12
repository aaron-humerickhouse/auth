require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_user) { FactoryBot.create(:user) }

  it 'is lockable' do
    valid_user.lock_access!
    expect(valid_user).to be_access_locked
    valid_user.unlock_access!
    expect(valid_user).not_to be_access_locked
  end

  context 'on lock' do
    before(:each) do
      valid_user.lock_access!
    end

    it 'sends an email' do
      email = ActionMailer::Base.deliveries.last
      expect(email.subject).to eq "Unlock instructions"
    end
  end
end
