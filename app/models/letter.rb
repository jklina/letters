# == Schema Information
#
# Table name: letters
#
#  id         :bigint           not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Letter < ApplicationRecord
  validates :body, :title, presence: true
end
