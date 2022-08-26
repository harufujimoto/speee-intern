# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'モデルのバリデーション' do
    context '全ての必須項目が存在するとき' do
      let(:company) { build(:company) }

      it 'モデルが有効である' do
        expect(company).to be_valid
      end
    end
  end
end
