require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'ニックネーム、メールアドレス、パスワード、都道府県が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'メールアドレスは、@を含むと登録できる' do
        @user.email = 'test@test'
        expect(@user).to be_valid
      end
      it 'パスワードは、6文字以上、半角英数字混合でパスワードとパスワード（確認）が一致すれば登録できる' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a12345'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'ニックネームは、空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネーム を入力してください")
      end
      it 'メールアドレスは、空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレス を入力してください")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレス はすでに存在します')
      end
      it 'メールアドレスは、@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレス は不正な値です')
      end
      it 'パスワードは、空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード を入力してください")
      end
      it 'パスワードは、6文字未満では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード は6文字以上で入力してください")
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード は不正な値です。英字と数字の両方を含めてください")
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード は不正な値です。英字と数字の両方を含めてください")
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'ｋｋｋｋｋｋ' # 全角の文字を設定
        @user.password_confirmation = 'ｋｋｋｋｋｋ' # 全角の文字を設定
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード は不正な値です。英字と数字の両方を含めてください")
      end
      it 'パスワードとパスワード（確認）が不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用） が一致しません")
      end
      it '都道府県は、空では登録できない' do
        @user.prefecture_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("都道府県 を選択してください")
      end
    end
  end
end
