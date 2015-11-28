class Roll < ActiveRecord::Base
  belongs_to :textile

  validates :suffix, presence: true, uniqueness: { scope: :textile },
    length: { is: 1 }, format: { with: /\A[a-z\d]{1}\Z/ }
  validates :location, presence: true, length: { minimum: 3 }
  validates :textile, presence: true, associated: true
end
