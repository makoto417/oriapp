class AddDefaultToGameId < ActiveRecord::Migration[6.0]
  def change
    change_column :boards, :game_id, :bigint, default: "", null: true
    change_column :posts, :game_id, :bigint, default: "", null: true
  end
end
