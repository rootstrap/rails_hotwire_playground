# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  has_many :columns, dependent: :destroy

  validates :name, presence: true

  after_create_commit  { broadcast_prepend_to 'boards' }
  after_update_commit  { broadcast_replace_to 'boards' }
  after_destroy_commit { broadcast_remove_to 'boards' }
end
