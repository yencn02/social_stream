 class CreateMusics < ActiveRecord::Migration
  def self.up
    create_table  :musics, :force => true do |t|
      t.integer   :activity_object_id
      t.string    :title
      t.string    :mp3_file_name
      t.string    :mp3_content_type
      t.integer   :mp3_file_size
      t.datetime  :mp3_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :musics
  end
end
