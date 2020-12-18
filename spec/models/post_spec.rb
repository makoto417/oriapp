require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '投稿の保存' do
    before do
      @post = FactoryBot.build(:post)
    end

    context '投稿が保存される場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@post).to be_valid
      end
      # it 'console_idが空でも保存できる' do
      #   @post.console = nil
      #   expect(@post).to be_valid
      # end

      # it 'categoty_idが空でも保存できる' do
      #   @post.category_id = nil
      #   expect(@post).to be_valid
      # end

      it 'gameが空でも保存できる' do
        @post.game = nil
        expect(@post).to be_valid
      end
    end

    context '投稿が保存されない場合' do
      it 'titleが空だと保存されない' do
        @post.message = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('メッセージを入力してください')
      end

      it 'userが紐付いていないと保存されない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
