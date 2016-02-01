require 'rails_helper'

describe "Job responds", :type => :request do
  it 'confirms json response' do
    job = create_job
    get '/api/jobs/1'

    json = JSON.parse(response.body)

    expect(response).to be_success
  end
end
