Zzz.mailer :sample do
  email :registration_email do |name, email, activation_code|
    from 'MyGame Team <jacob10aniv@gmail.com>'
    to email
    subject		'Welcome to the site!'
    locals :name => name, :email => email, :activation_code => activation_code
    render 'sample/registration_email'
    content_type :plain
  end
end
