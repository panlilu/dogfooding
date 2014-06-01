class Appointment < ActiveRecord::Base
  extend Enumerize
  enumerize :lunch, in: {yes: 1, no: 0}, default: 1, scope: true
  enumerize :dinner, in: {yes: 1, no: 0}, default: 1, scope: true

  belongs_to :user
  validates_uniqueness_of :at, scope: :user_id
end
