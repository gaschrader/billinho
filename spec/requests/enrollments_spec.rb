require 'rails_helper'

describe 'Enrollments API', type: :request do
  it 'returns all enrollments' do
    get '/api/v1/enrollments'

    expect(response).to have_http_status(:success)
  end

  it 'return enrollment with id equal to 1' do
    get '/api/v1/enrollments/1'

    parsed_body = JSON.parse(response.body)
    expect(parsed_body["id"]).to eq(1)
  end
end
