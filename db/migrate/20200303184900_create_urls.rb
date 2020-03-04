class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.text :url
      t.string :slug
      t.timestamps null: false
    end
    add_index :urls, :slug
  end
end
