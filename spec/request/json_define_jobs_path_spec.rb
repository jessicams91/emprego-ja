require 'rails_helper'

describe "json shows path to jobs for companies", :type => :request do
  scenario 'successfully' do
    company = create_company
    company_json = CompanyDecorator.new(company).to_json

    json = JSON.parse(company_json)
    expect(json['name']).to include(company.name)
    expect(json['jobs_path']).to include("companies/#{company.id}/jobs")
  end
end
