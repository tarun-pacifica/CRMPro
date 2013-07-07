class CreatePersonTable < ActiveRecord::Migration
def change
  	create_table 	:people do |o|
    o.string	 	:id
    o.string 		:name
    o.string		:surname
    o.string		:address
    o.string		:mobile
    o.string		:email
    o.string		:state
    o.string		:notes
    o.string		:type
    o.string		:status
    o.string        :organisation_id
    o.string    :country
    o.timestamps  
		end
	end
end