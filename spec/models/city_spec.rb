# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'モデルのバリデーション' do
    context '全ての必須項目が存在するとき' do
      let(:city) { build(:city, prefecture: create(:prefecture)) }

      it 'モデルが有効である' do
        expect(city).to be_valid
      end
    end
  end
end
