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

  it 'returns all jobs' do
    job_type = JobType.create(name: 'CLT');
    job = create_job(title: "Desenvolvedor", job_type: job_type)
    job2 = create_job(title: "Tester", job_type: job_type)
    job3 = create_job(title: "Outro", job_type: job_type)

    get '/api/jobs'

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json.collect{|l| l['title']}).to include(job.title)
    expect(json.collect{|l| l['title']}).to include(job2.title)
    expect(json.collect{|l| l['title']}).to include(job3.title)
  end
end
