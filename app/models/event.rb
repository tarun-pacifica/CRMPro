# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  type       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  notes      :text
#  person_id  :integer
#

class Event < ActiveRecord::Base
  attr_accessible :startdate, :notes, :eventtype
  has_and_belongs_to_many	:persons
end
