require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    it 'nickname,とemailとpassword_confirmationと日本語名と日本語カナ名と生年月日が存在すれば登録できること' do
      expect(@user).to be_valid
    end
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
    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが6文字以上であれば登録できること' do
      @user.password = 'wagawaga2'
      @user.password_confirmation = 'wagawaga2'
      expect(@user).to be_valid
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
    it '日本語カナ名のfirst_nameが空だと登録できないこと' do
      @user.jp_kana_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Jp kana first name can't be blank")
    end
    it '日本語カナ名のlast_nameが空だと登録できないこと' do
      @user.jp_kana_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Jp kana last name can't be blank")
    end
    it '生年月日が空だと保存できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
