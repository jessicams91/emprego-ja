require 'rails_helper'

feature 'Visitor view premium companies' do
  scenario 'successfully' do
    company = create_company
    category = create_category
    job_type = create_job_type

    5.times do
      Job.create(title:       'Vaga de Dev',
                 description: 'Dev Junior Rails com ao menos um projeto',
                 location:    'São Paulo',
                 company:     company,
                 category:    category,
                 job_type:    job_type)
    end
    visit root_path
    expect(page).to have_content('Empresa Premium')
  end
end
