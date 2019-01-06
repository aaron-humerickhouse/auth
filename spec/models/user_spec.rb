require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context 'email' do
      it 'is required' do
        user = FactoryBot.build(:user, email: nil)
        expect(user).to_not be_valid
        expect(user.errors[:email]).to eq ["can't be blank"]
      end

      it 'must be a valid email format' do
        user = FactoryBot.build(:user, email: 'test')
        expect(user).to_not be_valid
        expect(user.errors[:email]).to eq ["is invalid"]

        user = FactoryBot.build(:user, email: 'test@example.com')
        expect(user).to be_valid
      end
    end

    context 'password' do
      it 'is required' do
        user = FactoryBot.build(:user, password: nil)
        expect(user).to_not be_valid
        expect(user.errors[:password]).to include "can't be blank"
      end

      it 'must match password_confirmation' do
        user = FactoryBot.build(:user, password: 'Test1234', password_confirmation: 'fail')

        expect(user).to_not be_valid
        expect(user.errors[:password_confirmation]).to eq ["doesn't match Password"]
      end

      it 'must contain at least 1 uppercase, 1 lowercase, and 1 number' do
        user = FactoryBot.build(:user, password: 'test1234', password_confirmation: 'test1234')
        expect(user).to_not be_valid
        puts user.errors.inspect
        expect(user.errors[:password]).to eq ["must contain big, small letters and digits"]

        user = FactoryBot.build(:user, password: 'TEST1234')
        expect(user).to_not be_valid
        expect(user.errors[:password]).to eq ["must contain big, small letters and digits"]

        user = FactoryBot.build(:user, password: 'testTest')
        expect(user).to_not be_valid
        expect(user.errors[:password]).to eq ["must contain big, small letters and digits"]

        user = FactoryBot.build(:user, password: 'Test1234')
        expect(user).to be_valid
      end

      it 'must be at least 8 characters' do
        user = FactoryBot.build(:user, password: 'Test12')
        expect(user).to_not be_valid
        expect(user.errors[:password]).to eq ["is too short (minimum is 8 characters)"]

        user = FactoryBot.build(:user, 
                                password: 'Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Tes')
        expect(user).to_not be_valid
        expect(user.errors[:password]).to eq ["is too long (maximum is 128 characters)"]

        user = FactoryBot.build(:user, password: 'Test1234')
        expect(user).to be_valid

        user = FactoryBot.build(:user, password: 'Test1234567890', password_confirmation: 'Test1234567890')
        expect(user).to be_valid

        user = FactoryBot.build(:user, 
                                password: 'Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Te',
                                password_confirmation: 'Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Test12Te')
        expect(user).to be_valid
      end
      it 'is expirable'
      it 'is archivable'
    end

    context 'first_name' do
      it 'is required' do
        user = FactoryBot.build(:user, first_name: nil)
        expect(user).to_not be_valid
        expect(user.errors[:first_name]).to eq ["is too short (minimum is 2 characters)"]
      end

      it 'must match name regex' do
        ['George1', 'George$'].each do |name|
          user = FactoryBot.build(:user, first_name: name)
          expect(user).to_not be_valid
          expect(user.errors[:first_name]).to eq ["is invalid"]
        end

        ['George', 'Bob-Truck', "D'antoine"].each do |name|
          user = FactoryBot.build(:user, first_name: name)
          expect(user).to be_valid
        end
      end

      it 'must be at least two characters' do
        user = FactoryBot.build(:user, first_name: 'A')
        expect(user).to_not be_valid
        expect(user.errors[:first_name]).to eq ["is too short (minimum is 2 characters)"]
      end
    end

    context 'last_name' do
      it 'is required' do
        user = FactoryBot.build(:user, last_name: nil)
        expect(user).to_not be_valid
        expect(user.errors[:last_name]).to eq ["is too short (minimum is 2 characters)"]
      end
      
      it 'must match name regex' do
        ['George1', 'George$'].each do |name|
          user = FactoryBot.build(:user, last_name: name)
          expect(user).to_not be_valid
          expect(user.errors[:last_name]).to eq ["is invalid"]
        end

        ['George', 'Bob-Truck', "D'antoine"].each do |name|
          user = FactoryBot.build(:user, last_name: name)
          expect(user).to be_valid
        end
      end

      it 'must be at least two characters' do
        user = FactoryBot.build(:user, last_name: 'A')
        expect(user).to_not be_valid
        expect(user.errors[:last_name]).to eq ["is too short (minimum is 2 characters)"]
      end
    end
  end

  it 'is lockable'
  it 'is recoverable'
  it 'is rememerable'
  it 'is confirmable'
  it 'is trackable'
  it 'is database_authenticatable'
end
