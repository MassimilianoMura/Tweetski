require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password

  property :id, Serial
  property :username, Text, unique: true
  property :email, String, unique: true
  property :password_digest, Text

  has n, :peeps

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    @user = first(email: email)
    if @user && BCrypt::Password.new(@user.password_digest) == password
      @user
    end
  end



end
