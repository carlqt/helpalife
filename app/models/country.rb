class Country < ActiveRecord::Base
  has_many :states

  # Validations
  validates :name, presence: true
end
