require 'rails_helper'

feature 'User creates a new category' do
  scenario 'successfully' do
    sign_in
    category = Category.new(name: 'Desenvolvedor')
    visit new_category_path
    fill_in 'Nome', with: category.name
    click_on 'Criar Categoria'

    expect(page).to have_content category.name
  end

  scenario 'invalid' do
    sign_in
    visit new_category_path
    click_on 'Criar Categoria'

    expect(page).to have_content 'Category não pode ser criado.'
  end
end
