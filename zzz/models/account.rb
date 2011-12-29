class Account < ActiveRecord::Base
  attr_accessor :password, :password_confirmation

  # Validations
  validates_presence_of     :username, :email
  validates_uniqueness_of		:username, :case_sensitive => false
  validates_presence_of     :password,                   :if => :password_required
  validates_presence_of     :password_confirmation,      :if => :password_required
  validates_length_of       :password, :within => 4..40, :if => :password_required
  validates_confirmation_of :password,                   :if => :password_required
  validates_length_of       :email,    :within => 3..100
  validates_uniqueness_of   :email,    :case_sensitive => false
  validates_format_of       :email,    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  # Callbacks
  before_save :activation_code
  before_save :encrypt_password, :if => :password_required
  
	def activation_code
		self.activation_code = SecureRandom.hex(16).to_s
	end
  ##
  # This method is for authentication purpose
  #
  def self.authenticate(username, password)
    account = first(:conditions => { :username => username }) if username.present?
    account && account.has_password?(password) ? account : nil
  end

  def has_password?(password)
    ::BCrypt::Password.new(crypted_password) == password
  end

  private
    def encrypt_password
      self.crypted_password = ::BCrypt::Password.create(password)
    end

    def password_required
      crypted_password.blank? || password.present?
    end
end
