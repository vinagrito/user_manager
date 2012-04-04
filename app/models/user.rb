class User < ActiveRecord::Base
  
  has_and_belongs_to_many :roles
  
  attr_accessor :password,:password_confirmation
  
  validates_presence_of :name
  validates_presence_of :lastname
  validates_presence_of :username,:uniqueness => true
  validates_presence_of :password
  validates_confirmation_of :password
  
  before_save :create_hashed_password
	after_save :clear_password
  
  def admin?
    roles.map{|r| r.role_name}.include?('Admin')
  end
  
  def self.authenticate(username = '' , password = '')
		user = find_by_username(username)
		if user && user.password_match?(password) && user.admin?
			user
		end
	end
	
	def password_match?(password = "")
		hashed_password == BCrypt::Engine.hash_secret(password,salt)
	end
		
	private
	
	def create_hashed_password
		if password.present?
			self.salt = BCrypt::Engine.generate_salt 
			self.hashed_password = BCrypt::Engine.hash_secret(password,salt)
		end	
	end
	
	def clear_password
		self.password = nil
	end
end
