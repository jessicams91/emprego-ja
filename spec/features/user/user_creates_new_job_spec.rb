require 'rails_helper'

feature 'User creates a new job' do
  scenario 'successfully' do
    sign_in
    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    job_type = JobType.create(name: 'CLT')

    job = Job.new(title: 'Dev Master',
                  location: 'Rio de Janeiro',
                  category: category,
                  job_type: job_type,
                  description: 'Vaga para Dev Master para Bootcamp Rails')

    visit new_job_path

    fill_in 'Nome', with: job.title
    fill_in 'Localização', with: job.location
    select category.name, from: 'Categoria'
    select company.name, from: 'Empresa'
    select job_type.name, from: 'Tipo de Contratação'
    fill_in 'Descrição', with: job.description

    click_on 'Criar Vaga'

    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content job.category.name
    expect(page).to have_content company.name
    expect(page).to have_content job_type.name
    expect(page).to have_content job.description
  end

  scenario 'featured job' do
    sign_in

    company = Company.create(name:     'Campus Code',
                             location: 'São Paulo',
                             mail:     'contato@campus.com.br',
                             phone:    '2369-3476')
    category = Category.create(name: 'Desenvolvedor')
    job_type = JobType.create(name:  'CLT')
    job = Job.new(title:        'Dev Master',
                  location:     'Rio de Janeiro',
                  category:     category,
                  job_type:     job_type,
                  description:  'Vaga para Dev Master para o Bootcamp Rails')

    visit new_job_path
    fill_in 'Nome', with: job.title
    fill_in 'Localização', with: job.location
    select category.name, from: 'Categoria'
    select company.name, from: 'Empresa'
    select job_type.name, from: 'Tipo de Contratação'
    fill_in 'Descrição', with: job.description
    check   'Destaque'

    click_on 'Criar Vaga'

    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content job.category.name
    expect(page).to have_content company.name
    expect(page).to have_content job_type.name
    expect(page).to have_content job.description
    expect(page).to have_content 'Vaga em Destaque'
  end

  scenario 'invalid data' do
    sign_in
    visit new_job_path

    click_on 'Criar Vaga'

    ['Nome', 'Categoria', 'Descrição', 'Localização',
     'Tipo de Contratação'].each do |field|
      expect(page).to have_content "#{field} não pode ficar em branco"
    end
  end
end
