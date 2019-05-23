class User < ApplicationRecord

  before_save { self.email = self.email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates(:name, presence: true, length: {maximum: 50})
  validates(:email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX  },
            uniqueness: {case_sensitive: false}
  )

  validates(:password, presence: true, length: {minimum: 6})
  # has_secure_password does a lot of things,
  # for it to work u need Bcrypt and a password digest column in the database
  # it also creates to virtual attributes(?) and validates them in the similar way we validated email and name
  # Also adds an method called authenticate to the corresponding model
  has_secure_password

end
