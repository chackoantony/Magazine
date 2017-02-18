class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.references :parent, foreign_key: {to_table: :tags}

      t.timestamps
    end
  end
end
