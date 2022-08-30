# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'EvaluationRequests', type: :system do
  describe '/new' do
    context '必須項目を入力して査定依頼ボタンを押すと' do
      let(:city) { create(:city, prefecture: create(:prefecture)) }
      let(:store) { create(:store, company: create(:company), city:) }
      let!(:valuation_area) { create(:valuation_area, city:, store:) }
      let!(:property_type) { create(:property_type) } # rubocop:disable RSpec/LetSetup

      it 'Thanksページにリダイレクトされる' do # rubocop:disable RSpec/ExampleLength
        visit new_evaluation_request_path(ieul_store_id: store.ieul_store_id)

        select "#{valuation_area.city.name} (#{valuation_area.city.prefecture.name})", from: '市区町村'
        fill_in '以降住所', with: '品川2丁目'
        select 'マンション', from: '物件種別'
        choose '平方メートル'
        fill_in '専有面積', with: 100
        fill_in '土地面積', with: 100
        fill_in '建物面積', with: 100
        fill_in '延床面積', with: 100
        select '1R(ワンルーム)', from: '間取り'
        fill_in '築年数（※西暦で入力してください）', with: 2000
        fill_in '姓', with: '服部'
        fill_in '名', with: '彩'
        fill_in 'せい', with: 'はっとり'
        fill_in 'めい', with: 'あや'
        fill_in 'メールアドレス', with: 'example@example.com'
        fill_in '電話番号（※ハイフンなし）', with: '0300000000'

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
          expect(page).to have_content('正しく入力されていない項目が 30 個あります。メッセージをご確認の上、もう一度ご入力ください。')
        end
      end
    end
  end
end
