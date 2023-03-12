# frozen_string_literal: true

require 'spec_helper'

describe RatingPolicy do
  subject { RatingPolicy.new(user, rating) }

  before(:each) do
    @movie = FactoryBot.create(:movie)
  end

  let(:rating) { FactoryBot.create(:rating, movie_id: @movie.id) }

  context 'for a user' do
    let(:user) { FactoryBot.create(:user) }

    it { should permit(:show) }
    it { should permit(:index) }

    it { should_not permit(:create) }
    it { should_not permit(:update) }
  end

  context 'for a admin' do
    let(:user) { FactoryBot.create(:user, role: 1) }

    it { should permit(:index) }
    it { should permit(:show) }
    it { should permit(:create) }
    it { should permit(:update) }
  end
end
