require 'rails_helper'

feature 'Visitor view recent jobs' do
  scenario 'successfully' do
    company = Company.create(name:     'Campus Code',
                             location: 'São Paulo',
                             mail:     'contato@campuscode.com.br',
                             phone:    '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    job_type = JobType.create(name: 'CLT')

    Job.create(title: 'Vaga de Dev',
               description: 'Dev Junior Rails com ao menos um projeto',
               location: 'São Paulo',
               company: company,
               category: category,
               job_type: job_type)

    visit root_path

    # primeira elemento com o css "jobs" da pagina
    within('.jobs:first-child') do
      expect(page).to have_content('Novidade')
    end
  end
end
