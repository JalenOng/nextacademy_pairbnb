class SessionsController < Clearance::SessionsController

	def facebook
		
		@user = User.find_or_create_by(auth_hash)
		self.current_user = @user
		redirect_to '/'

	end

	protected

	def auth_hash
		# request.env['omniauth.auth'].permit(:email, :name)
		request.env['omniauth.auth'][:info].permit(:email, :name)

	end




end