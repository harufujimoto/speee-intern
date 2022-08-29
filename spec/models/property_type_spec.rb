# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PropertyType, type: :model do
  describe 'モデルのバリデーション' do
    context '全ての必須項目が存在するとき' do
      let(:property_type) { build(:property_type) }

      it 'モデルが有効である' do
        expect(property_type).to be_valid
      end
    end
  end
end
