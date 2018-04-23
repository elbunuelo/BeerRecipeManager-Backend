class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :mash_time
      t.float :mash_temperature
      t.integer :boil_time
      t.text :notes
      t.references :ingredients, foreign_key: true

      t.timestamps
    end
  end
end
