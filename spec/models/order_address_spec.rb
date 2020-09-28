require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入者の情報を保存する' do
    
    context '情報が正しく保存されるとき' do
      it '全ての項目が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
    end

    context '情報が正しく保存されないとき' do
      
      # ~がなければ保存ができないテスト
      it 'postal_codeがなければ保存できないこと' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end

      it 'prefectureがなければ保存ができないこと' do
        @order_address.prefecture = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityがなければ保存ができないこと' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberがなければ保存ができないこと' do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberがなければ保存ができないこと' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end

      it 'tokenがなければ保存ができないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      
      # acitve_hash関連のテスト

      it 'prefectureを選択していないと保存ができないこと' do
        @order_address.prefecture = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      # postal_codeのテスト

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

    end
  end
end
