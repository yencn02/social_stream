class CreatePhoto < ActiveRecord::Migration
  def self.up
    create_table  :photos, :force => true do |t|
      t.integer   :activity_object_id
      t.string    :title
      t.text      :description
      t.string    :photo_file_name
      t.string    :photo_content_type
      t.integer   :photo_file_size
      t.datetime  :photo_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end

end
