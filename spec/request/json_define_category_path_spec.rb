require 'rails_helper'

describe "json shows path to categories for jobs", :type => :request do
  scenario 'successfully' do
    category = create_category
    job = create_job(category: category)

    job_json = JobDecorator.new(job).to_json
    json = JSON.parse(job_json)

    expect(json['title']).to include(job.title)
    expect(json['category_path']).to include("api/categories/#{category.id}")
    expect(json).to_not include("category_id")
  end
end
