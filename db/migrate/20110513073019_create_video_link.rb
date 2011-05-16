class CreateVideoLink < ActiveRecord::Migration
  def self.up
    rename_column :musics, :mp3_file_name, :music_file_name
    rename_column :musics, :mp3_content_type, :music_content_type
    rename_column :musics, :mp3_file_size, :music_file_size
    rename_column :musics, :mp3_updated_at, :music_updated_at
    add_column :musics, :description, :text

    create_table  :video_links, :force => true do |t|
      t.integer   :activity_object_id
      t.string    :title
      t.text      :description
      t.string    :link
      t.text      :embed
      t.timestamps
    end

  end

  def self.down
    rename_column :musics, :music_file_name, :mp3_file_name
    rename_column :musics, :music_content_type, :mp3_content_type
    rename_column :musics, :music_file_size, :mp3_file_size
    rename_column :musics, :music_updated_at, :mp3_updated_at
    remove_column :musics, :description
    drop_table :video_links
  end
end
