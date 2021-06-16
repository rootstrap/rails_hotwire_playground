# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_posts_on_title  (title)
#
class Post < ApplicationRecord
  include Navigable

  validates :title, :body, presence: true
end
