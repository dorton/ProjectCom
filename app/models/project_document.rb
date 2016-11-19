class ProjectDocument < ApplicationRecord
  belongs_to :project
  has_many :comments, dependent: :destroy
  attachment :file
end
