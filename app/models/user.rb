class User < ActiveRecord::Base
  include BCrypt

  has_many :tweets
  # has_many :subscriptions
  # looks for all
  has_many :follows, class_name: 'Subscription', :foreign_key => :following_id
  has_many :followers, through: :follows

  has_many :subscriptions, :foreign_key => :follower_id
  has_many :followings, through: :subscriptions




  validates :username, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

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
