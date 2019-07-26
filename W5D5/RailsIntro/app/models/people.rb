# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  house_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class People < ApplicationRecord
    validates :name, :house_id, presence: true

    belongs_to(
        :house,
        class_name: 'House',
        foreign_key: :house_id,
        primary_key: :id
    )
end
