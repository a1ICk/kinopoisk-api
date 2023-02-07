require 'rails_helper'

RSpec.describe Actor, type: :model do
  before(:each) do
    @movie = FactoryBot.create(:movie)
    @team = FactoryBot.create(:team, movie_id: @movie.id)
  end

  describe 'initialized in before(:each)' do
    it 'Actor has a valid factory' do
      actor = FactoryBot.build(:actor, team_id: @team.id)
      expect(actor.valid?).to be true
    end

    it 'Actor cannot create without name' do
      actor = FactoryBot.build(:actor, name: nil, team_id: @team.id)
      expect(actor.valid?).to be false
    end

    it 'Actor cannot create without count_of_films' do
      actor = FactoryBot.build(:actor, count_of_films: nil, team_id: @team.id)
      expect(actor.valid?).to be false
    end

    it 'Actor belongs_to Team' do
      should belong_to :team
    end
  end
end
