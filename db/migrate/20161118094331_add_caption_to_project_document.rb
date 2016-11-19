class AddCaptionToProjectDocument < ActiveRecord::Migration[5.0]
  def change
    add_column :project_documents, :caption, :string
  end
end
