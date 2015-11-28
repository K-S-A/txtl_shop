class Textile < ActiveRecord::Base
  belongs_to :group

  validates :code, presence: true, uniqueness: true,
    format: { with: /\A[a-z\d]{3,10}\Z/ }, length: {minimum: 3, maximum: 10}
  validates :name, presence: true, length: {minimum: 3, maximum: 200},
    format: { with: /\A[A-Z]/ }
  validates :country, length: {is: 2}, format: {with: /\A[A-Z]{2}\Z/},
    allow_nil: true
  validates :units, presence: true, inclusion: {in: %w(m pcs)}
  validates :height, presence: true,
    numericality: {only_integer: true, greater_than: 0, less_than: 500}
  validates :price, presence: true,
    numericality: {only_integer: true, greater_than: 0 }
  validates :group, presence: true, associated: true
end
