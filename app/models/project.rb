class Project < ApplicationRecord
  has_many :users, through: :user_projects
  has_many :user_projects
  has_many :project_documents
  has_many :messages
  has_many :comments
end
