require 'rails_helper'

feature 'Visitor must be authenticated' do
  scenario "except to see company's page" do
    company = create_company

    visit new_company_path
    expect(page).to have_button 'Entrar'

    visit edit_company_path(company)
    expect(page).to have_button 'Entrar'

    visit company_path(company)
    expect(page).not_to have_button 'Entrar'
  end


  scenario "except to see category's page" do
    category = create_category

    visit new_category_path
    expect(page).to have_button 'Entrar'

    visit category_path(category)
    expect(page).not_to have_button 'Entrar'
  end


  scenario "except to see job's page" do

    company = create_company
    category = create_category
    job = create_job

    visit new_job_path
    expect(page).to have_button 'Entrar'

    visit edit_job_path(job)
    expect(page).to have_button 'Entrar'

    visit job_path(job)
    expect(page).not_to have_button 'Entrar'
  end

end
