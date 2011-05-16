class CreateDocs < ActiveRecord::Migration
  def self.up
    create_table  :docs, :force => true do |t|
      t.integer   :activity_object_id
      t.string    :title
      t.string    :description
      t.string    :doc_file_name
      t.string    :doc_content_type
      t.integer   :doc_file_size
      t.datetime  :doc_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :docs
  end
end
