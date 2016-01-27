require 'rails_helper'

feature 'User signs up' do
  scenario 'successfully' do
    user = User.new(username:                'John Doe',
                    email:                   'johndoe@yahoo.com.br',
                    password:                'senhabruta',
                    password_confirmation:   'senhabruta')

    visit root_path

    click_on 'Cadastrar'

    fill_in 'Nome de Usuário',        with: user.username
    fill_in 'Email',                  with: user.email
    fill_in 'Senha',                  with: user.password
    fill_in 'Confirmação de Senha',   with: user.password_confirmation

    click_on 'Registrar'

    expect(page).to have_content 'Bem-vindo(a), ' + user.username
  end
end


feature 'User signs in' do
  scenario 'successfully' do
    user = User.create(username:                'John Doe',
                       email:                   'johndoe@yahoo.com.br',
                       password:                'senhabruta',
                       password_confirmation:   'senhabruta')

    visit root_path

    click_on 'Entrar'

    fill_in 'Email',                  with: user.email
    fill_in 'Senha',                  with: user.password

    click_button 'Entrar'

    expect(page).to have_content 'Bem-vindo(a), ' + user.username
  end
end


feature 'User logs out' do
  scenario 'successfully' do
    user = User.create(username:                'John Doe',
                       email:                   'johndoe@yahoo.com.br',
                       password:                'senhabruta',
                       password_confirmation:   'senhabruta')

    visit root_path

    click_on 'Entrar'

    fill_in 'Email',                  with: user.email
    fill_in 'Senha',                  with: user.password

    click_button 'Entrar'

    expect(page).to have_content 'Bem-vindo(a), ' + user.username

    click_on 'Sair'

    expect(page).not_to have_content 'Bem-vindo(a), ' + user.username
  end
end
