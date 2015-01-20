class Project < ActiveRecord::Base

  has_many :requirements

  validates :name, presence: true

end
