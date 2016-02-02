require 'rails_helper'

describe "json shows jobs for companies", :type => :request do
  scenario 'successfully' do
    company = create_company
    job = create_job(company: company)
    job2 = create_job(title: 'TESTER', company: company)

    get '/api/companies/1/jobs'

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.collect{|l| l['title']}).to include(job.title)
    expect(json.collect{|l| l['title']}).to include(job2.title)
    expect(json.collect{|l| l['location']}).to include(job.location)
    expect(json.collect{|l| l['description']}).to include(job.description)
    expect(json.collect{|l| l['category_id']}).to include(job.category.id)
  end
end
