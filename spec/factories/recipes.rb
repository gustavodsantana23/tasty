FactoryBot.define do
	factory :recipe do
		name { Faker::Food.dish }
		ingredients { Faker::Food.ingredient }
		directions { Faker::Food.description }
		about { Faker::Food.measurement }
	end
end