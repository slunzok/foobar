Zzz.controllers :sessions do

	get :new, :map => 'login' do
		render '/sessions/new'
	end

	post :create, :map => 'login' do
		if account = Account.authenticate(params[:username], params[:password])
			set_current_account(account)
			#session[:session_id] = account.id
			redirect url(:base, :index)
		elsif Padrino.env == :development && params[:bypass]
			account = Account.first
			set_current_account(account)
			#session[:session_id] = account.id
			redirect url(:base, :index)
		else
			#params[:email], params[:password] = h(params[:email]), h(params[:password])
			flash[:warning] = 'Login or password wrong.'
			redirect url(:sessions, :new)
		end
	end

  delete :destroy, :map => 'login' do
    set_current_account(nil)
    flash[:warning] = 'Zostales wylogowany! :)'
    redirect url(:sessions, :new)
  end

end
