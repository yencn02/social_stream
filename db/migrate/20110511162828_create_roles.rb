class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
      t.timestamps
    end
    add_column :users, :role_id, :integer
    Role.create([{:name => "student"},{:name => "college"},{:name => "high school director"}])
  end

  def self.down
    drop_table :roles
    remove_column :users, :role_id
  end
end
