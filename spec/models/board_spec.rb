require 'rails_helper'

RSpec.describe Board, type: :model do
  describe '掲示板の保存' do
    before do
      @board = FactoryBot.build(:board)
    end

    context '掲示板が保存される場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@board).to be_valid
      end
      # it 'console_idが空でも保存できる' do
      #   @board.console = nil
      #   expect(@user).to be_valid
      # end

      # it 'categoty_idが空でも保存できる' do
      #   @board.category_id = nil
      #   expect(@board).to be_valid
      # end

      it 'gameが空でも保存できる' do
        @board.game = nil
        expect(@board).to be_valid
      end
    end

    context '掲示板が保存されない場合' do
      it 'titleが空だと保存されない' do
        @board.title = nil
        @board.valid?
        expect(@board.errors.full_messages).to include('タイトルを入力してください')
      end

      it 'userが紐付いていないと保存されない' do
        @board.user = nil
        @board.valid?
        binding.pry
        expect(@board.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
