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
require 'rails_helper'

RSpec.describe Letter, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
