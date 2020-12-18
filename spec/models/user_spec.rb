require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー情報の保存' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザー情報が保存される場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@user).to be_valid
      end
      binding.pry
      # it 'console_idが空でも保存できる' do
      #   @user.console_id = nil
      #   expect(@user).to be_valid
      # end

      # it 'categoty_idが空でも保存できる' do
      #   @user.category_id = nil
      #   expect(@user).to be_valid
      # end

      it 'profileが空でも保存できる' do
        @user.profile = nil
        expect(@user).to be_valid
      end
    end

    context 'ユーザー情報が保存されない場合' do
      it 'nicknameが空だと保存されない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'nicknameが16文字以上だと保存されない' do
        @user.nickname = 'あいうえおかきくけこさしすせそた'
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームは15文字以内で入力してください')
      end
      it '重複するnicknameがあると保存されない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.nickname = @user.nickname
        another_user.valid?
        expect(another_user.errors.full_messages).to include('ニックネームはすでに存在します')
      end
      it 'emailが空だと保存されない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'emailに@がないと保存されない' do
        @user.email = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空だと保存されない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが５文字以下だと保存されない' do
        @user.password = 12_345
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが存在してもpassword_confirmationが空だと保存されない' do
        @user.password = 123_456
        @user.password_confirmation = 111_111
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
    end
  end
end
