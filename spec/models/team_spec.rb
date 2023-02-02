# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Team, type: :model do
  it 'has a valid factory' do
    team = FactoryBot.build(:team)
    expect(team.movie_id).to be Movie.first
  end
end
