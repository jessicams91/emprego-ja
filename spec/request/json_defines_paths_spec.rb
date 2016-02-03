require 'rails_helper'

describe "json shows paths", :type => :request do
  scenario 'to jobs from company' do
    company = create_company

    company_json = CompanyDecorator.new(company).to_json
    json = JSON.parse(company_json)

    expect(json['name']).to include(company.name)
    expect(json['jobs_path']).to include("api/companies/#{company.id}/jobs")
  end
  scenario 'to jobs from category' do
    category = create_category

    category_json = CategoryDecorator.new(category).to_json
    json = JSON.parse(category_json)

    expect(json['name']).to include(category.name)
    expect(json['jobs_path']).to include("api/categories/#{category.id}/jobs")
  end

  scenario 'to categories' do
    category = create_category
    job = create_job(category: category)

    job_json = JobDecorator.new(job).to_json
    json = JSON.parse(job_json)

    expect(json['title']).to include(job.title)
    expect(json['category_path']).to include("api/categories/#{category.id}")
    expect(json).to_not include("category_id")
  end

  scenario 'to companies' do
    company = create_company
    job = create_job(company: company)

    job_json = JobDecorator.new(job).to_json
    json = JSON.parse(job_json)

    expect(json['title']).to include(job.title)
    expect(json['company_path']).to include("api/companies/#{company.id}")
    expect(json).to_not include("company_id}")
  end
end
