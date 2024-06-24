# == Schema Information
#
# Table name: items
#
#  id           :bigint           not null, primary key
#  name         :string(255)      not null
#  stock        :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  lock_version :integer
#
class Item < ApplicationRecord
end
