# frozen_string_literal: true

require 'spec_helper'

describe MoviePolicy do
  subject { MoviePolicy.new(user, movie) }

  let(:movie) { FactoryBot.create(:movie) }

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
