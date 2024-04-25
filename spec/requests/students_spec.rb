require 'rails_helper'

describe 'Students API', type: :request do
  it 'returns all students' do
    get '/api/v1/students'

    expect(response).to have_http_status(:success)
  end

  it 'return student with id equal to 1' do
    get '/api/v1/students/1'

    parsed_body = JSON.parse(response.body)
    expect(parsed_body["id"]).to eq(1)
  end
end
