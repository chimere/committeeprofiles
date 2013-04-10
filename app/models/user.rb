class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :title, :fname, :lname, :sex, :address, 
  :telephone, :mobile, :dob, :state, :lga, :constituency, :party, :spouse, :children, :highest_degree, :secondary_school,
  :first_degree, :second_degree, :doctorate, :postdoctorate, :employment_private, :employment_public, :public_first,
  :public_first_date, :first_house_election, :committees_served
  # attr_accessible :title, :body
end
