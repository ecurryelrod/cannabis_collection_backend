class CreateStrainEffects < ActiveRecord::Migration[7.0]
  def change
    create_table :strain_effects do |t|
      t.references :strain, null: false, foreign_key: true
      t.references :effect, null: false, foreign_key: true

      t.timestamps
    end
  end
end
