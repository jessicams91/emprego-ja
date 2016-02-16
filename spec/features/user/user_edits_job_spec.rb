require 'rails_helper'

feature 'User creates a new job' do
  scenario 'successfully' do
    sign_in
    company = Company.create(name:     'Campus Code',
                             location: 'São Paulo',
                             mail:     'contato@campuscode.com.br',
                             phone:    '2369-3476')

    new_company = Company.create(name:     'Code Campus',
                                 location: 'Refice',
                                 mail:     'contato@codecampus.com.br',
                                 phone:    '1111-5555')

    category = Category.create(name: 'Desenvolvedor')

    new_category = Category.create(name: 'Dev Ninja')

    job_type = JobType.create(name: 'CLT')

    new_job_type = JobType.create(name: 'Freelancer')

    job = Job.create(title:       'Vaga de Dev',
                     description: 'Dev Junior Rails com ao menos um projeto',
                     location:    'São Paulo',
                     company:     company,
                     category:    category,
                     job_type:    job_type)

    visit edit_job_path(job)

    fill_in 'Nome', with: 'Dev que Master'
    fill_in 'Localização', with: 'Recife'
    select  new_company.name
    select  new_category.name
    select  new_job_type.name
    fill_in 'Descrição', with: 'Vaga para Dev que Master para o Quickstart'

    click_on 'Atualizar Vaga'

    expect(page).to have_content 'Dev que Master'
    expect(page).to have_content 'Recife'
    expect(page).to have_content 'Dev Ninja'
    expect(page).to have_content 'Code Campus'
    expect(page).to have_content 'Freelancer'
    expect(page).to have_content 'Vaga para Dev que Master para o Quickstart'
  end

  scenario 'featured job' do
    sign_in
    company = Company.create(name:     'Campus Code',
                             location: 'São Paulo',
                             mail:     'contato@campuscode.com.br',
                             phone:    '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    job_type = JobType.create(name: 'CLT')

    job = Job.create(title:       'Vaga de Dev',
                     description: 'Dev Junior Rails com ao menos um projeto',
                     location:    'São Paulo',
                     company:     company,
                     category:    category,
                     job_type:    job_type,
                     featured:    false)

    visit edit_job_path(job)

    fill_in 'Nome', with: 'Dev que Master'
    fill_in 'Localização', with: 'Recife'
    select  'Campus Code'
    select  'Desenvolvedor'
    select  'CLT'
    fill_in 'Descrição', with: 'Vaga para Dev que Master para o Quickstart'
    check   'Destaque'

    click_on 'Atualizar Vaga'

    expect(page).to have_content 'Dev que Master'
    expect(page).to have_content 'Recife'
    expect(page).to have_content 'Desenvolvedor'
    expect(page).to have_content 'Campus Code'
    expect(page).to have_content 'CLT'
    expect(page).to have_content 'Vaga para Dev que Master para o Quickstart'
    expect(page).to have_content 'Vaga em Destaque'
  end
end
