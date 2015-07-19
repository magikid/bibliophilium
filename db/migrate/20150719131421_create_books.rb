class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :isbn
      t.references :library, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
