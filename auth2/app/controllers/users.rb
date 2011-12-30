Auth2.controllers :users do

  get :new, :map => '/signup' do
  	@user = User.new
  	render 'users/new'
  end

  post :create, :map => '/signup' do
  	@user = User.new(params[:user])
    if @user.save
    	flash[:notice] = 'Signed up!'
      redirect url(:pages, :index)
    else
      render 'users/new'
    end
  end

end
