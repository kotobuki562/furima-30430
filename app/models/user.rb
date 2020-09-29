class User < ApplicationRecord

  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/
  validates :password, presence: true,
            format: { with: VALID_PASSWORD_REGEX}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

        validates :nickname,presence: true
        validates :family_name,presence: true
        validates :first_name,presence: true
        validates :family_name_furigana,presence: true
        validates :first_name_furigana,presence: true
        validates :birthday,presence: true
end
