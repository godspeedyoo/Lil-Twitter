class User < ActiveRecord::Base
<<<<<<< HEAD
  # # Remember to create a migration!

  validates :username, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
=======
  # Remember to create a migration!
  has_many :tweets
>>>>>>> 17295e5228ad98e4e2cbfa935f951496c47d130a

  include BCrypt

  def password
     @password ||= Password.new(password_hash)
  end

  def password=(pass)
     puts "password=(#{pass}) called"
     @password ||= Password.create(pass)
     self.password_hash = @password
  end

  # def self.create(params)
  #   user = User.new(
  #     :username => params[:username],
  #     :email => params[:email] )
  #   user.password= params[:password]
  #   user.save
  #   user
  # end
end
