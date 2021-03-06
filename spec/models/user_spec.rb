require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、family_name、first_name、furi_family_name、furi_first_name、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上かつ英数字含むであれば登録できる' do
        @user.password = 'a00000'
        @user.password_confirmation = 'a00000'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに＠がないと登録できない' do
        @user.email = 'gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'family_nameが半角カナでは登録できない' do
        @user.family_name = 'ｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it 'family_nameが英字では登録できない' do
        @user.family_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it 'family_nameが数字では登録できない' do
        @user.family_name = '０'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが半角カナでは登録できない' do
        @user.first_name = 'ｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'first_nameが英字では登録できない' do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'first_nameが数字では登録できない' do
        @user.first_name = '０'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'furi_family_nameが空では登録できない' do
        @user.furi_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Furi family name can't be blank")
      end
      it 'furi_family_nameが半角カナでは登録できない' do
        @user.furi_family_name = 'ｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Furi family name is invalid')
      end
      it 'furi_family_nameが英字では登録できない' do
        @user.furi_family_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Furi family name is invalid')
      end
      it 'furi_family_nameが数字では登録できない' do
        @user.furi_family_name = '０'
        @user.valid?
        expect(@user.errors.full_messages).to include('Furi family name is invalid')
      end
      it 'furi_first_nameが空では登録できない' do
        @user.furi_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Furi first name can't be blank")
      end
      it 'furi_first_nameが半角カナでは登録できない' do
        @user.furi_first_name = 'ｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Furi first name is invalid')
      end
      it 'furi_first_nameが英字では登録できない' do
        @user.furi_first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Furi first name is invalid')
      end
      it 'furi_first_nameが数字では登録できない' do
        @user.furi_first_name = '０'
        @user.valid?
        expect(@user.errors.full_messages).to include('Furi first name is invalid')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字のみであれば登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが英字のみであれば登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが全角のみであれば登録できない' do
        @user.password = '００００００'
        @user.password_confirmation = '００００００'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが不一致であれば登録できない' do
        @user.password = 'a00000'
        @user.password_confirmation = 'b00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end

