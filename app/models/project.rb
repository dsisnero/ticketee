class Project < ActiveRecord::Base

  has_many :requirements, dependent: :delete_all

  validates :name, presence: true

end
