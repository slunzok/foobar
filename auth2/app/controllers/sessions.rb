Auth2.controllers :sessions do

  get :new, :map => '/login' do
  	render 'sessions/new'
  end

  post :create, :map => '/login' do
  	user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = 'Logged in!'
      redirect url(:pages, :index)
    else
      flash[:error] = 'Invalid email or password'
      render 'sessions/new'
    end
  end

  get :destroy, :map => '/logout' do
  	session[:user_id] = nil
  	flash[:notice] = 'Logged out!'
  	redirect url(:pages, :index)
  end

end
