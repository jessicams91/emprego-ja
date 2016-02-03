require 'rails_helper'

describe "json shows paths", :type => :request do
  scenario 'to jobs from company' do
    company = create_company

    get "/api/companies/#{company.id}"
    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json['jobs_path']).to include("api/companies/#{company.id}/jobs")
  end

  scenario 'to jobs from category' do
    category = create_category

    get "/api/categories/#{category.id}"
    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json['jobs_path']).to include("api/categories/#{category.id}/jobs")
  end

  scenario 'to categories from jobs' do
    category = create_category
    job = create_job(category: category)

    get "/api/jobs/#{job.id}"
    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json['category_path']).to include("api/categories/#{category.id}")
    expect(json).to_not include("category_id")
  end

  scenario 'to companies from jobs' do
    company = create_company
    job = create_job(company: company)

    get "/api/jobs/#{job.id}"
    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json['company_path']).to include("api/companies/#{company.id}")
    expect(json).to_not include("company_id}")
  end
end
