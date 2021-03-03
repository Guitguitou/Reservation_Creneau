# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :nom, :prenom, :date_de_naissance, :sexe, presence: true

  TYPE_DE_JEU = ['Compétition', 'Loisir']
  SEXE = ['Masculin', 'Féminin']
end
