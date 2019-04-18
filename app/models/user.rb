class User < ApplicationRecord

  enum role_vp: %i[customer admin owner]
  enum gender_vp: %i[male female undefined other]

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/.freeze

  validates :email, presence: true, format: { with: EMAIL_REGEX },
                    uniqueness: true

  before_save { self.email = email.downcase }

  has_secure_password

  has_one :headquarters
  has_many :phones
  has_many :phones, through: :purchases

  def as_json(*)
    super(except: %i[password_digest created_at updated_at] )
  end
end
