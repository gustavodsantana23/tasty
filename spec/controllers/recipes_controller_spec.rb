require 'rails_helper'

RSpec.describe RecipesController, type: :request do
	let!(:recipes) { create_list(:recipe, 10) }
	let(:recipe_id) { recipes.first.id }
	let(:recipe_name) { recipes[3].name }
	let(:recipe_ingredients) { recipes[4].ingredients }

	describe 'GET /recipes' do
		before { get "/recipes" }
		it 'returns recipes' do
			expect(response.body).not_to be_empty
			expect(JSON.parse(response.body).size).to eq(10)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end

	describe 'GET /recipes?name={name}' do
		before { get "/recipes", params: { name: recipe_name}}
		it 'returns recipes filtered by name' do
			expect(response.body).not_to be_empty
			expect(JSON.parse(response.body).first['name']).to eq(recipe_name)
		end
	end

	describe 'GET /recipes?ingredients={ingredients}' do
		before { get "/recipes", params: { ingredients: recipe_ingredients}}
		it 'returns recipes filtered by ingredients' do
			expect(response.body).not_to be_empty
			expect(JSON.parse(response.body).first['ingredients']).to eq(recipe_ingredients)
		end
	end

	describe 'POST /recipes' do
		context 'when the request is valid' do
			let(:valid_recipe) { { name: "miojo", directions: "directions",
														 ingredients: "macarrao",
														 about: "about"
													} }
			before { post "/recipes", params: valid_recipe }

			it 'create a recipe' do
				expect(response.body).not_to be_empty
				expect(JSON.parse(response.body)['name']).to eq("miojo")
			end

			it 'returns status code 200' do
				expect(response).to have_http_status(200)
			end
		end

		context 'when the request is invalid' do
			let(:invalid_recipe) { {directions: "directions",
														 ingredients: "macarrao",
														 about: "about"
														}}
			before { post "/recipes", params: invalid_recipe }

			it 'returns status code 400' do
				expect(response).to have_http_status(400)
			end

			it 'returns message' do
				expect(JSON.parse(response.body)['description']).to eq("The field name can not be empty")
			end
		end
	end

	describe 'PUT /recipes/:id' do
		let(:valid_param) {{ name: "miojo" }}

		before { put "/recipes/#{recipe_id}", params: valid_param}

		it 'updates the recipe' do
			expect(response).to have_http_status(200)
			expect(response.body).not_to be_empty
		end
	end

	describe 'DELETE /recipes/:recipeId' do
		let(:action) { :destroy }
		before { delete "/recipes/#{recipe_id}" }

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end
end
