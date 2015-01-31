require 'csv'
class State < ActiveRecord::Base
  belongs_to :country
  has_many   :districts, dependent: :destroy
  has_many   :users

  def self.upload(file, country_id)
    names = state_names(file)
    transaction do 
      names.each { |name| State.create name: name, country_id: country_id }
    end
  end

  private

  def self.state_names(file)
    csv = CSV.read file, headers: true
    csv.map { |csv| csv.to_s.strip }
  end
end
