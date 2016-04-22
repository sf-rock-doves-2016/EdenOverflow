class User < ActiveRecord::Base


	include BCrypt

 	before_save {self.email.downcase!}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :username, :email, :password, presence: true
  validates :username, length:  { maximum: 25 }
  validates :email, length:     { maximum: 50 },
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }

  has_many :questions
	has_many :answers
	has_many :comments
	has_many :votes

	def password
		@password ||= Password.new(password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end

	def self.authenticate(email, password)
    user_record = User.find_by(email: email)
    if user_record
      true if user_record.password == password
    else
      false
    end

  end
end
