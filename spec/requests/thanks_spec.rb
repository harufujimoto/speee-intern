# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Thanks', type: :request do
  describe 'GET /index' do
    context '必要なデータが存在するとき' do
      it 'ページが表示される' do
        get thanks_path
        expect(response).to have_http_status(:success)
      end
    end
  end
end
