class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :family
      t.string :friends
      t.string :business
      

      t.timestamps
    end
  end
end
