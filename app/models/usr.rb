class Usr < ActiveRecord::Base
	attr_accessor :password
	attr_accessible :name, :email, :password, :password_confirmation

	validate :name, :presence=>true,:length=>{ :maximum=> 50}
	
	valid_email_regex = /\A[\w+\-.]+@[\w+\-.]+\.[a-z]+\z/i
	
	validate :email, :presence=> true,:formate=>{:with=>valid_email_regex},
					 :uniqueness=>{:case_sensitive=>false}
	
	validates :password, :presence => true,
			  :confirmation => true,
  			  :length => { :within => 6..40 }
  	 	
  	 	before_save :encrypt_password
  	 	
  	 	 def has_password?(submitted_password)
			encrypted_password == encrypt(submitted_password)
		 end
		 def self.authenticate(email, submitted_password)
				usr = find_by_email(email)
				return nil if usr.nil?
				return usr if usr.has_password?(submitted_password)
		end
	
	private
		def encrypt_password
			self.salt = make_salt if new_record
			self.encrypted_password = encrypt(password)
		end
		def encrypt(string)
			secure_hash("#{salt}--#{string}")
		end
		def make_salt
			secure_hash("#{Time.now.utc}--#{password}")
		end
		def secure_hash(string)
			Digest::SHA2.hexdigest(string)
		end
end
