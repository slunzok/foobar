Zzz.controllers :accounts do

  get :index do
  	'OK!'
  end

  get :new, :map => 'signup' do
  	@account = Account.new
    render 'accounts/new'
  end

  post :create, :map => 'signup' do
  	@account = Account.new(params[:account])
    if @account.save
    	deliver(:sample, :registration_email, @account.username, @account.email, @account.activation_code)
      flash[:notice] = 'Account was successfully created.'
      redirect url(:accounts, :index)
    else
      render 'accounts/new'
    end
  end

  get :edit do
  end

  put :update do
  end

  delete :destroy do
  end

end
