# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    nom { 'Mol' }
    prenom { 'Andy' }
    date_de_naissance { '02/07/1997' }
    sexe { 'Masculin' }
    type_de_jeu { 'Compétition' }
    numero_de_licence { '1783573' }
    admin { false }

    trait :administrateur do
      admin { true }
    end
  end
end
