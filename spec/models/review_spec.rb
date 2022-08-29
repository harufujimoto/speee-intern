# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'モデルのバリデーション' do
    context '全ての必須項目が存在するとき' do
      let(:city) { create(:city, prefecture: create(:prefecture)) }
      let(:store) { create(:store, company: create(:company), city:) }
      let(:review) { create(:review, property_type: create(:property_type), store:, city:) }

      it 'モデルが有効である' do
        expect(review).to be_valid
      end
    end
  end
end
