class CreateCreneaus < ActiveRecord::Migration[6.0]
  def change
    create_table :creneaus do |t|
      t.datetime :date_debut
      t.integer :duree
      t.datetime :date_fin
      t.string :nom

      t.timestamps
    end
  end
end
