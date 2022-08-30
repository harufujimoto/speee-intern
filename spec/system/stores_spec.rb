# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Stores', type: :system do
  describe '/show' do
    context '査定依頼ボタンを押すと' do
      let(:city) { create(:city, prefecture: create(:prefecture)) }
      let(:store) { create(:store, company: create(:company), city:) }
      let!(:review) { create(:review, property_type: create(:property_type), store:, city:) } # rubocop:disable RSpec/LetSetup

      it '査定依頼フォームが表示される' do
        visit store_path(store)
        click_link '査定依頼する'
        expect(page).to have_current_path new_evaluation_request_path(ieul_store_id: store.ieul_store_id)
      end
    end
  end
end
