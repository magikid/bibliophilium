class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
