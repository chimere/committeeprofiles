class AddEducationToUser < ActiveRecord::Migration
  def change
    add_column :users, :highest_degree, :string
    add_column :users, :secondary_school, :string
    add_column :users, :first_degree, :string
    add_column :users, :second_degree, :string
    add_column :users, :doctorate, :string
    add_column :users, :postdoctorate, :string
  end
end
