# frozen_string_literal: true

require 'spec_helper'

describe UserPolicy do
  subject { UserPolicy.new(current_user, user) }

  let(:user) { FactoryBot.create(:user) }

  context 'for a user' do
    let(:current_user) { FactoryBot.create(:user) }

    it { should_not permit(:show) }
    it { should_not permit(:index) }
    it { should_not permit(:destroy) }
  end

  context 'for a admin' do
    let(:current_user) { FactoryBot.create(:user, role: 1) }

    it { should permit(:index) }
    it { should permit(:show) }
    it { should permit(:destroy) }
  end
end
