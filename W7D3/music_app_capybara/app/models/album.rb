# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  live       :boolean          default(FALSE), not null
#  band_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
    validates :title, :year, :live, :band_id, presence: true
    validates :band_id, uniqueness: { scope: :title, message: "should only have one album by a given name." }
    after_intialize :set_defaults

    def set_defaults
        self.live ||= FALSE
    end

    belongs_to :band,
        foreign_key: :band_id,
        class_name: 'Band'
end
