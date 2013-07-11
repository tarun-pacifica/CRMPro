module ApplicationHelper
	def intellinav
		links = '<div class="acct_nav">'
		if @auth.present?
			if @auth.is_admin
				links << "<li>#{link_to('Show People', people_path)}</li>"
			end
			links << "<li>#{link_to('Edit', edit_person_path(@auth))}</li>"
			links << "<li>#{link_to('Create Event', new_event_path)}</li>"
			links << "<li>#{link_to('Create Organisation', new_organisation_path)}</li>"
			links << "<li>#{link_to('Logout ' + @auth.name, login_path, :method => :delete, :confirm => 'Really?')}</li>"
			links << "</li>#{link_to('Home', root_path)}</li>"

		else
			links << "#{link_to('Create Account', new_person_path)} | #{link_to('Login', login_path)}"
		end
		links << "</div>"

		links = '<div class="site_nav">'
		links << "#{link_to('Home', home_path)}</li><li>#{link_to('Organisations', organisations_path)}</li><li>#{link_to('People', people_path)}</li>"
		links << '</div>'

	end
end

