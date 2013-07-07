class CreateEventTable < ActiveRecord::Migration
  def change
  	create_table		:events do |e|
  		e.string		:eventtype
  		e.timestamp	:startdate
  		e.text		:notes
  		e.integer	:person_id
  		e.timestamps
  	end
  end
end
