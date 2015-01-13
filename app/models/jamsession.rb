class Jamsession < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :user, presence: true

end
