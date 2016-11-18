class CreateProjectDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :project_documents do |t|
      t.string :file_id
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
