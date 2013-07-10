class CreateOrganisationTable < ActiveRecord::Migration
  def change
  	create_table :organisations do |o|
    o.integer	 	:id
    o.string 		:name
    o.string		:address
    o.string		:phone
    o.string		:state
    o.string		:country
    o.timestamps  
  end
end
end