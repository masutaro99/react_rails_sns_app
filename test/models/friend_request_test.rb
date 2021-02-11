# == Schema Information
#
# Table name: friend_requests
#
#  id         :bigint           not null, primary key
#  approved   :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  askFrom_id :bigint
#  askTo_id   :bigint
#
# Indexes
#
#  index_friend_requests_on_askFrom_id  (askFrom_id)
#  index_friend_requests_on_askTo_id    (askTo_id)
#
# Foreign Keys
#
#  fk_rails_...  (askFrom_id => users.id)
#  fk_rails_...  (askTo_id => users.id)
#
require 'test_helper'

class FriendRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
