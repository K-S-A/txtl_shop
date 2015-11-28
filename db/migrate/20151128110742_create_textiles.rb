class CreateTextiles < ActiveRecord::Migration
  def change
    create_table :textiles do |t|
      t.string :code
      t.string :name
      t.string :country
      t.string :manufacturer
      t.string :man_code
      t.string :units
      t.integer :height
      t.integer :price
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :textiles, :code, unique: true
  end
end
