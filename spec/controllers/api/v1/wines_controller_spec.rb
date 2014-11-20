require 'rails_helper'

describe Api::V1::WinesController do

  describe 'GET index' do
    let!(:wine_1){ create(:wine, name: 'wine 1') }
    let!(:wine_2){ create(:wine, name: 'wine 2') }

    it 'returns an index of wines' do
      get :index, format: :json

      expect(response).to be_success
      results = JSON.parse(response.body)
      expect(results.count).to eq 2

      expect(results.first['name']).to eq 'wine 1'
      expect(results.last['name']).to eq 'wine 2'
    end
  end

  describe 'PUT update' do
    let!(:wine_1){ create(:wine, name: 'wine 1', retail_price: 1999) }

    context 'wine is found' do
      it 'updates a wine' do
        put :update, {id: wine_1.id, wine: {name: 'Cool Wine', retail_price: 2999}}

        expect(response).to be_success
        result = JSON.parse(response.body)

        expect(result['message']).to eq 'Wine was successfully updated.'
        expect(result['wine']['name']).to eq 'Cool Wine'
        expect(result['wine']['retail_price']).to eq 2999
      end
    end

    context 'wine is not found' do
      it 'returns 400 status with error message' do
        put :update, {id: 777777777, wine: {name: 'Cool Wine', retail_price: 2999}}

        expect(response).to_not be_success
        result = JSON.parse(response.body)

        expect(result['message']).to eq 'Wine not found.'
      end
    end

  end
end
