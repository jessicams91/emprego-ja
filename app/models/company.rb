class Company < ActiveRecord::Base
  has_many :jobs
  belongs_to :user
  validates :name, :location, :mail, :phone, presence: true

  def premium?
    jobs.count >= 5
  end
end
