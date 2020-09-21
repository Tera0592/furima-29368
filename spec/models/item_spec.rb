require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品を出品する' do
    context '商品出品がうまくいくとき' do
      it '全ての項目が存在すれば正常に出品ができる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      # ~がなければ出品ができない

      it '商品名がなければ登録ができない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '出品画像がなければ登録ができない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品の説明がなければ登録ができない' do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end

      it 'カテゴリーの情報がなければ登録ができない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態の情報がなければ登録ができない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担についての情報がなければ登録ができない' do
        @item.fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end

      it '発送元の地域についての情報がなければ登録ができない' do
        @item.place_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Place can't be blank")
      end

      it '発送までの日数についての情報がなければ登録ができない' do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end

      it '販売価格の情報がなければ登録ができない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
    end
  end
end
