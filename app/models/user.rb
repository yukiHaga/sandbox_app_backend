# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  first_name :string(255)      not null
#  last_name  :string(255)      not null
#  email      :string(255)      not null
#
class User < ApplicationRecord
  has_many :user_teams
  has_many :teams, through: :user_teams
end
