# frozen_string_literal: true

require 'spec_helper'

describe ActorPolicy do
  subject { ActorPolicy.new(user, actor) }

  before(:each) do
    @movie = FactoryBot.create(:movie)
    @team = FactoryBot.create(:team, movie_id: @movie.id)
  end

  let(:actor) { FactoryBot.create(:actor, team_id: @team.id) }

  context 'for a user' do
    let(:user) { FactoryBot.create(:user) }

    it { should permit(:show) }
    it { should permit(:index) }

    it { should_not permit(:create) }
    it { should_not permit(:update) }
    it { should_not permit(:destroy) }
  end

  context 'for a admin' do
    let(:user) { FactoryBot.create(:user, role: 1) }

    it { should permit(:index) }
    it { should permit(:show) }
    it { should permit(:create) }
    it { should permit(:update) }
    it { should permit(:destroy) }
  end
end
