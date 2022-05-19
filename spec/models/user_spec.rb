require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }
  let!(:user2) { create(:user, email: 'test1@yopmail.com') }

  context 'with 1 user' do
    it 'only user create check' do
      expect(User.all.count).to eq(2)
    end
  end


  # CHECK VALIDATION PRESENCE CONDITION...................

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a email' do
    user.email = nil
    expect(user).to_not be_valid
  end
end
