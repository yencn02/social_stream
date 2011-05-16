class CreatePdf < ActiveRecord::Migration
  def self.up
    create_table  :pdfs, :force => true do |t|
      t.integer   :activity_object_id
      t.string    :title
      t.string    :description
      t.string    :pdf_file_name
      t.string    :pdf_content_type
      t.integer   :pdf_file_size
      t.datetime  :pdf_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :pdfs
  end
end
