require 'rails_helper'

describe "Company responds", :type => :request do
  it 'confirms json response' do
    company = create_company
    get '/api/companies/1'

    json = JSON.parse(response.body)

    expect(response).to be_success
  end
end
