class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string :name
      t.text :catch_copy
      t.text :concept
      t.references :user
      t.timestamps
    end
  end
end
