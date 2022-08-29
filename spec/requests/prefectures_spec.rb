# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Prefectures', type: :request do
  describe 'GET /index' do
    context '必要なデータが存在するとき' do
      it 'ページが表示される' do
        get prefectures_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET /show' do
    context '必要なデータが存在するとき' do
      let(:prefecture) { create(:prefecture) }

      it 'ページが表示される' do
        get prefecture_path(prefecture)
        expect(response).to have_http_status(:success)
      end
    end
  end
end
