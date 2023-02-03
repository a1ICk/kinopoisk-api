require 'rails_helper'

RSpec.describe Movie, type: :model do
  it 'has a valid factory' do
    movie = FactoryBot.build(:movie)
    expect(movie.release_date).to be 2008
  end
end
