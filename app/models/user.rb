class User < ApplicationRecord
  has_many :lessons
  has_many :categories, through: :lessons

  before_save :downcase_email

  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, 
                       length: {minimum: 6},
                       allow_nil: true

  def lesson(category)
    lesson = self.lessons.find_by(category: category)
  end

  private
    def downcase_email
      self.email.downcase!
    end
end
