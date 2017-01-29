class DeleteSlugFromPage < ActiveRecord::Migration[5.0]
  change_table :pages do |t|
    t.remove :slug
  end
end
