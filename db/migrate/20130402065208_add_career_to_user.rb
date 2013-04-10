class AddCareerToUser < ActiveRecord::Migration
  def change
    add_column :users, :employment_private, :text
    add_column :users, :employment_public, :text 
    add_column :users, :public_first, :string # first public office held
    add_column :users, :public_first_date, :date # year of first public office
    add_column :users, :first_house_election, :date # year first elected into the House
    add_column :users, :committees_served, :text # other committees served in
  end
end
