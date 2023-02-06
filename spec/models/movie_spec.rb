require 'rails_helper'

RSpec.describe Movie, type: :model do
  it 'Movie has a valid factory' do
    movie = FactoryBot.build(:movie)
    expect(movie.valid?).to be true
  end
  it 'Movie cannot create without title' do
    movie = FactoryBot.build(:movie, title: nil)
    expect(movie.valid?).to be false
  end
end
