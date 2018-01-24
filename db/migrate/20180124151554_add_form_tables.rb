class AddFormTables < ActiveRecord::Migration[5.0]
  def change
    add_column :forms, :topic, :string
    add_column :forms, :from, :string
    add_column :forms, :name, :string
    add_column :forms, :device, :string
    add_column :forms, :os_version, :string
    add_column :forms, :app_name, :string
    add_column :forms, :app_version, :string
    add_column :forms, :build_number, :string
    add_column :forms, :comments, :text
  end
end
