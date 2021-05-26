require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できるとき' do
      it '必要事項を正しく入力できれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できないとき' do
      it '商品画像が1枚ついていないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空欄だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空欄だと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it '商品カテゴリーの情報が未選択(--)だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品状態の情報が未選択(--)だと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '商品の配送料負担の情報が未選択(--)だと出品できない' do
        @item.shipping_fee_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee burden can't be blank")
      end
      it '商品発送元地域の情報が未選択(--)だと出品できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '商品の発送までの日数の情報が未選択(--)だと出品できない' do
        @item.day_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to ship can't be blank")
      end
      it '販売価格が空欄だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が全角文字では出品できない' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Price must be 300-9999999 yen and half-width characters')
      end
      it '販売価格が半角英数混合では出品できない' do
        @item.price = '11aa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Price must be 300-9999999 yen and half-width characters')
      end
      it '販売価格が半角英語では出品できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Price must be 300-9999999 yen and half-width characters')
      end
      it '販売価格が300円未満だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Price must be 300-9999999 yen and half-width characters')
      end
      it '販売価格が9999999円より高いと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Price must be 300-9999999 yen and half-width characters')
      end
    end
  end
end
