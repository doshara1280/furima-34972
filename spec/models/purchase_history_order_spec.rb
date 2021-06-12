require 'rails_helper'

RSpec.describe PurchaseHistoryOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    sleep(0.1)
    @purchase_history_order = FactoryBot.build(:purchase_history_order, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it '必要事項を入力すれば購入できる' do
        expect(@purchase_history_order).to be_valid
      end
      it '建物名が空欄でも購入できる' do
        @purchase_history_order.building_name = ''
        expect(@purchase_history_order).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it '郵便番号が空欄だと購入できない' do
        @purchase_history_order.postal_code = ''
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号がXXX-XXXXの形式(Xは数値)になっていないと購入できない' do
        @purchase_history_order.postal_code = '0000000'
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号が半角でないと購入できない' do
        @purchase_history_order.postal_code = '１１１-１１１１'
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include('Postal code is invalid')
      end
      it '都道府県が未選択(--)だと購入できない' do
        @purchase_history_order.shipping_area_id = 1
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '市区町村が空欄だと購入できない' do
        @purchase_history_order.municipality = ''
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空欄だと購入できない' do
        @purchase_history_order.address = ''
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が11桁以内でないと購入できない' do
        @purchase_history_order.tel = '000000000000'
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include('Tel is invalid')
      end
      it '電話番号が半角でないと購入できない' do
        @purchase_history_order.tel = '０００００００００００'
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include('Tel is invalid')
      end
      it '電話番号が全て数値でないと購入できない' do
        @purchase_history_order.tel = '1a1a1a1a1a1'
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include('Tel is invalid')
      end
      it 'tokenが空では購入できない' do
        @purchase_history_order.token = nil
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_id（購入者）が空だと購入できない' do
        @purchase_history_order.user_id = nil
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_id(購入商品)が空だと購入できない' do
        @purchase_history_order.item_id = nil
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
