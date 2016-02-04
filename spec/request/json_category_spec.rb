require 'rails_helper'

describe 'Category responds', type: :request do
  it 'confirms json response' do
    category = create_category
    get '/api/categories/1'

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json['name']).to eq(category.name)
  end

  it 'returns all ' do
    category = create_category(name: 'Categoria 1')
    category2 = create_category(name: 'Categoria 2')
    category3 = create_category(name: 'Categoria 3')

    get '/api/categories'

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json.collect { |l| l['name'] }).to include(category.name)
    expect(json.collect { |l| l['name'] }).to include(category2.name)
    expect(json.collect { |l| l['name'] }).to include(category3.name)
  end
end
