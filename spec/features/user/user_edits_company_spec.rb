require 'rails_helper'

feature 'User edits a company' do
  scenario 'successfully' do

    user = User.create(username:                'John Doe',
                       email:                   'johndoe@yahoo.com.br',
                       password:                'senhabruta',
                       password_confirmation:   'senhabruta')

    sign_in

    company = Company.create(name:     'Campus Code',
                             location: 'São Paulo',
                             phone:    '2369-3476',
                             mail:     'contato@campuscode.com.br',
                             user:      user)

    visit root_path

    click_on 'Editar Empresa'

    fill_in 'Name',     with: 'Code Campus'
    fill_in 'Location', with: 'Recife'
    fill_in 'Mail',     with: 'contat@codecampus.com.br'
    fill_in 'Phone',    with: '1111-5555'

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

    visit root_path

    click_on 'Editar Empresa'

    expect(page).to have_button 'Entrar'
  end

  scenario 'unless it is a company of their own' do

    sign_in

    company = Company.create(name:     'Campus Code',
                             location: 'São Paulo',
                             phone:    '2369-3476',
                             mail:     'contato@campuscode.com.br')

    visit root_path

    click_on 'Editar Empresa'

    expect(page).to have_content company.name

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

    click_on 'Editar Empresa'

    expect(page).not_to have_content company.name
  end
end
