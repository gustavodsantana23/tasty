# Tasty
This is a API to manage recipes.

## Requirements
- Rails 5.1.6
- Ruby  2.4.1

## Installation
After cloning the repository you should enter some commands to setup the project:
```
$ bundle install
$ rails db:migrate
```

## Running
```
$ rails server
```

## Endpoints
- **GET**  `/recipes` - Retrieve all the recipes
- **GET**  `/recipes?name=name` - Retrieve all the recipes with that `name`
- **GET**  `/recipes?ingredients=ingredient1,ingredient2` - Retrieve recipes that contains ingredients 1 and 2
- **GET**  `/recipes?tags=tag1,tag2` - Retrieve recipes with tag 1 and 2

Note: The _ingredients_ and the _tags_ parameters must be exactly the same that was provided in the creation, and always separated by a comma.

- **POST** `/recipes` - Create a recipe
  ```
    {
      "name": "Macarrão ao sugo",
      "directions": "Cozinhe o macarrão por 10 minutos. Acrescente o molho vermelho.",
      "ingredients": "macarrão, molho de tomate",
      "about": "Rende 4 porçes",
      "tags": "massa, fácil"
    }
  ```
- **PUT**  `/recipes/{id}` - Updates a recipe - The parameters follows the **POST** pattern
- **DELETE** `/recipes/{id}` - Delete a recipe

## Testing
To execute the test rotines you should enter the following command:
`$ bundle exec rspec`
