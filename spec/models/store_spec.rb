# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'モデルのバリデーション' do
    context '全ての必須項目が存在するとき' do
      let(:city) { build(:city, prefecture: create(:prefecture)) }
      let(:store) { build(:store, company: create(:company), city:) }

      it 'モデルが有効である' do
        expect(store).to be_valid
      end
    end
  end
end
