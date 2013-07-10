class SessionController < ApplicationController
	def new
	end

	def create
		person = Person.where(:email => params[:username]).first
		if person.present? && person.authenticate(params[:password])
			session[:person_id] = person.id
			redirect_to(root_path)
		else
			redirect_to(login_path, :notice => 'Login Error')
		end
	end

	def destroy
		session.delete(:person_id)
		#or session[user.id] = nil
		redirect_to(root_path)
	end
end