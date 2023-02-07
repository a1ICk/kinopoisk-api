require 'rails_helper'

RSpec.describe Rating, type: :model do
  before(:each) do
    @movie = FactoryBot.create(:movie)
  end

  describe 'initialized in before(:each)' do
    it 'Rating has a valid factory' do
      rating = FactoryBot.build(:rating, movie_id: @movie.id)
      expect(rating.valid?).to be true
    end

    it 'Rating cannot create without kp' do
      rating = FactoryBot.build(:rating, kp: nil, movie_id: @movie.id)
      expect(rating.valid?).to be false
    end

    it 'Rating cannot create without imdb' do
      rating = FactoryBot.build(:rating, imdb: nil, movie_id: @movie.id)
      expect(rating.valid?).to be false
    end

    it 'Rating belongs_to Movie' do
      should belong_to :movie
    end
  end
end
