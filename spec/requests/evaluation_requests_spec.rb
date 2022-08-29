# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'EvaluationRequests', type: :request do
  describe 'GET /new' do
    context '必要なデータが存在するとき' do
      let(:city) { create(:city, prefecture: create(:prefecture)) }
      let(:store) { create(:store, company: create(:company), city:) }

      it 'ページが表示される' do
        get new_evaluation_request_path(ieul_store_id: store.ieul_store_id)
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'POST /create' do
    let(:city) { create(:city, prefecture: create(:prefecture)) }
    let!(:store) { create(:store, company: create(:company), city:) } # rubocop:disable RSpec/LetSetup

    context '必要なデータが存在するとき' do
      let(:evaluation_request) { attributes_for(:evaluation_request) }

      it 'Thanksページにリダイレクトされる' do
        post evaluation_requests_path, params: { evaluation_request: }
        expect(response).to redirect_to thanks_path
      end
    end

    context 'メールアドレスが不正なとき' do
      let(:evaluation_request) { attributes_for(:evaluation_request, user_email: 'a' * 101) }

      it '査定依頼フォームが表示される' do
        post evaluation_requests_path, params: { evaluation_request: }
        expect(response.body).to render_template(:new)
      end
    end

    context '名前が不正なとき' do
      let(:evaluation_request) { attributes_for(:evaluation_request, user_name: '服部彩') }

      it '査定依頼フォームが表示される' do
        post evaluation_requests_path, params: { evaluation_request: }
        expect(response.body).to render_template(:new)
      end
    end

    context 'ふりがなが不正なとき' do
      let(:evaluation_request) { attributes_for(:evaluation_request, user_name: 'はっとりあや') }

      it '査定依頼フォームが表示される' do
        post evaluation_requests_path, params: { evaluation_request: }
        expect(response.body).to render_template(:new)
      end
    end

    context '電話番号が不正なとき' do
      let(:evaluation_request) { attributes_for(:evaluation_request, user_tel: '123456789') }

      it '査定依頼フォームが表示される' do
        post evaluation_requests_path, params: { evaluation_request: }
        expect(response.body).to render_template(:new)
      end
    end
  end
end
