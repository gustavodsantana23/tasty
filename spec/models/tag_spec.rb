require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { should have_many(:recipes) }

  it { should validate_presence_of(:name) }
end
