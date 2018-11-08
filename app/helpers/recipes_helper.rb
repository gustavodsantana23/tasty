module RecipesHelper

	def has_basic_params?(params)
		if not params[:name].present?
	  	return false, "name"
	  end

	  if not params[:ingredients].present?
	  	return false, "ingredients"
	  end

	  if not params[:directions].present?
	  	return false, "directions"
	  end

	  if not params[:about].present?
	  	return false, "about"
	  end

	  return true
  end

  def tag_recipe(recipe, tags)
		tags = tags.split(",")
		tags.each do |tag|
			tag = tag.strip.downcase
			old_tag = Tag.find_by(name: tag)
			if old_tag
				RecipeTag.create(recipe: recipe, tag: old_tag)
			else
				new_tag = Tag.create(name: tag)
				RecipeTag.create(recipe: recipe, tag: new_tag)
			end
		end
	end
end