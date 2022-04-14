class CreateStrains < ActiveRecord::Migration[7.0]
  def change
    create_table :strains do |t|
      t.string :name
      t.string :description
      t.string :terpene
      t.integer :thc_amount
      t.integer :cbd_amount
      t.integer :cbg_amount
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
