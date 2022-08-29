# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Stores', type: :request do
  describe 'GET /show' do
    context '必要なデータが存在するとき' do
      let(:city) { create(:city, prefecture: create(:prefecture)) }
      let(:store) { create(:store, company: create(:company), city:) }
      let!(:review) { create(:review, property_type: create(:property_type), store:, city:) } # rubocop:disable RSpec/LetSetup

      it 'ページが表示される' do
        get store_path(store)
        expect(response).to have_http_status(:success)
      end
    end
  end
end
