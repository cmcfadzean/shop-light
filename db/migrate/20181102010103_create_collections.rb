class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :title
      t.string :shopify_id
      t.references :site, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
