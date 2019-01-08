require 'rails_helper'

RSpec.describe ApplicationRecord, type: :model do
  describe '.first' do
    let!(:users) { FactoryBot.create_list(:user, 2) }

    it 'returns the first record sorted by created_at' do
      first_user = users.sort_by { |user| user.created_at }.first
      expect(User.first).to eq first_user
    end
  end

  describe '.first!' do
    context 'with resources' do
      let!(:users) { FactoryBot.create_list(:user, 2) }

      it 'returns the first record sorted by created_at' do
        first_user = users.sort_by { |user| user.created_at }.first
        expect(User.first).to eq first_user
      end
    end

    context 'without resources' do
      it 'raises record not found' do
        expect { User.first! }.to raise_exception ActiveRecord::RecordNotFound
      end
    end
  end
  
  describe '.second' do
    let!(:users) { FactoryBot.create_list(:user, 3) }

    it 'returns the first record sorted by created_at' do
      second_user = users.sort_by { |user| user.created_at }[1]
      expect(User.second).to eq second_user
    end
  end

  describe '.second!' do
    context 'with resources' do
      let!(:users) { FactoryBot.create_list(:user, 3) }

      it 'returns the first record sorted by created_at' do
        second_user = users.sort_by { |user| user.created_at }[1]
        expect(User.second).to eq second_user
      end
    end

    context 'without resources' do
      it 'raises record not found' do
        expect { User.second! }.to raise_exception ActiveRecord::RecordNotFound
      end
    end
  end
  
  describe '.third' do
    let!(:users) { FactoryBot.create_list(:user, 4) }

    it 'returns the first record sorted by created_at' do
      third_user = users.sort_by { |user| user.created_at }[2]
      expect(User.third).to eq third_user
    end
  end

  describe '.third!' do
    context 'with resources' do
      let!(:users) { FactoryBot.create_list(:user, 4) }

      it 'returns the first record sorted by created_at' do
        third_user = users.sort_by { |user| user.created_at }[2]
        expect(User.third).to eq third_user
      end
    end

    context 'without resources' do
      it 'raises record not found' do
        expect { User.third! }.to raise_exception ActiveRecord::RecordNotFound
      end
    end
  end
  
  describe '.fourth' do
    let!(:users) { FactoryBot.create_list(:user, 5) }

    it 'returns the first record sorted by created_at' do
      fourth_user = users.sort_by { |user| user.created_at }[3]
      expect(User.fourth).to eq fourth_user
    end
  end

  describe '.fourth!' do
    context 'with resources' do
      let!(:users) { FactoryBot.create_list(:user, 5) }

      it 'returns the first record sorted by created_at' do
        fourth_user = users.sort_by { |user| user.created_at }[3]
        expect(User.fourth).to eq fourth_user
      end
    end

    context 'without resources' do
      it 'raises record not found' do
        expect { User.fourth! }.to raise_exception ActiveRecord::RecordNotFound
      end
    end
  end
  
  describe '.fifth' do
    let!(:users) { FactoryBot.create_list(:user, 6) }

    it 'returns the first record sorted by created_at' do
      fifth_user = users.sort_by { |user| user.created_at }[4]
      expect(User.fifth).to eq fifth_user
    end
  end

  describe '.fifth!' do
    context 'with resources' do
      let!(:users) { FactoryBot.create_list(:user, 6) }

      it 'returns the first record sorted by created_at' do
        fifth_user = users.sort_by { |user| user.created_at }[4]
        expect(User.fifth).to eq fifth_user
      end
    end

    context 'without resources' do
      it 'raises record not found' do
        expect { User.fifth! }.to raise_exception ActiveRecord::RecordNotFound
      end
    end
  end

  describe '.forty_two' do
    let!(:users) { FactoryBot.create_list(:user, 42) }

    it 'returns the first record sorted by created_at' do
      forty_two_user = users.sort_by { |user| user.created_at }[41]
      expect(User.forty_two).to eq forty_two_user
    end
  end

  describe '.forty_two!' do
    context 'with resources' do
      let!(:users) { FactoryBot.create_list(:user, 43) }

      it 'returns the first record sorted by created_at' do
        forty_two_user = users.sort_by { |user| user.created_at }[41]
        expect(User.forty_two).to eq forty_two_user
      end
    end

    context 'without resources' do
      it 'raises record not found' do
        expect { User.forty_two! }.to raise_exception ActiveRecord::RecordNotFound
      end
    end
  end

  describe '.last' do
    let!(:users) { FactoryBot.create_list(:user, 2) }

    it 'returns the first record sorted by created_at' do
      last_user = users.sort_by { |user| user.created_at }[-1]
      expect(User.last).to eq last_user
    end
  end

  describe '.last!' do
    context 'with resources' do
      let!(:users) { FactoryBot.create_list(:user, 2) }

      it 'returns the first record sorted by created_at' do
        last_user = users.sort_by { |user| user.created_at }[-1]
        expect(User.last).to eq last_user
      end
    end

    context 'without resources' do
      it 'raises record not found' do
        expect { User.last! }.to raise_exception ActiveRecord::RecordNotFound
      end
    end
  end

  describe '.second_to_last' do
    let!(:users) { FactoryBot.create_list(:user, 3) }

    it 'returns the first record sorted by created_at' do
      second_to_last_user = users.sort_by { |user| user.created_at }[-2]
      expect(User.second_to_last).to eq second_to_last_user
    end
  end

  describe '.second_to_last!' do
    context 'with resources' do
      let!(:users) { FactoryBot.create_list(:user, 3) }

      it 'returns the first record sorted by created_at' do
        second_to_last_user = users.sort_by { |user| user.created_at }[-2]
        expect(User.second_to_last).to eq second_to_last_user
      end
    end

    context 'without resources' do
      it 'raises record not found' do
        expect { User.second_to_last! }.to raise_exception ActiveRecord::RecordNotFound
      end
    end
  end


  describe '.third_to_last' do
    let!(:users) { FactoryBot.create_list(:user, 4) }

    it 'returns the first record sorted by created_at' do
      third_to_last_user = users.sort_by { |user| user.created_at }[-3]
      expect(User.third_to_last).to eq third_to_last_user
    end
  end

  describe '.third_to_last!' do
    context 'with resources' do
      let!(:users) { FactoryBot.create_list(:user, 4) }

      it 'returns the first record sorted by created_at' do
        third_to_last_user = users.sort_by { |user| user.created_at }[-3]
        expect(User.third_to_last).to eq third_to_last_user
      end
    end

    context 'without resources' do
      it 'raises record not found' do
        expect { User.third_to_last! }.to raise_exception ActiveRecord::RecordNotFound
      end
    end
  end
end
