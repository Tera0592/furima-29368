require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザーを新規登録する' do
    context '新規登録がうまくいくとき' do
      it '全ての項目が存在すれば正常に登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      # ~がなければ登録ができないテスト

      it 'nicknameがなければ登録ができない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailがなければ登録ができない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordがなければ登録ができない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      # 本人確認関連のテスト

      it 'family_nameがなければ登録ができない' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", 'Family name is invalid')
      end

      it 'family_nameが平仮名、カナ文字、漢字以外のとき登録ができない' do
        @user.family_name = '$¥&*?'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end

      it 'first_nameがなければ登録ができない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
      end

      it 'first_nameが平仮名、カナ文字、漢字以外のとき登録ができない' do
        @user.first_name = '$¥&*?'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'family_name_kanaがなければ登録ができない' do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank", 'Family name kana is invalid')
      end

      it 'family_name_kanaがカナ文字以外のとき登録ができない' do
        @user.family_name_kana = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end

      it 'first_name_kanaがなければ登録ができない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana is invalid')
      end

      it 'first_name_kanaがカナ文字以外のとき登録ができない' do
        @user.first_name_kana = '一郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'birthがなければ登録ができない' do
        @user.birth = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end

      # password関連のテスト
      it 'passwordが５文字以下だと登録ができない' do
        @user.password = 'abcde'
        @user.password_confirmation = 'abcde'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが存在してもpassword_confirmationが空だと登録ができない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      # email関連のテスト

      it 'emailが重複して存在すると登録ができない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@がないとき登録ができない' do
        @user.email = 'abcdeyahoo.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
    end
  end
end
