class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.references :project_document, foreign_key: true

      t.timestamps
    end
  end
end
