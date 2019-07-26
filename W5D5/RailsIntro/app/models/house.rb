# == Schema Information
#
# Table name: houses
#
#  id         :integer          not null, primary key
#  address    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class House < ApplicationRecord
    validates :address, presence: true

    has_many(
        :residents,
        class_name: 'People',
        foreign_key: :house_id,
        primary_key: :id
    )
end
