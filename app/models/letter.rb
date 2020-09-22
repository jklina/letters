# == Schema Information
#
# Table name: letters
#
#  id         :bigint           not null, primary key
#  approved   :boolean          default(FALSE), not null
#  body       :text
#  summary    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Letter < ApplicationRecord
  validates :body, :title, :summary, presence: true
  validates :summary, length: { maximum: 200 }

  has_rich_text :body

  def self.approved
    where(approved: true)
  end
end
