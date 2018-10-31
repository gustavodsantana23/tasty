require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
	let!(:recipes) { create_list(:recipe, 10) }
	let(:recipe_id) { recipes.first.id }

	describe 'GET /recipes' do
		before { get :index }
		it 'returns recipes' do
			expect(response.body).not_to be_empty
			expect(JSON.parse(response.body).size).to eq(10)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end

	end
end
