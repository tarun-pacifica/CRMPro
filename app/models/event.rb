# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  eventtype  :string(255)
#  startdate  :datetime
#  notes      :text
#  person_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  enddate    :datetime
#

class Event < ActiveRecord::Base
  attr_accessible :startdate, :notes, :eventtype, :enddate
  belongs_to	:person
  belongs_to :organisation

end
