class Zzz < Padrino::Application
  register SassInitializer
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers

  enable :sessions

  set :delivery_method, :smtp => {
		:address         			=> 'smtp.gmail.com',
		:port            			=>  587,
		:user_name       			=> 'jakisuser@gmail.com',
		:password        			=> 'jakieshaslo',
		:authentication  			=> :plain,
		:enable_starttks_auto => true
	}
	
end
