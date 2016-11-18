class ProjectDocument < ApplicationRecord
  belongs_to :project
  has_many :comments
  attachment :file

end
