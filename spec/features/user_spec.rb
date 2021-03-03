# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users' do
  describe "quand un utilisateur crée son compte" do
    it "affiche les bons champs" do
      visit new_user_registration_path

      expect(page).to have_content 'Nom'
      expect(page).to have_content 'Prénom'
      expect(page).to have_content 'Date de naissance'
      expect(page).to have_content 'Type de jeu'
      expect(page).to have_content 'Numéro de licence'
      expect(page).to have_content 'Sexe'
      expect(page).to have_content 'Adresse mail'
      expect(page).to have_content 'Mot de passe'
    end

    it " crée le compte une fois les champs remplis" do
      visit new_user_registration_path

      fill_in :user_email, with: 'test@exemple.fr'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'
      fill_in :user_prenom, with: 'Guillaume'
      fill_in :user_nom, with: 'Imary'
      select('Compétition', from: :user_type_de_jeu)
      select('Masculin', from: :user_sexe)
      select('15', from: 'user_date_de_naissance_3i')
      select('octobre', from: 'user_date_de_naissance_2i')
      select('1990', from: 'user_date_de_naissance_1i')

      expect do
        click_on 'Sign up'
      end.to change(User, :count)
      user = User.last
      expect(user.email).to eq 'test@exemple.fr'
      expect(user.prenom).to eq 'Guillaume'
      expect(user.nom).to eq 'Imary'
      expect(user.date_de_naissance.strftime('%Y-%m-%-d')).to eq '1990-10-15'
      expect(user.type_de_jeu).to eq 'Compétition'
    end
  end

  describe "quand un utilisateur modifie son compte" do
    let(:user) { create :user }

    before do
      se_connecte_en_tant_qu_user(user)
      visit edit_user_registration_path
    end

    it "affiche les bons champs" do
      expect(page).to have_content 'Nom'
      expect(page).to have_content 'Prénom'
      expect(page).to have_content 'Date de naissance'
      expect(page).to have_content 'Type de jeu'
      expect(page).to have_content 'Numéro de licence'
      expect(page).to have_content 'Sexe'
      expect(page).to have_content 'Adresse mail'
      expect(page).to have_content 'Mot de passe'
    end

    it " modifie le compte une fois les champs remplis" do
      fill_in :user_current_password, with: 'password'
      fill_in :user_prenom, with: 'Guillaume'
      fill_in :user_nom, with: 'Imary'
      select('Compétition', from: :user_type_de_jeu)
      select('Masculin', from: :user_sexe)
      select('15', from: 'user_date_de_naissance_3i')
      select('octobre', from: 'user_date_de_naissance_2i')
      select('1990', from: 'user_date_de_naissance_1i')

      click_on 'Update'

      user = User.last
      expect(user.prenom).to eq 'Guillaume'
      expect(user.nom).to eq 'Imary'
      expect(user.date_de_naissance.strftime('%Y-%m-%-d')).to eq '1990-10-15'
      expect(user.type_de_jeu).to eq 'Compétition'
    end
  end
end
