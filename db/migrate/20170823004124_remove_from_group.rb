class RemoveFromGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :name, :string
    remove_column :groups, :family, :string
    remove_column :groups, :friends, :string
    remove_column :groups, :business, :string
  end
end
