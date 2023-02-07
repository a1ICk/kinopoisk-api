require 'rails_helper'

RSpec.describe User, type: :model do
  it 'User has a valid factory' do
    user = FactoryBot.build(:user)
    expect(user.valid?).to be true
  end

  it 'User cannot create without email' do
    user = FactoryBot.build(:user, email: nil)
    expect(user.valid?).to be false
  end

  it 'User cannot create without password' do
    user = FactoryBot.build(:user, password: nil)
    expect(user.valid?).to be false
  end
end
