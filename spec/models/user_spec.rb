# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#set_default_role' do
    context 'when a new user is created' do
      it 'sets the default role to :user if no role is specified' do
        user = User.new
        expect(user.role).to eq('user')
      end

      it 'does not override an explicitly set role' do
        admin_user = User.new(role: :admin)
        expect(admin_user.role).to eq('admin')
      end
    end
  end
end
