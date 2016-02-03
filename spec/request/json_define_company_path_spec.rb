require 'rails_helper'

describe "json shows path to companies for jobs", :type => :request do
  scenario 'successfully' do
    company = create_company
    category = create_category
    job = create_job(company: company, category: category)

    job_json = JobDecorator.new(job).to_json
    json = JSON.parse(job_json)

    expect(json['title']).to include(job.title)
    expect(json['company_path']).to include("api/companies/#{company.id}")
    expect(json['category_path']).to include("api/categories/#{category.id}")
    # expect(json['company_path']).to include("api/companies/#{company.id}")
    # expect(json['company_path']).to include("api/companies/#{company.id}")
  end
end
