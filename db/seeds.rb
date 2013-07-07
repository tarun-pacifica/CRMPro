Person.destroy_all
Organisation.destroy_all
Event.destroy_all

p1 = Person.create(:name => 'Tarun', :surname => 'Mookhey', :mobile => '+61457580728', :email => 'tarun@pacificasearch.com', :state => 'NSW' )
p1 = Person.create(:name => 'Hui', :surname => 'Seah', :mobile => '+61457580728', :email => 'huiseah@gmail.com', :state => 'NSW')

o1 = Organisation.create(:name => 'Pacifica Search', :phone => '+612 9635 9694', :state => 'NSW', :address =>'Unit 6, 34-36 Sinclair Street, Wollstonecraft')

e1 = Event.create(:eventtype => 'Phone', :startdate => '06/07/2013', :notes => 'Introductory conversation with huiseah to establish paramaters for crmpro. Good call and we agreed to follow up on Monday. TM to draft pricing table prior to meeting.')