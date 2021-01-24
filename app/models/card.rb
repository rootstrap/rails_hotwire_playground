# == Schema Information
#
# Table name: cards
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  column_id  :bigint
#
# Indexes
#
#  index_cards_on_column_id  (column_id)
#
class Card < ApplicationRecord
  belongs_to :column
  acts_as_list scope: :column

  validates :name, presence: true
end
