class CreateFaceCompares < ActiveRecord::Migration[5.1]
  def change
    create_table :face_compares do |t|
      t.references :profile, foreign_key: true
      t.string :photo_compare
      t.json :result

      t.timestamps
    end
  end
end
