# == Schema Information
#
# Table name: letters
#
#  id         :bigint           not null, primary key
#  approved   :boolean          default(FALSE), not null
#  body       :text
#  email      :string
#  name       :string
#  summary    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Letter < ApplicationRecord
  validates :body, :title, :summary, :name, :email, presence: true
  validates :summary, length: { maximum: 200 }
  validates_format_of :email, :with => Devise::email_regexp

  has_rich_text :body

  def self.approved
    where(approved: true)
  end
end
