class User < ActiveRecord::Base
  validates :login, presence: true
  validates :password, length: { minimum: 4 }
  has_secure_password

  has_many :links
  before_create :create_remember_token

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
