class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :title
      t.string :url
      t.string :shopify_url
      t.string :shopify_key
      t.string :logo
      t.string :primary_color

      t.timestamps null: false
    end
  end
end
