class User < ActiveRecord::Base
  validates_presence_of :name, :team
  validates_uniqueness_of :name, scope: :team
  has_many :appointments
end
