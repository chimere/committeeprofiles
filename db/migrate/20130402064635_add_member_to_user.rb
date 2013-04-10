class AddMemberToUser < ActiveRecord::Migration
  def change
    add_column :users, :title, :string
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :sex, :string
    add_column :users, :address, :text
    add_column :users, :telephone, :string
    add_column :users, :mobile, :string
    add_column :users, :dob, :date
    add_column :users, :state, :string
    add_column :users, :lga, :string
    add_column :users, :constituency, :string
    add_column :users, :party, :string
    add_column :users, :spouse, :string
    add_column :users, :children, :string
  end
end
