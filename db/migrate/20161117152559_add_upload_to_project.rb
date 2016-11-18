class AddUploadToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :project_doc_id, :string
  end
end
