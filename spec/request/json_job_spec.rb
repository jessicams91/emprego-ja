require 'rails_helper'

describe "Job responds", :type => :request do
  it 'confirms json response' do
    job = create_job
    get '/api/jobs/1'

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json['title']).to eq(job.title)
    expect(json['description']).to eq(job.description)
    expect(json['location']).to eq(job.location)
  end
end
