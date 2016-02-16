require 'rails_helper'

feature 'User edits a company' do
  scenario 'successfully' do
    sign_in
    company = create_company
    visit edit_company_path(company)

    fill_in 'Nome', with: 'Code Campus'
    fill_in 'Localização', with: 'Recife'
    fill_in 'Email', with: 'contat@codecampus.com.br'
    fill_in 'Telefone', with: '1111-5555'

    click_on 'Atualizar Empresa'

    expect(page).to have_content 'Code Campus'
    expect(page).to have_content 'Recife'
    expect(page).to have_content 'contat@codecampus.com.br'
    expect(page).to have_content '1111-5555'
  end

  scenario 'unless logged in' do
    company = Company.create(name:     'Campus Code',
                             location: 'São Paulo',
                             phone:    '2369-3476',
                             mail:     'contato@campuscode.com.br')

    visit company_path(company)

    expect(page).not_to have_content 'Editar Empresa'
  end

  scenario 'unless it is a company of their own' do
    sign_in
    visit new_company_path

    company = Company.new(name:     'Campus Code',
                          location: 'São Paulo',
                          mail:     'contato@campuscode.com.br',
                          phone:    '2369-3476')

    fill_in 'Nome', with: company.name
    fill_in 'Localização', with: company.location
    fill_in 'Email', with: company.mail
    fill_in 'Telefone', with: company.phone

    click_on 'Criar Empresa'

    click_on 'Sair'

    user = User.create(username:                'Foobar',
                       email:                   'foobar@yahoo.com.br',
                       password:                'brutekey',
                       password_confirmation:   'brutekey')

    visit root_path

    click_on 'Entrar'

    fill_in 'Email',                  with: user.email
    fill_in 'Senha',                  with: user.password

    click_button 'Entrar'

    visit root_path

    click_on company.name

    expect(page).not_to have_link 'Editar Empresa'
  end
end
