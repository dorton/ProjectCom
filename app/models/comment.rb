class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :project_document
end
