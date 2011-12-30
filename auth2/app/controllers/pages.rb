Auth2.controllers :pages do

  get :index, :map => '/' do
  	render 'pages/index'
  end

  get :about, :map => '/about' do
  	render 'pages/about'
  end

end
