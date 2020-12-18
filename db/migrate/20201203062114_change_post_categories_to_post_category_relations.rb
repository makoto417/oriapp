class ChangePostCategoriesToPostCategoryRelations < ActiveRecord::Migration[6.0]
  def change
    rename_table :post_categories, :post_category_relations
    rename_table :post_consoles, :post_console_relations
  end
end
