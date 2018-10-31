FactoryBot.define do
	factory :tag do
		name { Faker::Food.dish }
	end
end