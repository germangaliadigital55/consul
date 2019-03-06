class CreateDownloadSettings < ActiveRecord::Migration
  def change
    create_table :download_settings do |t|
      t.string :modal_name, null: false
      t.string :field_name, null: false
      t.boolean :downloadable, null: false, default: false

      t.timestamps null: false
    end
  end
end
