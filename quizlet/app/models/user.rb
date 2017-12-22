class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :alias, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false } , format: { with: EMAIL_REGEX}
  has_many :bright_ideas
  has_many :likes, dependent: :destroy

  before_save :downcase
  # downcase is a method of the user class, so is a symbol(key)

  def downcase
    self.name.downcase!
    self.alias.downcase!
    self.email.downcase!
  end
  
end
