require 'rails_helper'

describe "json shows path to jobs for companies", :type => :request do
  scenario 'successfully' do
    company = create_company

    get '/api/companies/1'

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json['jobs_path']).to include('companies/1/jobs')
  end
end
