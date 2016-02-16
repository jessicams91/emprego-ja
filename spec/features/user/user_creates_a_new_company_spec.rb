require 'rails_helper'

feature 'User creates a new company' do
  scenario 'successfully' do
    sign_in
    visit new_company_path
    company = Company.new(name:     'Campus Code',
                          location: 'São Paulo',
                          mail:     'contato@campuscode.com.br',
                          phone:    '2369-3476')

    fill_in 'Nome',     with: company.name
    fill_in 'Localização', with: company.location
    fill_in 'Email',     with: company.mail
    fill_in 'Telefone',    with: company.phone
    click_on 'Criar Empresa'

    expect(page).to have_content company.name
    expect(page).to have_content company.location
    expect(page).to have_content company.mail
    expect(page).to have_content company.phone
  end

  scenario 'invalid' do
    sign_in
    visit new_company_path
    click_on 'Criar Empresa'

    expect(page).to have_content 'Company could not be created.'
  end
end
