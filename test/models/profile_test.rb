# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  email      :string
#  first_name :string
#  last_name  :string
#  picture    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
