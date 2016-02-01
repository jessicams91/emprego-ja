require 'rails_helper'

describe "Category responds", :type => :request do
  it 'confirms json response' do
    category = create_category
    get '/api/categories/1'

    json = JSON.parse(response.body)

    expect(response).to be_success
  end
end
