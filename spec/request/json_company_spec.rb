require 'rails_helper'

describe "Company responds", :type => :request do
  it 'confirms json response' do
    company = create_company
    get '/api/companies/1'

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json['name']).to eq(company.name)
    expect(json['location']).to eq(company.location)
    expect(json['mail']).to eq(company.mail)
    expect(json['phone']).to eq(company.phone)
  end

  it 'returns all ' do
    company = create_company(name: "Empresa 1")
    company2 = create_company(name: "Empresa 2")
    company3 = create_company(name: "Empresa 3")

    get '/api/companies'

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json.collect{|l| l['name']}).to include(company.name)
    expect(json.collect{|l| l['name']}).to include(company2.name)
    expect(json.collect{|l| l['name']}).to include(company3.name)
  end
end
