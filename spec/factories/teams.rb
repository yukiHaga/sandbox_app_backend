# == Schema Information
#
# Table name: teams
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :team do
    name { Faker::Name.first_name }
  end
end
