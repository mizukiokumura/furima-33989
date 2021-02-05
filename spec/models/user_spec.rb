require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができる時' do
      it 'nickname,とemailとpassword_confirmationと日本語名と日本語カナ名と生年月日が存在すれば登録できること' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できること' do
        @user.password = 'wagag2'
        @user.password_confirmation = 'wagag2'
        expect(@user).to be_valid
      end
    end
    context 'ユーザー新規登録ができない時' do
      it 'nicknameが空だと登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailアドレスは、@を含む必要があること' do
        @user.email = 'hugehuge'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが５文字以下であれば登録できないこと' do
        @user.password = '1234e'
        @user.password_confirmation = '1234e'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致だと登録できない。' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは半角英数字混合での入力が必須であること' do
        @user.password = 'wagawaga'
        @user.password_confirmation = 'wagawaga'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")
      end
      it '日本語名のfirst_nameが空だと登録できないこと' do
        @user.jp_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Jp first name can't be blank")
      end
      it '日本語名のlast_nameが空だと登録できないこと' do
        @user.jp_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Jp last name can't be blank")
      end
      it 'ユーザー本名のjp_first_nameは、全角(漢字・ひらがな・カタカナでの入力が必須であること' do
        @user.jp_first_name = "hugahuga"
        @user.valid?
        expect(@user.errors.full_messages).to include("Jp first name is invalid. Input full-width characters.")
      end
      it 'ユーザー本名のjp_last_nameが、全角(漢字・ひらがな・カタカナでの入力が必須であること。' do
        @user.jp_last_name = "huga"
        @user.valid?
        expect(@user.errors.full_messages).to include("Jp last name is invalid. Input full-width characters.")
      end
      it '日本語カナ名のfirst_nameが空だと登録できないこと' do
        @user.jp_kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Jp kana first name can't be blank")
      end
      it '日本語カナ名の苗字のフリガナが全角カタカナじゃないと登録できないこと' do
        @user.jp_kana_first_name = '横浜'
        @user.valid?
        expect(@user.errors.full_messages).to include("Jp kana first name is invalid. Input full-widrh katakana characters.")
      end
      it '日本語カナ名のlast_nameが空だと登録できないこと' do
        @user.jp_kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Jp kana last name can't be blank")
      end
      it '日本語カナ名の名前のフリガナは、全角（カタカナ）での入力が必須であること' do 
        @user.jp_kana_last_name = '東京'
        @user.valid?
        expect(@user.errors.full_messages).to include("Jp kana last name is invalid. Input full-widrh katakana characters.")
      end
      it '生年月日が空だと保存できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end

end
