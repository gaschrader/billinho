require 'rails_helper'


describe Institution, type: :model do
  context 'é válido' do
    it 'com nome, cnpj e tipo presentes' do
      institution = build(:institution)
      expect(institution).to be_valid
    end
  end

  context 'não é valido' do
    it 'quando nome não está presente' do
      institution.name = nil
      expect(institution).not_to be_valid
    end

    it 'quando cnpj não está presente' do
      institution.cnpj = nil
      expect(institution).not_to be_valid
    end

    it 'quando tipo não está presente' do
      institution.institution_type = nil
      expect(institution).not_to be_valid
    end
  end
end
