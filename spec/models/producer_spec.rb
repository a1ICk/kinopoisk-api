require 'rails_helper'

RSpec.describe Producer, type: :model do
  before(:each) do
    @movie = FactoryBot.create(:movie)
    @team = FactoryBot.create(:team, movie_id: @movie.id)
  end

  describe 'initialized in before(:each)' do
    it 'Producer has a valid factory' do
      producer = FactoryBot.build(:producer, team_id: @team.id)
      expect(producer.valid?).to be true
    end

    it 'Producer cannot create without name' do
      producer = FactoryBot.build(:producer, name: nil, team_id: @team.id)
      expect(producer.valid?).to be false
    end

    it 'Producer cannot create without experience' do
      producer = FactoryBot.build(:producer, experience: nil, team_id: @team.id)
      expect(producer.valid?).to be false
    end

    it 'Producer belongs_to Team' do
      should belong_to :team
    end
  end
end
