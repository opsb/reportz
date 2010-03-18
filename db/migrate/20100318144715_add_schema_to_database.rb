class AddSchemaToDatabase < ActiveRecord::Migration
  def self.up
    add_column :databases, :schema, :string
  end

  def self.down
    remove_column :databases, :schema
  end
end
