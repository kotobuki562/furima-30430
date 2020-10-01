require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameとemail、family_name,first_name,family_name_furigana,first_name_furigana,birthday,passwordとpassword_confirmationが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    # ーーーーーーーーーーーーー以下family_nameのテストコード（正規表現を含む）ーーーーーーーーーーーーーー

    it 'family_nameが空では登録できないこと' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank", 'Family name is invalid')
    end

    it 'family_nameが全角の漢字であれば登録できること' do
      @user.family_name = '杉田'
      expect(@user).to be_valid
    end

    
    it 'family_nameが全角の平仮名であれば登録できること' do
      @user.family_name = 'すぎた'
      expect(@user).to be_valid
    end

    it 'family_nameが全角のカタカナであれば登録できること' do
      @user.family_name = 'スギタ'
      expect(@user).to be_valid
    end

    it 'family_nameが全角の漢字、平仮名、カタカナでなければ登録できないこと' do
      @user.family_name = 'sugita'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid')
    end

    # ーーーーーーーーーーーーー以下first_nameのテストコード（正規表現を含む）ーーーーーーーーーーーーーー

    it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
    end

    it 'first_nameが全角の漢字であれば登録できること' do
      @user.first_name = '博一'
      expect(@user).to be_valid
    end

    it 'first_nameが全角の平仮名であれば登録できること' do
      @user.first_name = 'ひろかず'
      expect(@user).to be_valid
    end

    it 'first_nameが全角のカタカナであれば登録できること' do
      @user.first_name = 'ヒロカズ'
      expect(@user).to be_valid
    end

    it 'first_nameが全角の漢字、平仮名、カタカナでなければ登録できないこと' do
      @user.first_name = 'hirokazu'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    # ーーーーーーーーーーーーー以下family_name_furiganaのテストコード（正規表現を含む）ーーーーーーーーーーーーーー

    it 'family_name_furiganaが空では登録できないこと' do
      @user.family_name_furigana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name furigana can't be blank", 'Family name furigana is invalid')
    end

    it 'family_name_furiganaがカタカナであれば登録できること' do
      @user.family_name_furigana = 'スギタ'
      expect(@user).to be_valid
    end

    it 'family_name_furiganaが平仮名だと登録できないこと' do
      @user.family_name_furigana = 'すぎた'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name furigana is invalid')
    end

    it 'family_name_furiganaが英字だと登録できないこと' do
      @user.family_name_furigana = 'sugita'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name furigana is invalid')
    end

    it 'family_name_furiganaが漢字だと登録できないこと' do
      @user.family_name_furigana = '杉田'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name furigana is invalid')
    end

    # ーーーーーーーーーーーーー以下first_name_furiganaのテストコード（正規表現を含む）ーーーーーーーーーーーーーー

    it 'first_name_furiganaが空では登録できないこと' do
      @user.first_name_furigana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furigana can't be blank", 'First name furigana is invalid')
    end

    it 'first_name_furiganaがカタカナであれば登録できること' do
      @user.first_name_furigana = 'ヒロカズ'
      expect(@user).to be_valid
    end

    it 'first_name_furiganaが平仮名だと登録できないこと' do
      @user.first_name_furigana = 'すぎた'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name furigana is invalid')
    end

    it 'first_name_furiganaが英字だと登録できないこと' do
      @user.first_name_furigana = 'sugita'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name furigana is invalid')
    end

    it 'first_name_furiganaが漢字だと登録できないこと' do
      @user.first_name_furigana = '杉田'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name furigana is invalid')
    end

    # ーーーーーーーーーーーーーfirst_name_furiganaのテストコード（正規表現を含む）ここまでーーーーーーーーーーーーーー

    it 'birthdayが空では登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    # ーーーーーーーーーーーーー以下passwordのテストコード（正規表現を含む）ーーーーーーーーーーーーーー

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", 'Password is invalid', "Password can't be blank", "Password confirmation doesn't match Password")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが6文字以上であれば登録できること' do
      @user.password = '123abc'
      @user.password_confirmation = '123abc'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '123ab'
      @user.password_confirmation = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角英字だけだと登録できないこと' do
      @user.password = 'abcdefg'
      @user.password_confirmation = 'abcdefg'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが半角数字だけだと登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordが半角数字と半角大文字だけだと登録できないこと' do
      @user.password = '123ABC'
      @user.password_confirmation = '123ABC'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    # ーーーーーーーーーーーーーpasswordのテストコード（正規表現を含む）ここまでーーーーーーーーーーーーーー

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@がなければ登録できないこと' do
      @user.email = 'aaa1aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
  end
end
