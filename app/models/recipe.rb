class Recipe < ApplicationRecord
	has_many :recipe_tags
	has_many :tags, through: :recipe_tags

	validates_presence_of :name, :ingredients, :directions, :metadata
end
