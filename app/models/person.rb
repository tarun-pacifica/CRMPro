# == Schema Information
#
# Table name: people
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  surname         :string(255)
#  address         :string(255)
#  mobile          :string(255)
#  email           :string(255)
#  state           :string(255)
#  notes           :string(255)
#  type            :string(255)
#  status          :string(255)
#  organisation_id :string(255)
#  country         :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  is_admin        :boolean          default(FALSE)
#

class Person < ActiveRecord::Base
	has_secure_password
  	attr_accessible :name, :id, :surname, :mobile, :email, :state, :country, :password, :password_confirmation
  	belongs_to	:organisation
  	has_many	:events

  	validates :mobile, :presence => true
  	validates :email, :uniqueness => true
	validates :name, :length => {:minimum => 2 }
	validates :surname, :uniqueness => true, :length => {:minimum => 2 }
end

