require 'rails_helper'

describe "json shows path to companies for jobs", :type => :request do
  scenario 'successfully' do
    company = create_company
    job = create_job(company: company)

    job_json = JobDecorator.new(job).to_json
    json = JSON.parse(job_json)

    expect(json['title']).to include(job.title)
    expect(json['company_path']).to include("api/companies/#{company.id}")
    expect(json).to_not include("company_id}")
  end
end
