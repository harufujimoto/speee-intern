# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cities', type: :request do
  describe 'GET /show' do
    context '必要なデータが存在するとき' do
      let(:city) { create(:city, prefecture: create(:prefecture)) }

      it 'ページが表示される' do
        get prefecture_city_path(prefecture_id: city.prefecture_id, id: city)
        expect(response).to have_http_status(:success)
      end
    end
  end
end
