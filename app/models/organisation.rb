# == Schema Information
#
# Table name: organisations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :string(255)
#  phone      :string(255)
#  state      :string(255)
#  country    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Organisation < ActiveRecord::Base
  attr_accessible :name, :id, :phone, :state, :address
  has_many	:people
  has_many :events, :through => :person
  #belongs_to :creator, :foreign_key => 'creator_id', :class_name => 'Person'
end
