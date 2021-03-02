require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :nom }
  it { is_expected.to validate_presence_of :prenom }
  it { is_expected.to validate_presence_of :date_de_naissance }
  it { is_expected.to validate_presence_of :sexe }
end
