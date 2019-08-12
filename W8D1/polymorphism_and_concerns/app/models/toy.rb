class Toy < ApplicationRecord
  validates :name, uniqueness: { scope: [:toyable_type, :toyable_id] }
  belongs_to :toyable, polymorphic: true
end
