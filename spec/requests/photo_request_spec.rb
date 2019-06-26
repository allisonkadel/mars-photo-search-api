require 'rails_helper'

RSpec.describe 'Photo API', type: :request do

  # GET /api/equipment
  # Return collection of all Equipment

  describe 'GET /api/photos with query [sol = 0] and [camera = fhaz]' do

    context 'when the request is valid' do

      before { get '/api/photos?sol=0&camera=fhaz' }

      it 'returns a status code of 200' do
          expect(response).to have_http_status(200)
      end

      it 'returns a collection of Photos in JSON' do
          json = JSON.parse(response.body, symbolize_names: true)
          expect(json).not_to be_empty
          expect(json.size).to eq(8)
      end

    end

    context 'when the request is invalid' do

      before { get '/api/photos?sol=0' }

      it 'returns a status code of 400' do
        expect(response).to have_http_status(400)
      end

      it 'returns an error message in JSON' do
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json).to_not be_empty
        expect(json[:messages]).to eq(["camera can't be blank"])
      end

    end

  end

end
