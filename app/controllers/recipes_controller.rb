class RecipesController < ApplicationController
	def index
		@recipes = Recipe.all
		render json: @recipes, status: 200
	end
end
