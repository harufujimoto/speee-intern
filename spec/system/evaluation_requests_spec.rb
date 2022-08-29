# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'EvaluationRequests', type: :system do
  describe '/new' do
    context '必須項目を入力して査定依頼ボタンを押すと' do
      let(:city) { create(:city, prefecture: create(:prefecture)) }
      let(:store) { create(:store, company: create(:company), city:) }
      let!(:property_type) { create(:property_type) } # rubocop:disable RSpec/LetSetup
      let!(:valuation_area) { create(:valuation_area, city:, store:) } # rubocop:disable RSpec/LetSetup

      it 'Thanksページにリダイレクトされる' do # rubocop:disable RSpec/ExampleLength
        visit new_evaluation_request_path(ieul_store_id: store.ieul_store_id)

        fill_in '以降住所', with: '品川2丁目'
        select 'マンション', from: '物件種別'
        choose '平方メートル'
        fill_in '専有面積', with: 100
        fill_in '土地面積', with: 100
        fill_in '建物面積', with: 100
        fill_in '延床面積', with: 100
        select '1R(ワンルーム)', from: '間取り'
        fill_in '築年数（※西暦で入力してください）', with: 2000
        fill_in 'メールアドレス（※100字以内の有効なメールアドレス）', with: 'example@example.com'
        fill_in 'お名前（※姓名の間に半角スペースを入れてください）', with: '服部 彩'
        fill_in 'ふりがな（※姓名の間に半角スペースを入れてください）', with: 'はっとり あや'
        fill_in '電話番号（※ハイフンなしの有効な電話番号）', with: '0300000000'

        click_button '査定依頼をする'
        expect(page).to have_current_path thanks_path
      end
    end

    context 'フォームを入力せずに査定依頼ボタンを押すと' do
      let(:city) { create(:city, prefecture: create(:prefecture)) }
      let(:store) { create(:store, company: create(:company), city:) }
      let!(:valuation_area) { create(:valuation_area, city:, store:) } # rubocop:disable RSpec/LetSetup

      it 'エラーが表示される' do
        visit new_evaluation_request_path(ieul_store_id: store.ieul_store_id)
        click_button '査定依頼をする'
        within('.alert-danger') do
          expect(page).to have_content('正しく入力されていない項目が 25 個あります。メッセージをご確認の上、もう一度ご入力ください。')
        end
      end
    end
  end
end
