class AddParentTitleToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :parent_title, :string
  end
end
