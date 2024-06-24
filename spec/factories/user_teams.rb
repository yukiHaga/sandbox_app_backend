# == Schema Information
#
# Table name: user_teams
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  team_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :user_team do
    user_id { 1 }
    team_id { 1 }
  end
end
