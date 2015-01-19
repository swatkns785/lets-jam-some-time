class Jamsession < ActiveRecord::Base
  belongs_to :user
  has_many :attendees
  has_many :users, through: :attendees

  acts_as_mappable lat_column_name: :latitude, lng_column_name: :longitude

  validates :title, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :user, presence: true

  def self.location(jamsession)
    [[jamsession.latitude, jamsession.longitude]]
  end

end
