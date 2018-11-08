class RecipesController < ApplicationController

	include RecipesHelper

	def show
		# if there is no filtering it returns all recipes
		# filtering by tags
		if params[:tags].present?
			for tag in params[:tags].downcase.split(",")
				@recipes = Recipe.joins(:tags).where(tags: {name: tag})
			end
		else
			@recipes = Recipe.all
		end
		# # filtering by name
		@recipes = @recipes.by_name(params[:name]) if params[:name].present?
		# filtering by ingredients
		if params[:ingredients].present?
			for ingredient in params[:ingredients].downcase.split(",")
				@recipes = @recipes.ingredients(ingredient)
			end
		end
		render json: @recipes, status: 200
	end

	def create
		ok, field = has_basic_params? params
		if ok
			name = params[:name].downcase
			directions = params[:directions]
			ingredients = params[:ingredients].downcase
			about = params[:about]
			recipe = Recipe.create(name: name,
													directions: directions,
												  ingredients: ingredients,
													about: about)
			if !recipe.persisted?
				render json: {description: "Could not create recipe"},
				 status: 400
			end
			if params[:tags].present?
				tag_recipe(recipe, params[:tags])
			end
			render json: recipe, status: 200
		else
			render json: {description: "The field " + field +
			 							" can not be empty"}, status: 400
		end
	end

	def update
		recipe = Recipe.find(params[:recipeId])
		recipe.name = params[:name].downcase if params[:name].present?
		recipe.ingredients = params[:ingredients].downcase if params[:ingredients].present?
		recipe.directions = params[:directions] if params[:directions].present?
		recipe.about = params[:about] if params[:about].present?
		if params[:tags].present?
			tag_recipe(recipe, params[:tags])
		end
		if recipe.save
			render json: recipe, status: 200
		else
			render json: { description: "The recipe could not be updated"}, status: 400
		end
	end

	def destroy
		recipe = Recipe.find(params[:recipeId])
		render json: recipe.delete, status: 200
	end
end
