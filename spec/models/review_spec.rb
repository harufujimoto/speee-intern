# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'モデルのバリデーション' do
    context '全ての必須項目が存在するとき' do
      let(:prefecture) { build(:prefecture) }
      let(:city) { build(:city, prefecture:) }
      let(:company) { build(:company) }
      let(:store) { build(:store, company:, city:) }
      let(:property_type) { build(:property_type) }
      let(:review) { build(:review, store:, city:, property_type:) }

      it 'モデルが有効である' do
        expect(review).to be_valid
      end
    end
  end
end
