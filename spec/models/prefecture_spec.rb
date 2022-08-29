# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Prefecture, type: :model do
  describe 'モデルのバリデーション' do
    context '全ての必須項目が存在するとき' do
      let(:prefecture) { build(:prefecture) }

      it 'モデルが有効である' do
        expect(prefecture).to be_valid
      end
    end
  end
end
