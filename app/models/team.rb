# == Schema Information
#
# Table name: teams
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Team < ApplicationRecord
  has_many :user_teams
  has_many :users, through: :user_teams
end
