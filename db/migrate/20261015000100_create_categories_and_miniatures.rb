class CreateCategoriesAndMiniatures < ActiveRecord::Migration[8.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.text :description
      t.timestamps
    end
    add_index :categories, "lower(name)", unique: true
    create_table :miniatures do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name, null: false
      t.string :manufacturer
      t.string :universe
      t.string :scale
      t.integer :quantity, null: false, default: 1
      t.string :painting_status, null: false, default: "unpainted"
      t.text :notes
      t.timestamps
    end
    add_index :miniatures, :painting_status
    add_check_constraint :miniatures, "quantity > 0 AND quantity <= 10000", name: "miniatures_quantity_range"
    add_check_constraint :miniatures, "painting_status IN ('unpainted', 'in_progress', 'painted')", name: "miniatures_status_allowed"
  end
end
