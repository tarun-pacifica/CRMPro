module ApplicationHelper
def intellinav
		links = ''
		if @auth.present?
			if @auth.is_admin
				links << "<li>#{link_to('Show People', people_path)}</li>"
			end
			# links << "<li>#{link_to('Edit', edit_person_path(@auth))}</li>"
			links << "<li>#{link_to('New Event', new_event_path)}</li>"
			links << "<li>#{link_to('New Organisation', new_organisation_path)}</li>"
			links << "<li>#{link_to('Logout ' + @auth.name + ' ' + @auth.surname, login_path, :method => :delete, :confirm => 'Really?')}</li>"
		else
			links << "<li>#{link_to('New Account', new_person_path)}</li>"
      		links << "<li>#{link_to('Login', login_path)}</li>"
		end
		links
	end
end