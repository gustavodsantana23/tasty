require 'rails_helper'

RSpec.describe RecipeTag, type: :model do
  it { should belong_to(:tag) }
  it { should belong_to(:recipe) }
end
