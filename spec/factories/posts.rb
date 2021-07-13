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
FactoryBot.define do
  factory :post do
    title { Faker::Movies::Lebowski.character }
    body  { Faker::Movies::Lebowski.quote }
  end
end
