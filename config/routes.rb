Rails.application.routes.draw do
	get		 'recipes'					 => 	'recipes#show'
	post	 'recipes' 					 => 	'recipes#create'
	put 	 'recipes/:recipeId' => 	'recipes#update'
	delete 'recipes/:recipeId' => 	'recipes#destroy'
end
