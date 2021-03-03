class AjouteChampsALaTableUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nom, :string
    add_column :users, :prenom, :string
    add_column :users, :date_de_naissance, :date
    add_column :users, :sexe, :string
    add_column :users, :numero_de_licence, :string
    add_column :users, :type_de_jeu, :string
  end
end
