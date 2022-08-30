# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EvaluationRequest, type: :model do
  describe 'フォームオブジェクトのバリデーション' do
    context '全ての必須項目が存在するとき' do
      let(:evaluation_request) { build(:evaluation_request) }

      it 'モデルが有効である' do
        expect(evaluation_request).to be_valid
      end
    end

    context 'メールアドレスが不正なとき' do
      let(:evaluation_request) { build(:evaluation_request, user_email: 'a' * 101) }

      it 'モデルが無効である' do
        expect(evaluation_request.valid?).to be false
      end
    end

    context '電話番号が不正なとき' do
      let(:evaluation_request) { build(:evaluation_request, user_tel: '123456789') }

      it 'モデルが無効である' do
        expect(evaluation_request.valid?).to be false
      end
    end
  end
end
