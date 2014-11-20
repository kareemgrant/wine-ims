class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.string :api_id
      t.string :wine_type
      t.string :url
      t.integer :retail_price, default: 0

      t.timestamps
    end
  end
end
