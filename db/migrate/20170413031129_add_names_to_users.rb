class AddNamesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :names, :string
  end
end
