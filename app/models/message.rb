# == Schema Information
#
# Table name: messages
#
#  id           :bigint           not null, primary key
#  content      :string
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :bigint
#  sender_id    :bigint
#
# Foreign Keys
#
#  fk_rails_...  (recipient_id => users.id)
#  fk_rails_...  (sender_id => users.id)
#
class Message < ApplicationRecord
end
