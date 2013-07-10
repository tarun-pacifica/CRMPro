class AddTablesToEventsAndPeople < ActiveRecord::Migration
  def change
  	create_table 	:events_people do |o|
    o.integer	 	:person_id
    o.integer 	:event_id
    o.integer		:id
		end
	end
end