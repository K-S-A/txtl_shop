class Group < ActiveRecord::Base
  has_many :textiles

  validates :title, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3}

end
