require 'rails_helper'

describe 'Institutions API', type: :request do
  it 'returns all institutions' do
    get '/api/v1/institutions'

    expect(response).to have_http_status(:success)
  end

  it 'return institution with id equal to 1' do
    get '/api/v1/institutions/1'

    parsed_body = JSON.parse(response.body)
    expect(parsed_body["id"]).to eq(1)
  end

  it 'return institution not found' do
    get '/api/v1/institutions/20'

    expect(response).to have_http_status(:success)
  end
end
