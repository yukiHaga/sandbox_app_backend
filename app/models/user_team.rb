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
class UserTeam < ApplicationRecord
  belongs_to :user
  belongs_to :team
end
