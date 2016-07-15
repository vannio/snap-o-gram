class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :file_path
      t.text :caption

      t.timestamps
    end
  end
end
