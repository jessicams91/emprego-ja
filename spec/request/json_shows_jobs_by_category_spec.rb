require 'rails_helper'

describe "json shows jobs for categories", :type => :request do
  scenario 'successfully' do
    category = create_category
    job = create_job(category: category)
    job2 = create_job(title: 'TESTER', category: category, location: "Curitiba", description: "Lalala")

    get "/api/categories/#{category.id}/jobs"

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.collect{|l| l['title']}).to include(job.title)
    expect(json.collect{|l| l['title']}).to include(job2.title)
    expect(json.collect{|l| l['location']}).to include(job.location)
    expect(json.collect{|l| l['location']}).to include(job2.location)
    expect(json.collect{|l| l['description']}).to include(job.description)
    expect(json.collect{|l| l['category_id']}).to include(job.category.id)
    expect(json.collect{|l| l['description']}).to include(job2.description)
    expect(json.collect{|l| l['category_id']}).to include(job2.category.id)
  end
end
