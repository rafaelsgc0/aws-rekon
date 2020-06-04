# == Schema Information
#
# Table name: face_compares
#
#  id            :bigint           not null, primary key
#  photo_compare :string
#  result        :json
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  profile_id    :bigint
#
# Indexes
#
#  index_face_compares_on_profile_id  (profile_id)
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#
require 'test_helper'

class FaceCompareTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
