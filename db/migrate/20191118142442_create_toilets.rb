class CreateToilets < ActiveRecord::Migration[5.2]
  def change
    create_table :toilets do |t|
      t.string :title
      t.text :description
      t.text :address
      t.string :type
      t.integer :capacity
      t.string :gender
      t.boolean :is_noiseproof
      t.boolean :is_pro
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
