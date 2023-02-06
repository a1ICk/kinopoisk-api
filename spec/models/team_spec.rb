# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Team, type: :model do
  before(:each) do
    @movie = FactoryBot.create(:movie)
  end

  describe 'initialized in before(:each)' do
    it 'Team has a valid factory' do
      team = FactoryBot.build(:team, movie_id: @movie.id)
      expect(team.valid?).to be true
    end

    it 'Team without movie_id' do
      team = FactoryBot.build(:team, movie_id: nil)
      expect(team.valid?).to be false
    end

    it 'Team belongs_to Movie' do
      should belong_to :movie
    end
  end
end
