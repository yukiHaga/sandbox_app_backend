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
class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name
end
