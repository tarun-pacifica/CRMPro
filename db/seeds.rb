Person.destroy_all
Organisation.destroy_all
Event.destroy_all

p1 = Person.create(:name => 'Tarun', :surname => 'Mookhey', :mobile => '+61457580728', :email => 'tarun@pacificasearch.com', :state => 'NSW', :password => 'tarun', :password_confirmation => 'tarun' )
p2 = Person.create(:name => 'Hui', :surname => 'Seah', :mobile => '+61457580728', :email => 'huiseah@gmail.com', :state => 'NSW', :password => 'passwind', :password_confirmation => 'passwind')
p3 = Person.create(:name => 'admin', :surname => 'bitch', :mobile => '+61457580728', :email => 'admin@bitch.com', :state => 'NSW', :password => '$$billsyall', :password_confirmation => '$$billsyall')
p3.is_admin = true
p3.save


o1 = Organisation.create(:name => 'Pacifica Search', :phone => '+612 9635 9694', :state => 'NSW', :address =>'Unit 6, 34-36 Sinclair Street, Wollstonecraft')

e1 = Event.create(:eventtype => 'Phone', :startdate => '06/07/2013', :notes => 'Introductory conversation with huiseah to establish paramaters for crmpro. Good call and we agreed to follow up on Monday. TM to draft pricing table prior to meeting.')