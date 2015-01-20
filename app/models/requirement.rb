class Requirement < ActiveRecord::Base
  belongs_to :project

  validates :office, presence: true
  validates :title, presence: true
  validates :requirements, presence: true


end
