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

      it '商品名がなければ出品ができない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '出品画像がなければ出品ができない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品の説明がなければ出品ができない' do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end

      it 'カテゴリーの情報がなければ出品ができない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態の情報がなければ出品ができない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担についての情報がなければ出品ができない' do
        @item.fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end

      it '発送元の地域についての情報がなければ出品ができない' do
        @item.place_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Place can't be blank")
      end

      it '発送までの日数についての情報がなければ出品ができない' do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end

      it '販売価格の情報がなければ出品ができない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end

      #ジャンルの選択が「--」の時は出品ができないテスト
      
      it 'カテゴリーの情報が[--]の時、出品ができない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態の情報が[--]の時、出品ができない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it '配送料の負担についての情報が[--]の時、出品ができない' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee must be other than 1")
      end

      it '発送元の地域についての情報が[--]の時、出品ができない' do
        @item.place_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Place must be other than 1")
      end

      it '発送までの日数についての情報が[--]の時、出品ができない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end

      #販売価格関連のテスト

      it '販売価格が299円以下では出品ができない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '販売価格が10,000,000円以上では出品ができない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

    end
  end
end
