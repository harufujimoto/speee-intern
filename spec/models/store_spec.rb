# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'モデルのバリデーション' do
    context '全ての必須項目が存在するとき' do
      let(:company) { build(:company) }
      let(:prefecture) { build(:prefecture) }
      let(:city) { build(:city, prefecture:) }
      let(:store) { build(:store, company:, city:) }

      it 'モデルが有効である' do
        expect(store).to be_valid
      end
    end
  end
end
