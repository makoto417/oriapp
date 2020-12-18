class CreatePostConsoles < ActiveRecord::Migration[6.0]
  def change
    create_table :post_consoles do |t|
      t.references :post,    foreign_key: true
      t.references :console, foreign_key: true
      t.timestamps
    end
  end
end
