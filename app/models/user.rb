class User < ActiveRecord::Base
  has_secure_password
  has_many :magicians, dependent: :destroy
  has_many :todos, dependent: :destroy
  has_many :notes, dependent: :destroy

  validates_presence_of :name, :email
  validates_uniqueness_of :email
  validates_format_of :email,  :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                              uniqueness: { case_sensitive: false }

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end
end
